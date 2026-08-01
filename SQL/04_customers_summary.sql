-- All customers with total amount spent (master list)
-- Customer names anonymized (numbered by spending rank), but list itself ordered alphabetically by original name

SELECT 
    CONCAT('Customer_', DENSE_RANK() OVER (ORDER BY SUM(amount) DESC)) AS customer_anon,
    COUNT(*) AS orders_count,
    SUM(amount) AS total_spent
FROM sales
GROUP BY customer
ORDER BY customer;