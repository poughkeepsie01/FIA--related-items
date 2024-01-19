SELECT *
FROM xxia.ias_adj_transactions
WHERE 1=1
AND period_name = 'JAN-2020'
AND transaction_type_name = 'Balance account adjust'
AND subinventory_code = 'MDCMAT'
--AND extract_flag IS NULL
--ORDER BY creation_date DESC

-------------------------------

SELECT * --COUNT(*)
FROM xxia.ias_adj_transactions
WHERE 1=1
AND period_name = 'JAN-2020'
AND transaction_type_name = 'Balance account adjust'
AND subinventory_code = 'MDCMAT'
--AND creation_date BETWEEN TO_DATE('01/29/2020 10:00:00 AM','MM/DD/YYYY HH:MI:SS AM') AND SYSDATE
AND creation_date BETWEEN TO_DATE('01/30/2020 07:00:00 AM','MM/DD/YYYY HH:MI:SS AM') AND SYSDATE
ORDER BY creation_date DESC

--AND extract_flag IS NULL


--10 AM
--460
--318

SELECT COUNT(*)
FROM xxia.ias_adj_transactions
WHERE 1=1
AND period_name = 'JAN-2020'
AND transaction_type_name = 'Balance account adjust'
AND subinventory_code = 'MDCMAT'

SELECT item_code ,count(*)  
FROM xxia.ias_adj_transactions
WHERE 1=1
AND period_name = 'JAN-2020'
AND transaction_type_name = 'Balance account adjust'
AND subinventory_code = 'MDCMAT'
GROUP BY item_code
HAVING count(*) > 1

--Done 759
--Not yet 19

SELECT item_code , current_amount
FROM xxia.ias_balance
WHERE 1=1
AND period_name = 'JAN-2020'
AND subinventory_code = 'MDCMAT'
--AND cost_center = '3002830'
--AND item_code = 'MDCASAA0536'
AND current_amount != 0