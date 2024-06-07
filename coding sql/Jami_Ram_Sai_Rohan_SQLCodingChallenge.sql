--ECOMMERCE DATABASE.
CREATE DATABASE SQLCodingChallengeEcommerce;
USE SQLCodingChallengeEcommerce;

--Creation of Customers Table.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

--Creation of Products Table.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
	description TEXT,
    price DECIMAL(10, 2),
    stockQuantity INT
);

--Creation of Cart Table.
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--Creation of Orders Table.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
	shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Creation of Orderitems Table.
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
	itemAmount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Insert data into the products table.
INSERT INTO products (product_id, name, description, price, stockQuantity)
VALUES
   (1, 'Laptop', 'High-performance laptop', 800.00, 10),
   (2, 'Smartphone', 'Latest smartphone', 600.00, 15),
   (3, 'Tablet', 'Portable tablet', 300.00, 20),
   (4, 'Headphones', 'Noise-canceling', 150.00, 30),
   (5, 'TV', '4K Smart TV', 900.00, 5),
   (6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
   (7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
   (8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
   (9, 'Blender', 'High-speed blender', 70.00, 20),
   (10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

-- Insert data into the customers table.
INSERT INTO customers (customer_id, name, email, password)
VALUES
   (1, 'John Doe', 'johndoe@example.com', '123 Main St, City'),
   (2, 'Jane Smith', 'janesmith@example.com', '456 Elm St, Town'),
   (3, 'Robert Johnson', 'robert@example.com', '789 Oak St, Village'),
   (4, 'Sarah Brown', 'sarah@example.com', '101 Pine St, Suburb'),
   (5, 'David Lee', 'david@example.com', '234 Cedar St, District'),
   (6, 'Laura Hall', 'laura@example.com', '567 Birch St, County'),
   (7, 'Michael Davis', 'michael@example.com', '890 Maple St, State'),
   (8, 'Emma Wilson', 'emma@example.com', '321 Redwood St, Country'),
   (9, 'William Taylor', 'william@example.com', '432 Spruce St, Province'),
   (10, 'Olivia Adams', 'olivia@example.com', '765 Fir St, Territory');

-- Insert data into the orders table.
INSERT INTO orders (order_id, customer_id, order_date, total_price)
VALUES
   (1, 1, '2023-01-05', 1200.00),
   (2, 2, '2023-02-10', 900.00),
   (3, 3, '2023-03-15', 300.00),
   (4, 4, '2023-04-20', 150.00),
   (5, 5, '2023-05-25', 1800.00),
   (6, 6, '2023-06-30', 400.00),
   (7, 7, '2023-07-05', 700.00),
   (8, 8, '2023-08-10', 160.00),
   (9, 9, '2023-09-15', 140.00),
   (10, 10, '2023-10-20', 1400.00);

-- Insert data into the order_items table.
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, itemAmount)
VALUES
   (1, 1, 1, 2, 1600.00),
   (2, 1, 3, 1, 300.00),
   (3, 2, 2, 3, 1800.00),
   (4, 3, 5, 2, 1800.00),
   (5, 4, 4, 4, 600.00),
   (6, 4, 6, 1, 50.00),
   (7, 5, 1, 1, 800.00),
   (8, 5, 2, 2, 1200.00),
   (9, 6, 10, 2, 240.00),
   (10, 6, 9, 3, 210.00);

-- Insert data into the cart table.
INSERT INTO cart (cart_id, customer_id, product_id, quantity)
VALUES
   (1, 1, 1, 2),
   (2, 1, 3, 1),
   (3, 2, 2, 3),
   (4, 3, 4, 4),
   (5, 3, 5, 2),
   (6, 4, 6, 1),
   (7, 5, 1, 1),
   (8, 6, 10, 2),
   (9, 6, 9, 3),
   (10, 7, 7, 2);


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM cart;
SELECT * FROM orders;
SELECT * FROM order_items;

--Queries of Coding Challenge Ecommerce.
--1. Update refrigerator product price to 800.
UPDATE products
SET price = 800.00
WHERE name = 'refrigerator';
SELECT * FROM products;

--2. Remove all cart items for a specific customer.
DELETE FROM cart
WHERE customer_id = 3;
SELECT * FROM cart;

--3. Retrieve Products Priced Below $100.
SELECT * FROM products
WHERE price < 100.00;

--4. Find Products with Stock Quantity Greater Than 5.
SELECT * FROM products
WHERE stockQuantity > 5;

--5. Retrieve Orders with Total Amount Between $500 and $1000.
SELECT * FROM orders
WHERE total_price BETWEEN 500.00 AND 1000.00;

--6. Find Products which name end with letter ‘r’.
SELECT * FROM products
WHERE name LIKE '%r';

--7. Retrieve Cart Items for Customer 5.
SELECT * FROM cart
WHERE customer_id = 5;

--8. Find Customers Who Placed Orders in 2023.
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id FROM orders
    WHERE YEAR(order_date) = 2023
);

--9. Determine the Minimum Stock Quantity for Each Product Category.
SELECT name, MIN(stockQuantity) AS min_stock
FROM products
GROUP BY name;

--10. Calculate the Total Amount Spent by Each Customer.
SELECT a.customer_id, a.name, SUM(b.total_price) AS Total_Spent_by_Customer
FROM customers a
JOIN orders b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.name;

--11. Find the Average Order Amount for Each Customer.
SELECT customer_id, AVG(total_price) AS Avg_Order_Amount_by_Customer
FROM orders
GROUP BY customer_id;

--12. Count the Number of Orders Placed by Each Customer.
SELECT customer_id, COUNT(order_id) AS Order_count_by_Customer
FROM orders
GROUP BY customer_id;

--13. Find the Maximum Order Amount for Each Customer.
SELECT customer_id, MAX(total_price) AS Max_Order_Amount_by_Customer
FROM orders
GROUP BY customer_id;

--14. Get Customers Who Placed Orders Totaling Over $1000.
SELECT a.*
FROM customers a
JOIN orders b ON a.customer_id = b.customer_id
WHERE b.total_price > 1000.00;

--15. Subquery to Find Products Not in the Cart.
SELECT * FROM products
WHERE product_id NOT IN (SELECT product_id FROM cart);

--16. Subquery to Find Customers Who Haven't Placed Orders.
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

--17. Subquery to Calculate the Percentage of Total Revenue for a Product.
SELECT product_id, name, price,
       (price * 100) / (SELECT SUM(total_price) FROM order_items a
JOIN orders b ON a.order_id = b.order_id
WHERE a.product_id = c.product_id) AS percentage_of_revenue
FROM products c;

--18. Subquery to Find Products with Low Stock.
SELECT * FROM products
WHERE stockQuantity < (SELECT AVG(stockQuantity) FROM products);

--19. Subquery to Find Customers Who Placed High-Value Orders.
SELECT a.customer_id, a.name AS Customer_Name, SUM(b.total_price) AS total_order_value
FROM customers a
JOIN orders b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.name
HAVING SUM(b.total_price) > (SELECT avg(total_price) FROM orders);

