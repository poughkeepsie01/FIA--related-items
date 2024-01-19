SP_SSSMAT_AP_VALIDATE

SELECT *
FROM per_all_people_f
WHERE 1=1
AND full_name LIKE '%LOPEZ%DIANA%'
--AND employee_number LIKE '%117M0001%'
--WHERE employee_number LIKE '%407L0054%'

SELECT *
FROM per_all_assignments_f
WHERE person_id = 4663
--WHERE person_id = 225

SELECT *
FROM fnd_user
WHERE user_id IN ('5023','4489')

710871 -- T090593.M10.L10.3002810.42206990.7479.X2110.PHL.0000000.000000.0000
1292385 --T090593.M20.L10.4002810.42106990.7479.X2000.PHL.0000000.000000.0000

SELECT a.default_value,
                                       b.default_value,
                                       c.default_value,
                                       d.default_value,
                                       e.default_value,
                                       f.default_value,
                                       g.default_value,
                                       h.default_value,
                                       i.default_value
--                                INTO v_def_val(1),
--                                     v_def_val(4),
--                                     v_def_val(5),
--                                     v_def_val(6),
--                                     v_def_val(7),
--                                     v_def_val(8),
--                                     v_def_val(9),
--                                     v_def_val(10),
--                                     v_def_val(11)
                                FROM pcm_default_values a,
                                     pcm_default_values b,
                                     pcm_default_values c,
                                     pcm_default_values d,
                                     pcm_default_values e,
                                     pcm_default_values f,
                                     pcm_default_values g,
                                     pcm_default_values h,
                                     pcm_default_values i
                                WHERE a.table_name = 'GL_CODE_COMBINATIONS'
                                AND a.field_name = 'SSS_MAT'
                                AND a.table_name = b.table_name
                                AND a.table_name = c.table_name
                                AND a.table_name = d.table_name
                                AND a.table_name = e.table_name
                                AND a.table_name = f.table_name
                                AND a.table_name = g.table_name
                                AND a.table_name = h.table_name
                                AND a.table_name = i.table_name
                                AND a.field_name = b.field_name
                                AND a.field_name = c.field_name
                                AND a.field_name = d.field_name
                                AND a.field_name = e.field_name
                                AND a.field_name = f.field_name
                                AND a.field_name = g.field_name
                                AND a.field_name = h.field_name
                                AND a.field_name = i.field_name
                                AND a.additional_key = 'SEGMENT1'
                                AND b.additional_key = 'SEGMENT4'
                                AND c.additional_key = 'SEGMENT5'
                                AND d.additional_key = 'SEGMENT6'
                                AND e.additional_key = 'SEGMENT7'
                                AND f.additional_key = 'SEGMENT8'
                                AND g.additional_key = 'SEGMENT9'
                                AND h.additional_key = 'SEGMENT10'
                                AND i.additional_key = 'SEGMENT11';

SELECT default_value
--INTO   v_bu_code
FROM   tip_default_values
WHERE  table_name     = 'TAPF0002'
AND    field_name     = 'SECT_BU'
AND    additional_key IN ('4002810')
                                
SELECT substr(default_value,13,3)
--INTO v_site
FROM tip_default_values
WHERE table_name = 'XXTIP_GL_CODE_COMBINATION'
AND field_name = 'EMPLOYEE_DEFAULT_EXPENSE_ID'
AND additional_key = '4002810' || '.' || 'M20';
                                
SELECT *
FROM   gl_code_combinations a
       ,(select distinct id_flex_num from fnd_id_flex_segments_vl ) b
WHERE   b.id_flex_num = a.chart_of_accounts_id
AND     a.segment1  = 'T090593'
AND     a.segment2  = 'M20'
AND     a.segment3  =  'L10'
AND     a.segment4  = '0000000'
AND     a.segment5  = '12403910'
AND     a.segment6  = '1513'
AND     a.segment7  = '00000'
AND     a.segment8  = 'PHL'
AND     a.segment9  = '0000000'
AND     a.segment10 = '000000'
AND     a.segment11 = '0000'
                                
                                