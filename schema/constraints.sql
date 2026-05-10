SELECT 
    f.skill_level,
    f.rating AS freelancer_overall_rating,
    s.description,
    sp.package_type,
    COUNT(sp.package_id) AS total_packages,
    MIN(sp.price) AS cheapest_price,
    MAX(sp.price) AS max_price,
    SUM(sp.price) AS total_revenue_potential,
    AVG(sp.price) AS average_package_price
FROM freelancer f
JOIN services s ON f.freelancer_id = s.freelancer_id
JOIN service_packages sp ON s.service_id = sp.service_id
GROUP BY f.skill_level, f.rating, s.description, sp.package_type
ORDER BY f.rating DESC, average_package_price ASC;


CREATE OR REPLACE PROCEDURE get_client_spending_report(p_client_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    WITH ClientTotal AS (
        SELECT client_id, SUM(amount) as total
        FROM orders o
        JOIN payments p ON o.order_id = p.order_id
        WHERE o.client_id = p_client_id
        GROUP BY client_id
    )
    SELECT 
        c.fname, 
        c.lname, 
        COALESCE(ct.total, 0) AS total_spent_to_date
    FROM clients c
    LEFT JOIN ClientTotal ct ON c.client_id = ct.client_id
    WHERE c.client_id = p_client_id;
END;
$$;


CREATE VIEW client_financial_summary AS
WITH client_stats AS (
    SELECT 
        c.client_id,
        CONCAT_WS(' ', c.fname, c.lname) AS client_full_name,
        COUNT(o.order_id) AS total_orders,
        SUM(p.amount) AS lifetime_value,
        AVG(p.amount) AS avg_spent_per_order,
        MAX(p.amount) AS highest_single_payment
    FROM clients c
    LEFT JOIN orders o ON c.client_id = o.client_id
    LEFT JOIN payments p ON o.order_id = p.order_id
    GROUP BY c.client_id, c.fname, c.lname
)
SELECT 
    client_full_name,
    total_orders,
    COALESCE(lifetime_value, 0.00) AS total_revenue,
    COALESCE(avg_spent_per_order, 0.00) AS average_order_value, -- Added comma here
    ROW_NUMBER() OVER (ORDER BY lifetime_value DESC NULLS LAST) AS spending_rank,
    DENSE_RANK() OVER (ORDER BY total_orders DESC) AS volume_rank
FROM client_stats;


DELETE FROM reviews 
WHERE order_id IN (
    SELECT order_id 
    FROM orders 
    WHERE EXTRACT(YEAR FROM order_date) = 2024
);