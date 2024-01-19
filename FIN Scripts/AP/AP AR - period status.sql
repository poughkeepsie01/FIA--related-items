SELECT GLS.NAME LEDGER_NAME,
  FA.APPLICATION_SHORT_NAME,
  GPS.closing_status,
  DECODE(GPS.closing_status, 'C', 'Closed', 
         'O', 'Open', 
         'F', 'Future', 
         'W', 'Closed Pending', 
         'N', 'Never Opened', 
         'P', 'Permanently Closed') "PeriodStatus" ,
  GPS.*
FROM GL.GL_PERIOD_STATUSES GPS,
  GL.GL_LEDGERS GLS,
  APPLSYS.FND_APPLICATION FA
WHERE 1=1
AND PERIOD_NAME     ='JAN-2020'
AND GPS.APPLICATION_ID IN (222,200)
AND FA.APPLICATION_ID =GPS.APPLICATION_ID
AND GLS.LEDGER_ID     =GPS.SET_OF_BOOKS_ID
AND gls.name = 'T090593_TIP_IFRS'
ORDER BY 1; 