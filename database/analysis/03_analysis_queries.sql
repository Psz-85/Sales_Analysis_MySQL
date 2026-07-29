-- 1. Które produkty sprzedają się najlepiej?

SELECT
    p.product_name,
    p.price,
    SUM(oi.quantity) AS quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name, p.price
ORDER BY quantity_sold DESC;


-- 2. Które produkty generują największy przychód?

SELECT
    p.product_name,
    p.price,
    SUM(oi.quantity) AS quantity_sold,
    SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name, p.price
ORDER BY revenue DESC;


-- 3. Którzy klienci generują największą wartość sprzedaży?

SELECT
    CONCAT(c.first_name,' ',c.last_name) AS customer,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY customer
ORDER BY total_spent DESC;


-- 4. Ile zamówień ma poszczególny status?

SELECT
    status,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY status;


-- 5. Jaka jest średnia wartość zamówienia?

SELECT
AVG(order_value) AS average_order_value
FROM
(
    SELECT
        o.order_id,
        SUM(p.price * oi.quantity) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) AS order_summary;
