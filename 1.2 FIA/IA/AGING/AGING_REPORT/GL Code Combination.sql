SELECT code_combination_id,
       segment1 || '.' || segment2 || '.' ||segment3 || '.' ||segment4 || '.' ||segment5 || '.' ||segment6 || '.' ||
       segment7 || '.' ||segment8 || '.' ||segment9 || '.' ||segment10 || '.' ||segment11 as combination,
       enabled_flag,
       last_update_date
FROM gl_code_combinations
WHERE (segment1 || '.' || segment2 || '.' ||segment3 || '.' ||segment4 || '.' ||segment5 || '.' ||segment6 || '.' ||
       segment7 || '.' ||segment8 || '.' ||segment9 || '.' ||segment10 || '.' ||segment11) 
       IN ('T090593.S30.L10.5003060.42700120.7412.X1110.PHL.0000000.000000.0000')