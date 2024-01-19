SELECT      rt.attribute1 DR_NUMBER,  
            rrsl.period_name RCV_PERIOD,          
            TRUNC(rt.transaction_date) TRANSACTION_DATE,
            rrsl.period_name,            
            rrsl.reference4 PO_NUMBER,
            rrsl.accounting_date,            
            rrsl.reference2 PO_HEADER_ID,
            rrsl.rcv_transaction_id,
            aida.po_distribution_id,
            aia.invoice_id,
            pda.gl_cancelled_date,
            aida.period_name AP_PERIOD,
            aia.invoice_num,            
            aia.attribute11 INTERFACED
FROM        rcv_receiving_sub_ledger rrsl
LEFT JOIN   rcv_transactions rt
     ON     rrsl.rcv_transaction_id = rt.transaction_id
     AND    rt.po_header_id = rrsl.reference2
--     AND    rrsl.accounting_date = TRUNC(rt.transaction_date)
LEFT JOIN   po_headers_all pha
     ON     pha.po_header_id = rrsl.reference2
     AND    pha.po_header_id = rt.po_header_id 
LEFT JOIN   po_distributions_all pda
     ON     pda.po_header_id = pha.po_header_id  
     AND    pda.po_header_id = rrsl.reference2
     AND    pda.po_header_id = rt.po_header_id 
LEFT JOIN   ap_invoice_distributions_all aida
     ON     aida.po_distribution_id = pda.po_distribution_id
     AND    aida.po_distribution_id = rt.po_distribution_id 
--     AND    aida.period_name = rrsl.period_name
LEFT JOIN   ap_invoices_all aia
     ON     aia.invoice_id = aida.invoice_id     
WHERE 1=1
--AND rt.destination_type_code = 'EXPENSE'
--AND rrsl.period_name IN ('JAN-2019')
AND rrsl.period_name IN ('DEC-2019') --,'APR-2018','MAY-2018','JUN-2018','JUL-2018','AUG-2018','SEP-2018','OCT-2018','NOV-2018','DEC-2018')              
GROUP BY    rt.attribute1,            
            TRUNC(rt.transaction_date),
            rrsl.period_name,            
            rrsl.reference4 ,
            rrsl.reference2 ,
            rrsl.rcv_transaction_id,
            aida.po_distribution_id,
            aia.invoice_id,
            pda.gl_cancelled_date,
            aia.invoice_num,
            aia.attribute11,
            rrsl.accounting_date,
            rrsl.period_name,
            aida.period_name
ORDER BY    TRUNC(rt.transaction_date),
            rt.attribute1,
            aia.invoice_num;
