SELECT FLEX_VALUE1,
       FLEX_VALUE2,
       FLEX_VALUE3,
       FLEX_VALUE4,
       FLEX_VALUE5,
       FLEX_VALUE6,
       CREATION_DATE,
       LAST_UPDATE_DATE
FROM XXIA.IAS_SETUP_DETAIL
WHERE 1=1
AND header_code = 'BALANCE_SET_COLUMN_NAME'
AND flex_value4 NOT LIKE '%YKH%'
AND flex_value3 LIKE '%Miscellaneous issue%'
--AND flex_value4 LIKE '%SFG%'
ORDER BY  flex_value3 , flex_value1


--AND UPPER(flex_value3) LIKE '%EPC%SUB%INTERDEP%TRANSFE%'
--AND flex_value4 LIKE '%LINE%'
--AND flex_value4 NOT LIKE '%EPC%'
--ORDER BY flex_value3 

--AND flex_value3 LIKE '%EME%'
--AND flex_value3 = 'Subinventory Transfer'
--AND flex_value3 = 'WIP Completion Return'

--AND flex_value4 = '%FIN%'
--AND flex_value3 LIKE '%SSD%Interdep%expense%'
--AND (flex_value4 LIKE '%FIN%' OR flex_value5 LIKE '%FIN%')
--OR (flex_value4 LIKE '%FIN%' OR flex_value5 LIKE '%FIN%')
ORDER BY creation_date DESC


SELECT distinct flex_value1, flex_value2
FROM XXIA.IAS_SETUP_DETAIL
WHERE header_code = 'BALANCE_SET_COLUMN_NAME' 