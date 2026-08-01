-- Data quality check: found 4 records with corrupted invoice_date values
-- (root cause: last rows in the Excel export were not covered when
-- converting text dates to proper DATE format)

SELECT * FROM sales 
WHERE invoice_date = '0000-00-00' 
   OR YEAR(invoice_date) < 2018;

-- Fix: these 4 records corresponded to invoice numbers 860-864,
-- confirmed as orders placed on 2026-07-31 in the source system (1C)
UPDATE sales 
SET invoice_date = '2026-07-31' 
WHERE sale_id IN (5643, 5644, 5646, 5647);

-- Verification: should return 0 rows
SELECT * FROM sales 
WHERE invoice_date = '0000-00-00' 
   OR YEAR(invoice_date) < 2018;
