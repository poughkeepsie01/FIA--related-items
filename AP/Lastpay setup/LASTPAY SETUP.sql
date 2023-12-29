SELECT code_combination_id,
       segment1 || '.' || segment2 || '.' ||segment3 || '.' ||segment4 || '.' ||segment5 || '.' ||segment6 || '.' ||
       segment7 || '.' ||segment8 || '.' ||segment9 || '.' ||segment10 || '.' ||segment11 as combination,
       enabled_flag,
       last_update_date
FROM gl_code_combinations
WHERE (segment1 || '.' || segment2 || '.' ||segment3 || '.' ||segment4 || '.' ||segment5 || '.' ||segment6 || '.' ||
       segment7 || '.' ||segment8 || '.' ||segment9 || '.' ||segment10 || '.' ||segment11) 
       IN ('T090593.M10.L10.0000000.20604110.2261.00000.PHL.0000000.000000.0000')



select *
from tip_lastpay_account_mst
WHERE 1=1
AND document_type = 'INDIRECT'
and (segment1 || '.' || segment2 || '.' ||segment3 || '.' ||segment4 || '.' ||segment5 || '.' ||segment6 || '.' ||
       segment7 || '.' ||segment8 || '.' ||segment9 || '.' ||segment10 || '.' ||segment11) 
       IN ('T090593.A99.L10.0000000.20604110.2261.00000.PHL.0000000.000000.0000')
and cost_center = '2001540'       


select distinct expense_type , expense_name
from tip_lastpay_account_mst
WHERE segment5 = '20604110'
AND segment6 = '2261'