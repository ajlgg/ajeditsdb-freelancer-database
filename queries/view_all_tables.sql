SELECT 
    c.client_id,
    c.fname,
    c.lname,
    
    f.name AS freelancer_name,
    f.skill_level,
    
    s.title AS service_title,
    sp.package_type,
    sp.price,
    
    o.order_id,
    o.status AS order_status,
    o.order_date,
    
    oi.quantity,
    p.amount AS amount_paid,
    p.method AS payment_method,
    
    r.rating AS client_rating,
    r.comment AS review_text,
    
    m.message AS last_message,
    m.sent_at AS message_time

FROM clients c
JOIN orders o ON c.client_id = o.client_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN service_packages sp ON oi.package_id = sp.package_id
JOIN services s ON sp.service_id = s.service_id
JOIN freelancer f ON s.freelancer_id = f.freelancer_id

LEFT JOIN payments p ON o.order_id = p.order_id
LEFT JOIN reviews r ON o.order_id = r.order_id

LEFT JOIN messages m ON c.client_id = m.client_id AND f.freelancer_id = m.freelancer_id

ORDER BY o.order_date DESC
LIMIT 10;