-- Average order value by month
-- Shows how customer spending behavior changed over time

SELECT 
    YEAR(invoice_date) AS year,
    MONTH(invoice_date) AS month,
    COUNT(*) AS orders_count,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM sales
GROUP BY YEAR(invoice_date), MONTH(invoice_date)
ORDER BY year, month;