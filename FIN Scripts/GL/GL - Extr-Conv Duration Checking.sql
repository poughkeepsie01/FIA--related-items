SELECT  c.user_concurrent_program_name, 
        a.actual_start_date, 
        a.actual_completion_date,
        CASE 
            WHEN a.actual_completion_date IS NULL
                THEN 'Running'
            ELSE 'Completed' 
        END STATUS,        
        DECODE(a.actual_completion_date,
               null,
               TO_CHAR(TO_DATE('00:00:00','HH24:MI:SS') + (SYSDATE - a.actual_start_date),'HH24:MI:SS'),
               TO_CHAR(TO_DATE('00:00:00','HH24:MI:SS') + (a.actual_completion_date - a.actual_start_date),'HH24:MI:SS')) RUNTIME,          
        COUNT(b.request_id) TOTAL_COUNT,                
        b.user_je_source_name || ', ' || b.period_name parameter,
        b.process_status
FROM    fnd_concurrent_requests a,      
        xx00ifgl_journal_if_all b, 
        fnd_concurrent_programs_tl c
WHERE 1=1
        AND a.concurrent_program_id = b.program_id
        AND a.concurrent_program_id = 62337        
        AND a.request_id = b.request_id
        AND b.user_je_source_name LIKE '%' || :source_name || '%' --'Cost Management'                
        AND a.concurrent_program_id = c.concurrent_program_id
--        AND TO_CHAR(a.actual_start_date,'MM/DD/YYYY') = '01/31/2019'
        AND (a.actual_start_date <= SYSDATE AND a.actual_start_date >= SYSDATE - :p_days)        
GROUP BY a.concurrent_program_id, 
         a.actual_start_date, 
         a.actual_completion_date,
         c.user_concurrent_program_name,
         b.process_status,
         b.user_je_source_name,
         b.period_name           
ORDER BY actual_start_date DESC;

--64382 XX00IF GL Sequence Updation Program for TIP Data Interfacting
--64381 XX00IF GL Data Extraction Program for Interfacing
--62337 XX00IF GL Data Conversion and Error Check Program
--62338 XX00IF GL Data File Creation Program
--62339 XX00IF GL Data File Transfer Program

--Payables
--Payroll
--T090593_L10_0006
--T090593_L10_0008