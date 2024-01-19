select           
bt_cust.ACCOUNT_NAME  BILL_TO_CUSTOMER,
st_cust.ACCOUNT_NAME SHIP_TO_CUSTOMER,
ra_int.TRX_NUMBER  INVOICE_NUMBER,
ra_int.INTERFACE_LINE_ATTRIBUTE1 REF_NUMBER,
ra_int.INTERFACE_LINE_ATTRIBUTE2 REF_NUMBER2,
ra_int.TRX_DATE INVOICE_DATE,
pcg_sr_line.ITEM_NUMBER ITEM_CODE,
pcg_sr_line.ITEM_DESCRIPTION DESCRIPTION,
ra_int.CURRENCY_CODE CURRENCY,
ra_int.AMOUNT INVOICE_AMOUNT,
pcg_sr_line.SHIPPING_QUANTITY QUANTITY,
pcg_sr_line.UNIT_PRICE UNIT_STANDARD_PRICE,
pcg_sr_line.UNIT_PRICE*pcg_sr_line.SHIPPING_QUANTITY AMOUNT,
'' REMARKS,
ROWNUM RECORD_NUMBER,
ra_int.AMOUNT FRMTD_INVOICE_AMOUNT,
pcg_sr_line.UNIT_PRICE FRMTD_UNIT_PRICE,
(pcg_sr_line.UNIT_PRICE*pcg_sr_line.SHIPPING_QUANTITY) FRMTD_AMOUNT,
stg_if.GL_DATE
from RA_INTERFACE_LINES_ALL ra_int,
XX00IFAR_TRX_HDR_IF_ALL stg_if,
HZ_CUST_ACCOUNTS st_cust,
HZ_CUST_ACCOUNTS bt_cust,
PCG_SR_LINES pcg_sr_line,
PCG_SA_INVOICE_LINES pcg_sa_line,
PCG_SA_INVOICE_HEADERS pcg_sa_hdr,
PCG_SR_HEADERS pcg_sr_hdr
where 1=1
and ra_int.interface_line_attribute1 = stg_if.interface_line_attribute1
and ra_int.INTERFACE_LINE_ATTRIBUTE1 = pcg_sa_line.INVOICE_NUMBER
and pcg_sr_line.PO_NUMBER = pcg_sa_line.PO_NUMBER
and pcg_sa_line.INVOICE_NUMBER = pcg_sa_hdr.INVOICE_NUMBER
and pcg_sr_line.SR_LINE_NUMBER = pcg_sa_line.SR_SEQUENCE_NUMBER
and pcg_sr_hdr.SR_HEADER_ID = pcg_sr_line.SR_HEADER_ID
AND pcg_sa_line.SR_NUMBER = pcg_sr_hdr.SR_NUMBER
AND ra_int.attribute11 is not null
and st_cust.cust_account_id = ra_int.ORIG_SYSTEM_SHIP_CUSTOMER_ID
and bt_cust.cust_account_id = ra_int.ORIG_SYSTEM_BILL_CUSTOMER_ID
and  stg_if.GL_DATE between :GL_DATE_FROM and :GL_DATE_TO
UNION
SELECT bt_cust.ACCOUNT_NAME BILL_TO_CUSTOMER,
st_cust.ACCOUNT_NAME SHIP_TO_CUSTOMER,
ra_int.TRX_NUMBER INVOICE_NUMBER,
ra_int.INTERFACE_LINE_ATTRIBUTE1 REF_NUMBER,
ra_int.INTERFACE_LINE_ATTRIBUTE2 REF_NUMBER2,
ra_int.TRX_DATE INVOICE_DATE,
NULL ITEM_CODE,
ra_int.description DESCRIPTION,
ra_int.CURRENCY_CODE CURRENCY,
ra_int.AMOUNT INVOICE_AMOUNT,
1 QUANTITY,
1 UNIT_STANDARD_PRICE,
ra_int.AMOUNT AMOUNT,
'' REMARKS,
ROWNUM RECORD_NUMBER,
ra_int.AMOUNT FRMTD_INVOICE_AMOUNT,
NULL FRMTD_UNIT_PRICE,
NULL FRMTD_AMOUNT,
stg_if.GL_DATE
FROM   RA_INTERFACE_LINES_ALL ra_int,
XX00IFAR_TRX_HDR_IF_ALL stg_if,
HZ_CUST_ACCOUNTS bt_cust,
HZ_CUST_ACCOUNTS st_cust
where bt_cust.cust_account_id(+) = ra_int.ORIG_SYSTEM_BILL_CUSTOMER_ID
and st_cust.cust_account_id(+) = ra_int.ORIG_SYSTEM_SHIP_CUSTOMER_ID
and ra_int.interface_line_attribute1 = stg_if.interface_line_attribute1
AND ra_int.attribute11 is not null
and  stg_if.GL_DATE between :GL_DATE_FROM and :GL_DATE_TO
and (ra_int.INTERFACE_LINE_ATTRIBUTE1 LIKE '%CN%'
or ra_int.INTERFACE_LINE_ATTRIBUTE1 LIKE '%DN%'
or ra_int.INTERFACE_LINE_ATTRIBUTE1 LIKE '%BS%')
                                        
                                
