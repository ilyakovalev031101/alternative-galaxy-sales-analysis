-- Sales breakdown by channel/warehouse, full history
-- Shows how the business's sales channels evolved over time

SELECT 
    warehouse,
    COUNT(*) AS orders_count,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM sales
GROUP BY warehouse
ORDER BY total_revenue DESC;