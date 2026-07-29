-- Dodanie danych do tabel

INSERT INTO customers
(first_name, last_name, city, email, registration_date)
VALUES
('Anna','Kowalska','Warsaw','anna@gmail.com','2025-01-10'),
('Piotr','Nowak','Krakow','piotr@gmail.com','2025-02-15'),
('Maria','Wisniewska','Otwock','maria@gmail.com','2025-03-20'),
('Jan','Zielinski','Gdansk','jan@gmail.com','2025-04-05');

INSERT INTO products
(product_name, category, price)
VALUES
('Laptop Lenovo','Electronics',3500),
('Mouse Logitech','Electronics',120),
('Coffee Machine','Home',900),
('Desk Chair','Furniture',600),
('Headphones Sony','Electronics',500);

INSERT INTO orders
(customer_id, order_date, status)
VALUES
(1,'2026-01-10','Completed'),
(2,'2026-01-15','Completed'),
(1,'2026-02-05','Completed'),
(3,'2026-02-20','Cancelled'),
(4,'2026-03-01','Completed');

INSERT INTO order_items
(order_id, product_id, quantity)
VALUES
(1,1,1),
(1,2,2),
(2,3,1),
(3,5,2),
(4,4,1),
(5,1,1);
