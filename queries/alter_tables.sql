ALTER TABLE clients ADD COLUMN phone_number VARCHAR(15);
UPDATE clients SET email = REPLACE(email, '@gmail.com', '@ajedits.com');


ALTER TABLE freelancer ADD COLUMN bio TEXT;
UPDATE freelancer SET name = UPPER(name);


ALTER TABLE services ADD COLUMN category VARCHAR(50);
UPDATE services SET description = CONCAT('Project: ', description) WHERE description NOT LIKE 'Project%';


ALTER TABLE service_packages ADD COLUMN on_sale BOOLEAN DEFAULT FALSE;
UPDATE service_packages SET price = price * 0.9 WHERE package_type = 'Basic';



ALTER TABLE orders ADD COLUMN completed_at DATE;
UPDATE orders SET status = 'Completed' WHERE order_date < '2025-01-01';

ALTER TABLE payments ADD COLUMN transaction_id VARCHAR(100);
UPDATE payments SET method = CONCAT('Verified ', method);

ALTER TABLE reviews ADD COLUMN featured BOOLEAN DEFAULT FALSE;
UPDATE reviews SET comment = SUBSTR(comment, 1, 50) WHERE LENGTH(comment) > 50;


ALTER TABLE messages ADD COLUMN is_read BOOLEAN DEFAULT FALSE;
UPDATE messages SET message = TRIM(message);