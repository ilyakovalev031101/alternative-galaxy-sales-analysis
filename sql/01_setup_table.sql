-- Table created automatically during CSV import (1C export) via phpMyAdmin
-- Below: actual table structure + data cleaning queries executed manually

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_date DATE,
    invoice_number INT,
    customer VARCHAR(35),
    amount DECIMAL(12,2),
    currency VARCHAR(3),
    warehouse VARCHAR(16),
    operation VARCHAR(18)
);

-- Post-import cleanup: remove thousand separators, fix data types
UPDATE sales SET amount = REPLACE(amount, ',', '');
ALTER TABLE sales MODIFY amount DECIMAL(12,2);
ALTER TABLE sales MODIFY invoice_date DATE;