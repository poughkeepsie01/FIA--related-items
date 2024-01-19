SELECT 
pha.segment1 po_number,
pla.line_num,plla.shipment_num,
msi.segment1 ordered_item,
msi.description ordered_item_description,
pla.unit_price po_unit_price,
rt.transaction_type,
rt.transaction_date,
rt.subinventory,
plla.quantity quantity_ordered,
plla.quantity_received,
pda.quantity_delivered,
plla.quantity_Billed,
rsh.receipt_num,
--aia.invoice_num,
--ail.line_number inv_line_number,
--aid.distribution_line_number inv_dist_number,
--ail.line_type_lookup_code Line_type,
--aid.line_type_lookup_code Dist_line_type,
--aid.amount,
--aid.quantity_invoiced,
--ac.check_number,
--aip.payment_num
FROM 
apps.rcv_transactions rt,
apps.po_headers_all pha,
apps.po_line_locations_all plla,
apps.po_distributions_all pda,
apps.po_lines_all pla,
apps.mtl_system_items msi,
apps.rcv_shipment_headers rsh--,
--apps.ap_invoices_all aia,
--apps.ap_invoice_lines_all ail,
--apps.ap_invoice_distributions_all aid,
--apps.ap_invoice_payments_all aip, 
--apps.ap_checks_all ac
WHERE 1=1 
and rt.po_header_id = pha.po_header_id
and pha.po_header_id = pla.po_header_id
and pla.po_line_id = plla.po_line_id
and plla.line_location_id = pda.line_location_id
and rt.po_line_location_id = plla.line_location_id
and pla.item_id = msi.inventory_item_id 
and rt.po_line_id = pla.po_line_id 
and rt.organization_id = msi.organization_id
and rsh.shipment_header_id = rt. shipment_header_id 
--and aip.check_id = ac.check_id 
--and aia.invoice_id = aip.invoice_id
--and aia.invoice_id = ail.invoice_id 
--and aia.invoice_id = aid.invoice_id 
--and pda.po_distribution_id(+) = aid.po_distribution_id
and rt.transaction_type = 'DELIVER'  
--and ail.line_type_lookup_code = 'ITEM' 
--and aid.line_type_lookup_code = 'ACCRUAL' 
--and pha.segment1 = '&PO_Number'
