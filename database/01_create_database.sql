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
