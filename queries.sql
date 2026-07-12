-- 1. Display all customers
SELECT * FROM Customer;


-- 2. product_name and category where price between 5000 and 10000
SELECT Product_Name, Category
FROM Product
WHERE Price BETWEEN 5000 AND 10000;


-- 3. All products sorted by price DESC
SELECT *
FROM Product
ORDER BY Price DESC;


-- 4. total orders, avg amount, max and min total_amount
SELECT 
    COUNT(*) AS total_orders,
    AVG(Total_amount) AS avg_amount,
    MAX(Total_amount) AS max_amount,
    MIN(Total_amount) AS min_amount
FROM Orders;


-- 5. number of orders for each product_id
SELECT Product_id, COUNT(*) AS number_of_orders
FROM Orders
GROUP BY Product_id;


-- 6. customers who have more than 2 orders
SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;


-- 7. number of orders per month in 2020
SELECT 
    MONTH(OrderDate) AS month,
    COUNT(*) AS number_of_orders
FROM Orders
WHERE YEAR(OrderDate) = 2020
GROUP BY MONTH(OrderDate)
ORDER BY month;


-- 8. for each order show product_name, customer_name, order date
SELECT 
    p.Product_Name,
    c.Customer_Name,
    o.OrderDate
FROM Orders o
JOIN Product p ON o.Product_id = p.Product_id
JOIN Customer c ON o.Customer_id = c.Customer_id;


-- 9. orders made 3 months ago
SELECT *
FROM Orders
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
AND OrderDate < DATE_SUB(CURDATE(), INTERVAL 2 MONTH);


-- 10. customers who never ordered
SELECT Customer_id
FROM Customer
WHERE Customer_id NOT IN (
    SELECT Customer_id FROM Orders
);