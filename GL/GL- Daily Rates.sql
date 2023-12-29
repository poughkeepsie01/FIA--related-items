SELECT DISTINCT FROM_CURRENCY,
		TO_CURRENCY,
		CONVERSION_TYPE,
		TO_CHAR(CONVERSION_DATE, 'MON-YYYY') PERIOD_NAME,
		CONVERSION_RATE,
		STATUS_CODE,
		CREATED_BY,
		CREATION_DATE
FROM   APPS.GL_DAILY_RATES
WHERE  CONVERSION_DATE BETWEEN '01-MAR-2023' AND '31-MAR-2023'
AND    CONVERSION_TYPE = '1000'
--AND TO_CHAR(creation_date,'YYYYMM') = '202302'
ORDER BY 3, 1