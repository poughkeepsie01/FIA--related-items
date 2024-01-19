SELECT *
FROM xx00ifap_invoice_hdr_stg_all
WHERE 1=1
AND process_status != 'INTERFACED'
AND TO_CHAR(invoice_date,'YYYY') = TO_CHAR(SYSDATE,'YYYY');

SELECT *
FROM po_headers_all
WHERE segment1 = '6556327';

SELECT *
FROM po_lines_all
WHERE po_header_id = 7995595;

SELECT *
FROM fnd_user
WHERE user_id = 14281;


SELECT je_header_num, je_line_num, je_category_key, accounting_date, reference10, segment1 ||'.'|| segment2 ||'.'|| segment3 ||'.'|| segment4 ||'.'|| segment5 ||'.'|| segment6 ||'.'|| 
       segment7 ||'.'|| segment8 ||'.'|| segment9 ||'.'|| segment10 ||'.'|| segment11 segments, process_status , error_message
FROM xx00ifgl_journal_stg_all
WHERE 1=1
AND process_status != 'INTERFACED';