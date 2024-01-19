SELECT aps.vendor_name,
       aps.segment1 vendor_code,
       apssa.vendor_site_code,
       gcc.segment1 ||'.'|| gcc.segment2 ||'.'|| gcc.segment3 ||'.'|| gcc.segment4 ||'.'|| gcc.segment5 ||'.'|| gcc.segment6 ||'.'|| 
       gcc.segment7 ||'.'|| gcc.segment8 ||'.'|| gcc.segment9 ||'.'|| gcc.segment10 ||'.'|| gcc.segment11 liability_account
FROM ap_suppliers aps,
     ap_supplier_sites_all apssa,
     gl_code_combinations gcc     
WHERE 1=1
AND aps.vendor_id = apssa.vendor_id
AND gcc.code_combination_id = apssa.accts_pay_code_combination_id
AND aps.vendor_type_lookup_code = 'VENDOR'
--AND aps.vendor_name LIKE '%2M TECHNOLOGIES AND EQUIPMENT SUPPLIES, INC.%'
AND aps.enabled_flag = 'Y'
