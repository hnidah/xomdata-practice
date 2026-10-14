-- Xom Data · Branch code from the invoice number
-- Problem: https://xomdata.com/practice/easy-substr-001
-- Solved: 2026-10-14

-- Write your SQL here
select invoice_code, left(invoice_code,3) as branch_code
from invoices;
