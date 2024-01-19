SELECT transaction_type_name,
       organization_code org,
       subinventory_code sub_code,
       transfer_organization_code transfer_org,
       transfer_subinventory_code transfer_sub,
       dr_account_flex_field1 || '.' || dr_account_flex_field2 || '.' || dr_account_flex_field3 || '.' || dr_account_flex_field4 || '.' || dr_account_flex_field5 || '.' || dr_account_flex_field6 || '.' ||  dr_account_flex_field7
       || '.' || dr_account_flex_field8 || '.' || dr_account_flex_field9 || '.' || dr_account_flex_field10 || '.' || dr_account_flex_field11 TO_FIELD ,
       cr_account_flex_field1 || '.' || cr_account_flex_field2 || '.' || cr_account_flex_field3 || '.' || cr_account_flex_field4 || '.' || cr_account_flex_field5 || '.' || cr_account_flex_field6 || '.' ||  cr_account_flex_field7
       || '.' || cr_account_flex_field8 || '.' || cr_account_flex_field9 || '.' || cr_account_flex_field10 || '.' || cr_account_flex_field11 FROM_FIELD    ,
       dr_attribute11,
       dr_attribute13,
       cr_attribute11,
       cr_attribute13,
       cr_attribute17,
       dr_attribute17,
       created_by,
       creation_date,
       last_update_date   
FROM xxia.ias_org_acc_codes
WHERE 1=1
--AND cr_account_flex_field2 LIKE '%C40C40%'
--AND transaction_type_name LIKE '%'||:tran_type_name||'%'
AND subinventory_code LIKE '%PRD%'
AND dr_account_flex_field5 = '11101110'
--AND transaction_type_name NOT LIKE '%EPE1 Interdept Asset Transfer%'
--AND organization_code = :org_code
--AND subinventory_code LIKE '%SFG%'
--AND to_char(last_update_date, 'MON-YYYY') = 'APR-2019'
--AND dr_attribute7 = 'X2110'
--ORDER BY creation_date DESC

SELECT *
FROM xxia.ias_org_acc_codes

SELECT *
FROM mtl_transaction_types
WHERE transaction_type_name LIKE '%SPD%'

SELECT *
FROM xxia.ias_org_acc_codes
WHERE cr_attribute11 IS NOT NULL

SELECT transaction_type_name,
       organization_code org_code,
       subinventory_code,
        period_name,
        debit_code1 || '.' || debit_code2 || '.' || debit_code3 || '.' || debit_code4 || '.' || debit_code5 || '.' || debit_code6 || '.' ||  debit_code7
       || '.' || debit_code8 || '.' || debit_code9 || '.' || debit_code10 || '.' || debit_code11 TO_FIELD ,
       credit_code1 || '.' || credit_code2 || '.' || credit_code3 || '.' || credit_code4 || '.' || credit_code5 || '.' || credit_code6 || '.' ||  credit_code7
       || '.' || credit_code8 || '.' || credit_code9 || '.' || credit_code10 || '.' || credit_code11 FROM_FIELD        
FROM xxia.ias_transactions_sum
WHERE organization_code = 'IND'
AND transaction_type_name LIKE  '%SSD9%'