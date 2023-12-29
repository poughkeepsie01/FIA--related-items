select  hz1.account_name "CUSTOMER_NAME"
        ,hz3.party_name "SHIP_TO"
        ,''''||raint.trx_number "INVOICE_NUMBER"
        ,raint.interface_line_attribute1 "REFERENCE_NUMBER"
        ,raint.trx_date "TRANSACTION_DATE"
        ,raint.amount "INVOICE_AMOUNT"
        ,raint.currency_code "CURRENCY"
        ,saline.SALES_ITEM_NUMBER "MODEL_NAME"
        ,srline.unit_price "SELLING_PRICE"
        ,raint.quantity_ordered "SOLD_QUANTITY"
        ,raint.amount "TOTAL_AMOUNT"
from    ra_interface_lines_all raint
        ,pcg_sa_invoice_headers sahdr
        ,pcg_sa_invoice_lines saline
        ,pcg_sr_headers srhdr
        ,pcg_sr_lines srline
        ,hz_cust_accounts hz1
        ,hz_cust_accounts hz2
        ,hz_parties hz3
WHERE   1=1
AND     raint.INTERFACE_LINE_ATTRIBUTE1 = saline.INVOICE_NUMBER
AND     saline.INVOICE_NUMBER = sahdr.INVOICE_NUMBER
AND     srhdr.SR_HEADER_ID = srline.SR_HEADER_ID   
AND     srline.PO_NUMBER = saline.PO_NUMBER 
AND     srline.SR_LINE_NUMBER = saline.SR_SEQUENCE_NUMBER
AND     saline.SR_NUMBER = srhdr.SR_NUMBER
AND     hz1.cust_account_id = raint.ORIG_SYSTEM_BILL_CUSTOMER_ID
AND     hz2.cust_account_id = raint.ORIG_SYSTEM_SHIP_CUSTOMER_ID
AND     hz2.party_id = hz3.party_id
AND     to_char(raint.trx_date,'YYYYMMDD') between '20171001' and '20171031'
AND     raint.INTERFACE_LINE_ATTRIBUTE1 IN ('H710-129153')
GROUP BY hz1.account_name
        ,hz3.party_name
        ,raint.trx_number
        ,raint.interface_line_attribute1
        ,raint.trx_date
        ,raint.amount
        ,raint.currency_code
        ,saline.SALES_ITEM_NUMBER
        ,srline.unit_price
        ,raint.quantity_ordered
        ,raint.amount
order by raint.trx_number