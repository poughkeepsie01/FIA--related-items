 SELECT distinct segment1  
 FROM mtl_system_items
 WHERE inventory_item_id IN
          (SELECT item_id
             FROM po_lines_all
            WHERE po_header_id IN
                     (SELECT po_header_id
                        FROM po_headers_all
                       WHERE segment1 IN ('6551183', '6551756', '6552651')));                        

SELECT *
FROM xxia.ias_journal_error
WHERE 1=1
AND (error_key_inf LIKE '%IT00000535%' OR
        error_key_inf LIKE '%MC.MDC-YE-A003%' OR
            error_key_inf LIKE '%MS00001552%' OR
                error_key_inf LIKE '%LF.MDC-YE-A003%')
