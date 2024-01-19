SELECT *
FROM dba_objects
WHERE object_name LIKE '%LASTPAY%'

SELECT *
FROM tip_lastpay_headers_interface
WHERE 1=1
AND document_num = 'PRF44104'
AND employee_num = 'T090593115C0034' 

SELECT *
FROM tip_lastpay_lines_interface
WHERE 1=1
AND document_num = 'PRF44104'
AND employee_num = 'T090593115C0034' 

SELECT *
FROM ap_invoices_interface
WHERE 1=1
AND invoice_num = 'PRF44104'
AND vendor_num = 'T090593115C0034'
--2611376
--87040

SELECT *
FROM ap_invoice_lines_interface
WHERE 1=1
AND invoice_id = 2611376
--AND invoice_num = 'PRF44104'
--AND vendor_num = 'T090593115C0034'


22230
1293390
1293429
1293418
