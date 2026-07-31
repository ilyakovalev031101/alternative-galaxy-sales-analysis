-- Revenue and order count by month, full history
-- Shows business growth trend over time

SELECT 
    YEAR(invoice_date) AS year,
    MONTH(invoice_date) AS month,
    COUNT(*) AS orders_count,
    SUM(amount) AS total_revenue
FROM sales
GROUP BY YEAR(invoice_date), MONTH(invoice_date)
ORDER BY year, month;