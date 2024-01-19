SELECT gcc.code_combination_id,       
       gcc.segment1,
       gcc.segment2,
       gcc.segment3,
       gcc.segment4,
       gcc.segment5,
       gcc.segment6,
       gcc.segment7,
       gcc.segment8,
       gcc.segment9,
       gcc.segment10,
       gcc.segment11,
       gcc.segment1 ||'.'|| gcc.segment2 ||'.'|| gcc.segment3 ||'.'|| gcc.segment4 ||'.'|| gcc.segment5 ||'.'|| gcc.segment6 ||'.'|| 
       gcc.segment7 ||'.'|| gcc.segment8 ||'.'|| gcc.segment9 ||'.'|| gcc.segment10 ||'.'|| gcc.segment11 concatenated_segments,
       gcc.last_update_date,     
       gcc.start_date_active,
       gcc.end_date_active,
       gcc.enabled_flag,
       gcc.jgzz_recon_flag,
       fu.description last_update,
       gcc.last_updated_by
FROM APPS.gl_code_combinations gcc,
     APPS.fnd_user fu
WHERE 1=1
AND  gcc.last_updated_by = fu.user_id
AND  gcc.segment2 LIKE '%'|| NVL(:p_segment2,:p_segment2) ||'%'
AND  gcc.segment3 LIKE '%'|| NVL(:p_segment3,:p_segment3) ||'%'
AND  gcc.segment4 LIKE '%'|| NVL(:p_segment4,:p_segment4) ||'%'
AND  gcc.segment5 LIKE '%'|| NVL(:p_segment5,:p_segment5) ||'%'
AND  gcc.segment6 LIKE '%'|| NVL(:p_segment6,:p_segment6) ||'%'
AND  gcc.segment7 LIKE '%'|| NVL(:p_segment7,:p_segment7) ||'%'
--AND  gcc.segment1 ||'.'|| gcc.segment2 ||'.'|| gcc.segment3 ||'.'|| gcc.segment4 ||'.'|| gcc.segment5 ||'.'|| gcc.segment6 ||'.'|| 
--     gcc.segment7 ||'.'|| gcc.segment8 ||'.'|| gcc.segment9 ||'.'|| gcc.segment10 ||'.'|| gcc.segment11 IN (:p_segments)
--AND  gcc.code_combination_id LIKE '%' || :p_id ||'%'
--AND  gcc.code_combination_id IN (2019,2002)        
ORDER BY creation_date DESC;