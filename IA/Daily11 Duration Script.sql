SELECT  CONCURRENT_NAME, EXECUTED_BY, PRIORITY_REQUEST_ID, REQUEST_ID, ACTUAL_START_DATE, ACTUAL_COMPLETION_DATE                                                           
            , EXTRACT( DAY FROM DIFF ) TTL_DAYS                                                         
            , EXTRACT( HOUR FROM DIFF ) TTL_HOURS                                                         
            , EXTRACT( MINUTE FROM DIFF ) TTL_MINUTES                                                         
            , PARAMETER                                                         
            , PHASE_CODE, STATUS_CODE, COMPLETION_TEXT                                                          
            , TTL_TRX_COUNT, PROCESS_STATUS                                                        
    FROM (                                                        
            SELECT FCPT.USER_CONCURRENT_PROGRAM_NAME CONCURRENT_NAME                                                        
                   , FUS.USER_NAME EXECUTED_BY                                                        
                   , FCR.PRIORITY_REQUEST_ID, FCR.REQUEST_ID, FCR.REQUEST_DATE, FCR.ACTUAL_START_DATE, FCR.ACTUAL_COMPLETION_DATE                                                          
                   , (CAST(FCR.ACTUAL_COMPLETION_DATE AS TIMESTAMP) - CAST(FCR.ACTUAL_START_DATE AS TIMESTAMP)) DIFF                                                        
                   , FCR.ARGUMENT_TEXT PARAMETER, FCR.ARGUMENT1, FCR.ARGUMENT2, FCR.ARGUMENT3                                                        
                   , FCR.PHASE_CODE, FCR.STATUS_CODE, FCR.COMPLETION_TEXT                                                           
                   , X.TTL_TRX_COUNT, X.PROCESS_STATUS                                                        
            FROM APPS.FND_CONCURRENT_REQUESTS FCR                                                        
                 , APPS.FND_CONCURRENT_PROGRAMS_TL FCPT                                                                       
                 , APPS.FND_USER FUS                                                         
                 , (SELECT count(*) TTL_TRX_COUNT, PROCESS_STATUS, REQUEST_ID                                                        
                                    FROM APPS.XX00IFGL_JOURNAL_STG_ALL                                                        
                                    GROUP BY PROCESS_STATUS, REQUEST_ID) X                                                        
            WHERE  FCR.CONCURRENT_PROGRAM_ID = FCPT.CONCURRENT_PROGRAM_ID                                                              
            AND FCR.REQUESTED_BY = FUS.USER_ID                                                        
            AND FCPT.USER_CONCURRENT_PROGRAM_NAME LIKE '%Daily%11%'                                                        
            AND TRUNC(FCR.REQUEST_DATE) >= TO_DATE('01/01/2018','MM/DD/YYYY')                                                          
            AND FCR.REQUEST_ID = X.REQUEST_ID(+)                                                        
            ORDER BY FCR.REQUEST_DATE DESC);                            

