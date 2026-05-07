CREATE TABLE clients(
	client_id SERIAL PRIMARY KEY,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	join_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE freelancer(
	freelancer_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	skill_level VARCHAR(50),
	rating INT DEFAULT 0 CHECK (rating BETWEEN 0 and 5)
);

CREATE TABLE services(
	service_id SERIAL PRIMARY KEY,
	freelancer_id INT NOT NULL REFERENCES freelancer(freelancer_id),
	title VARCHAR(150) NOT NULL,
	description TEXT
);

CREATE TABLE service_packages(
	package_id SERIAL PRIMARY KEY,
	service_id INT NOT NULL REFERENCES services(service_id),
	package_type VARCHAR(20) NOT NULL
		CHECK (package_type IN ('Basic', 'Standard', 'Premium')),
	price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
	delivery_days INT NOT NULL CHECK (delivery_days > 0),
	revisions INT NOT NULL CHECK (revisions >= 0)
);

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	client_id INT NOT NULL REFERENCES clients(client_id),
	order_date DATE DEFAULT CURRENT_DATE,
	status VARCHAR(50) NOT NULL
		CHECK (status IN ('Pending', 'In Progress', 'Completed'))
);

CREATE TABLE order_items(
	order_item_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL REFERENCES orders(order_id),
	package_id INT NOT NULL REFERENCES service_packages(package_id),
	quantity INT NOT NULL CHECK (quantity > 0)
);

CREATE TABLE payments(
	payment_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL UNIQUE REFERENCES orders(order_id),
	amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
	payment_date DATE DEFAULT CURRENT_DATE,
	method VARCHAR(50) NOT NULL
);

CREATE TABLE reviews(
	review_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL UNIQUE REFERENCES orders(order_id),
	rating INT NOT NULL CHECK (rating BETWEEN 1 and 5),
	comment TEXT
);

CREATE TABLE messages(
	message_id SERIAL PRIMARY KEY,
	client_id INT NOT NULL REFERENCES clients(client_id),
	freelancer_id INT NOT NULL REFERENCES freelancer(freelancer_id),
	message TEXT NOT NULL,
	sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);