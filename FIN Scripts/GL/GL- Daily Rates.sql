SELECT DISTINCT from_currency,
       to_currency,
       conversion_type,
       TO_CHAR(conversion_date,'MON-YYYY') period_name,
       conversion_rate,
       status_code,
       created_by,
       creation_date
--SELECT *
FROM gl_daily_rates
WHERE conversion_date  BETWEEN '01-JAN-2020' AND '31-JAN-2020'
AND conversion_type = '1000'
ORDER BY 3,1


