INSERT INTO clients (client_id, fname, lname, email, join_date)
VALUES
	(1003, 'Timothy','Jeon','jeontimothy@gmail.com','2026-07-03'),
	(1004, 'Renzi','Zheng','renzheng@gmail.com','2026-07-01'),
	(1005, 'Pedro','Gomez','gomezp@gmail.com','2026-06-25'),
	(1006, 'Danny','Marshall','marshalld@gmail.com','2026-06-12'),
	(1007, 'Gabby','Mancinas','mancinasgabby@gmail.com','2026-05-23');


SELECT * 
FROM clients
WHERE client_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO freelancer (freelancer_id, name, skill_level, rating)
VALUES
	(1003,'DanielGoddard260','Expert',4),
	(1004,'ChelseAlvarez198','Beginner',2),
	(1005,'FrancisGoodman543','Intermediate',3),
	(1006,'GaryTatum999','Advanced',5),
	(1007,'EmilyClose569','Intermediate',4);

SELECT * 
FROM freelancer
WHERE freelancer_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO services(service_id, freelancer_id, title, description)
VALUES
    (1003, 245, 'YouTube Gaming Montage', 'High-energy gaming montage with transitions, memes, and sound effects'),
    (1004, 378, 'Wedding Cinematic Edit', 'Romantic wedding highlight video with cinematic color grading'),
    (1005, 512, 'TikTok Short Form Editing', 'Fast-paced vertical edits optimized for TikTok engagement'),
    (1006, 689, 'Corporate Training Video', 'Professional business training video with captions and branding'),
    (1007, 821, 'Podcast Clip Repurposing', 'Convert long-form podcast episodes into short engaging clips');

SELECT * 
FROM services
WHERE service_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO service_packages(package_id, service_id, package_type, price, delivery_days, revisions)
VALUES
    (1003, 1003, 'Basic', 29.99, 5, 2),
    (1004, 1004, 'Standard', 89.99, 4, 4),
    (1005, 1005, 'Premium', 149.99, 2, 8),
    (1006, 1006, 'Basic', 49.99, 6, 3),
    (1007, 1007, 'Standard', 74.99, 3, 5);


SELECT * 
FROM service_packages
WHERE package_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO orders(order_id, client_id, order_date, status)
VALUES
    (1003, 245, '2026-05-07', 'Pending'),
    (1004, 378, '2026-05-07', 'In Progress'),
    (1005, 512, '2026-05-07', 'Completed'),
    (1006, 689, '2026-05-07', 'Pending'),
    (1007, 821, '2026-05-07', 'In Progress');

SELECT * 
FROM orders
WHERE order_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO order_items(order_item_id, order_id, package_id, quantity)
VALUES
    (1003, 1003, 1003, 1),
    (1004, 1004, 1004, 2),
    (1005, 1005, 1005, 1),
    (1006, 1006, 1006, 3),
    (1007, 1007, 1007, 1);

SELECT * 
FROM order_items
WHERE order_item_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO payments(payment_id, order_id, amount, payment_date, method)
VALUES
    (1003, 1003, 29.99, '2026-05-07', 'Credit Card'),
    (1004, 1004, 179.98, '2026-05-07', 'PayPal'),
    (1005, 1005, 149.99, '2026-05-07', 'Debit Card'),
    (1006, 1006, 149.97, '2026-05-07', 'Stripe'),
    (1007, 1007, 74.99, '2026-05-07', 'Credit Card');

SELECT * 
FROM payments
WHERE payment_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO reviews(review_id, order_id, rating, comment)
VALUES
    (1003, 1003, 5, 'Amazing editing quality and fast turnaround time.'),
    (1004, 1004, 4, 'Very professional service, minor revisions needed.'),
    (1005, 1005, 5, 'Exceeded expectations, highly recommend this freelancer.'),
    (1006, 1006, 3, 'Work was solid but communication could improve.'),
    (1007, 1007, 4, 'Great final delivery and easy to work with.');

SELECT * 
FROM reviews
WHERE review_id IN (1003, 1004, 1005, 1006, 1007);


INSERT INTO messages(message_id, client_id, freelancer_id, message, sent_at)
VALUES
    (1003, 245, 245, 'Hi, I would like to discuss edits for my gaming video.', '2026-05-07 10:15:00'),
    (1004, 378, 378, 'Can you make the intro more cinematic?', '2026-05-07 11:30:00'),
    (1005, 512, 512, 'Thanks for the quick revisions on my TikTok clips.', '2026-05-07 12:45:00'),
    (1006, 689, 689, 'Please include subtitles in the training video.', '2026-05-07 14:00:00'),
    (1007, 821, 821, 'Looking forward to the podcast highlight reels!', '2026-05-07 15:20:00');

SELECT * 
FROM messages
WHERE message_id IN (1003, 1004, 1005, 1006, 1007);