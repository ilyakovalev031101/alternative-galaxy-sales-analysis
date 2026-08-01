-- Channel evolution over time: shows the offline-to-online transition
-- Желтоксан (offline store) wound down through 2022, last active month Nov 2022
-- Свободная (online warehouse) ramped up starting Nov-Dec 2022
-- Business context: offline location closed due to high operating costs

SELECT 
    warehouse,
    YEAR(invoice_date) AS year,
    MONTH(invoice_date) AS month,
    COUNT(*) AS orders_count,
    SUM(amount) AS total_revenue
FROM sales
WHERE warehouse IN ('Желтоксан, 155', 'Свободная, 142/1')
  AND invoice_date BETWEEN '2022-01-01' AND '2023-03-31'
GROUP BY warehouse, YEAR(invoice_date), MONTH(invoice_date)
ORDER BY warehouse, year, month;