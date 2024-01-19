SELECT *
FROM ap_invoices_interface
WHERE invoice_num = 'PRF44104'
AND vendor_num = 'T090593115C0034'

SELECT amount, dist_code_combination_id
FROM ap_invoice_lines_interface
WHERE invoice_id = 2611376
ORDER BY 1

SELECT *
FROM ap_invoices_all
WHERE invoice_num = 'PRF44104'
AND invoice_amount = '43680.65'


SELECT amount, default_dist_ccid
FROM ap_invoice_lines_all
WHERE invoice_id = 3648617
ORDER BY 1