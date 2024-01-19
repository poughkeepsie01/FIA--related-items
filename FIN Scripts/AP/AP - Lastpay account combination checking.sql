SELECT  document_type,
        expense_type,
        expense_name,
        segment1,
        segment2,
        segment3,
        segment4,
        segment5,
        segment6,
        segment7,
        segment8,
        segment9,
        segment10,
        segment11,       
        segment1 ||'.'|| segment2 ||'.'|| segment3 ||'.'|| segment4 ||'.'|| segment5 ||'.'|| segment6 ||'.'|| 
        segment7 ||'.'|| segment8 ||'.'|| segment9 ||'.'|| segment10 ||'.'|| segment11 concatenated_segments,
        cost_center,
        creation_date,
        created_by  
FROM TIP_LASTPAY_ACCOUNT_MST
WHERE 1=1
AND cost_center = '2001670'
--AND document_type = 'INDIRECT'
AND segment1 ||'.'|| segment2 ||'.'|| segment3 ||'.'|| segment4 ||'.'|| segment5 ||'.'|| segment6 ||'.'|| segment7 ||'.'|| segment8 ||'.'|| segment9 ||'.'|| segment10 ||'.'|| segment11 
    IN ('T090593.A99.L10.2001670.42302430.0000.X2000.PHL.0000000.000000.0000')

SELECT DISTINCT
       document_type,
       expense_type,
       expense_name,    
       segment1 ||'.'|| segment2 ||'.'|| segment3 ||'.'|| segment4 ||'.'|| segment5 ||'.'|| segment6 ||'.'|| 
        segment7 ||'.'|| segment8 ||'.'|| segment9 ||'.'|| segment10 ||'.'|| segment11 concatenated_segments   
--       segment4,
--       segment5,
--       segment6,
--       segment7       
FROM TIP_LASTPAY_ACCOUNT_MST
WHERE 1=1
--AND  document_type = 'INDIRECT'
--AND segment4 = '1001135'
AND segment5 = '42506920'
AND segment6 = '0000'
AND segment7 = 'X2000'      
ORDER BY segment6



SELECT 
--DISTINCT 
--        expense_type,
--        expense_name,
document_type,
        expense_type,
        cost_center,
        segment1 ||'.'|| segment2 ||'.'|| segment3 ||'.'|| segment4 ||'.'|| segment5 ||'.'|| segment6 ||'.'|| 
        segment7 ||'.'|| segment8 ||'.'|| segment9 ||'.'|| segment10 ||'.'|| segment11 concatenated_segments  
FROM TIP_LASTPAY_ACCOUNT_MST
WHERE 1=1
--AND document_type IN ('DIRECT','INDIRECT')   
AND expense_type IN ('BONUS','CWT_SAL','CANTEEN_DED')
AND cost_center = 2001670
       
SELECT 
       DISTINCT
       document_type,
       expense_type,
       expense_name,
--       segment1 ||'.'|| segment2 ||'.'|| segment3 ||'.'|| segment4 ||'.'|| segment5 ||'.'|| segment6 ||'.'|| 
--        segment7 ||'.'|| segment8 ||'.'|| segment9 ||'.'|| segment10 ||'.'|| segment11 concatenated_segments
       segment5,
       segment6
--       creation_date,
--       created_by
FROM TIP_LASTPAY_ACCOUNT_MST
WHERE 1=1
AND document_type IN ('DIRECT','INDIRECT')
--AND expense_type = 'GAS_ALLOW'
--AND expense_type LIKE '%HOU%'
AND segment5 = '42302930'
AND segment6 = '7439'
--AND segment7 = 'X2000';
      
ORDER BY 1




SELECT *
FROM gl_code_combinations
WHERE 1=1
AND segment5 = '45101110'
AND segment6 = '8114'