-- Average order value by warehouse/channel, last 10 months
-- Investigates the drop in average order value observed from Feb 2026
-- Business context: strategic shift toward paints (lower price, higher margin)
-- over miniatures/kits (higher price, lower margin) starting ~Feb 2026

SELECT 
    warehouse,
    YEAR(invoice_date) AS year,
    MONTH(invoice_date) AS month,
    COUNT(*) AS orders_count,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM sales
WHERE invoice_date >= '2025-10-01'
GROUP BY warehouse, YEAR(invoice_date), MONTH(invoice_date)
ORDER BY year, month, warehouse;