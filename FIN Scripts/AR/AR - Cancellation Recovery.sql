SELECT *
FROM tip_dncn_trx_lines
WHERE transaction_number  = '1903 BS#0000558'

-----------------------------------------------------------
--INTERFACE_LINES

SELECT interface_line_attribute1 , trx_number , line_number ,  attribute11, comments
FROM ra_interface_lines_all
WHERE interface_line_attribute1  = '1903 BS#0000558-X'

UPDATE ra_interface_lines_all
SET    interface_line_attribute1 = interface_line_attribute1 || '-X',
       trx_number                = trx_number || '-X' , 
       attribute11               = 'X', 
       comments                  = 'Request to cancel BS Transaction: HR# '
FROM ra_interface_lines_all
WHERE interface_line_attribute1  = '1903 BS#0000558';

--------------------------------------------------------------
--DISTRIBUTIONS

SELECT *
FROM  ra_interface_distributions_all
WHERE interface_line_attribute1  = '1903 BS#0000558';

UPDATE ra_interface_distributions_all
SET    interface_line_attribute1 = interface_line_attribute1 || '-X' , 
       attribute12               = 'Request to cancel BS Transaction: HR# '
WHERE interface_line_attribute1  = '1903 BS#0000558';

--------------------------------------------------------------
--ERROR CHECKING 

SELECT interface_line_attribute1 , attribute12
FROM ra_interface_distributions_all
WHERE interface_line_attribute1 LIKE '%X%';

SELECT interface_line_attribute1, trx_number , attribute11, comments
FROM ra_interface_lines_all
WHERE attribute11 = 'X'

SELECT  * --distinct status_flag
FROM tip_dncn_trx_lines
WHERE transaction_number LIKE '%X%'

SELECT *
FROM TIP_DNCN_TRX_ACTION_HISTORY
WHERE trx_no  = '1903 BS#0000558'

SELECT *
FROM dba_objects
WHERE object_name LIKE '%DNCN%'
