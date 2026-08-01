-- Top 10 customers by total amount spent
-- Customer names anonymized (numbered and ordered by spending rank)

SELECT 
    CONCAT('Customer_', DENSE_RANK() OVER (ORDER BY SUM(amount) DESC)) AS customer_anon,
    COUNT(*) AS orders_count,
    SUM(amount) AS total_spent
FROM sales
GROUP BY customer
ORDER BY total_spent DESC
LIMIT 10;