-- Utworzenie nowej bazy danych
CREATE DATABASE sales_analysis;

-- Wybór bazy, na której będziemy pracować
USE sales_analysis;

-- Tworzenie tabel
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(8,2)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),

    -- Utworzenie relacji między zamówieniami a klientami
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    -- Relacja między tabelą order_items i orders. Pokazuje, do którego zamówienia należy produkt
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),


    -- Relacja między tabelą order_items i products. Pokazuje, jaki produkt został zamówiony
    FOREIGN KEY(product_id)
    REFERENCES products(product_id)
);

-- Dodawanie danych do tabel

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
