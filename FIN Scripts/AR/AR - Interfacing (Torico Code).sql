SELECT *
FROM ra_interface_lines_all
WHERE orig_system_bill_customer_id = 171127

SELECT *
FROM xx00ifar_trx_hdr_stg_all
WHERE 1=1
--AND orig_system_bill_address_name = 'TOSHIBA CORPORATION'
--AND (orig_system_ship_customer_name IN ('TMC-YOK','T0BTDGX000L','TOSHIBA MEMORY CORPORATION')
--        OR orig_system_bill_customer_name IN ('TMC-YOK','T0BTDGX000L','TOSHIBA MEMORY CORPORATION'))
--ORDER BY orig_system_ship_customer_name
--AND to_char(gl_date,'MON-YYYY') = to_char(SYSDATE,'MON-YYYY')
AND process_status != 'INTERFACED'

SELECT *
FROM xx00ifcmn_code_conv_master_all
WHERE 1=1
--AND module_name = 'AR'
--AND source_value IN ('SEIGISSD','FUNASSD','PHLSSD','48BNAC')
--AND entity_name = 'AR_ORIG_SYSTEM_SHIP_ADDRESS_NAME'
AND source_value IN ('T0-J779-L01')

'T0-V631-L01',
'KIC48Q',
'T0-K829-L01',
'T0-K829-L02',
'T0-J941-L01',
'T0-Q163-L01',
'T0-V665-L01',
'T0-U947-L01',
'T0-U341-L01',
'T0-K660-L01',
'T0-V431-L01',
'T0-V690-L01',
'T0-Q015-L01',
'T0-Q015-L02',
'T0-K426-L01',
'T0-K686-L01',
'T0-L284-L01',
'T0-L679-L01',
'T0-L846-L01',
'T0-Q600-L01',
'T0-R431-L01',
'T0-R831-L01',
'T0-U111-L01',
'T0-U118-L01',
'T0-U398-L01',
'T0-U399-L01',
'T0-V118-L01',
'T0-V244-L01',
'T0-V283-L01',
'T0-V348-L01',
'T0-R423-L01',
'T0-J294-L01',
'T0-J779-L01',
'T0-L228-L01',
'T0-J350-L01',
'T0-L891-L01',
'T0-K613-L01',
'T0-K466-L01',
'T0-U279-L01',
'T0-V685-L01',
'T0-J294-L02',
'T0-U164-L01',
'T0-V092-L01',
'T0-V319-L01',
'T0-V736-L01',
'T0-V746-L01',
'T0-V745-L01',
'T0-V740-L01',
'T0-V744-L01',
'T0-V744-L02',
'T0-V768-L01',
'T0-V665-L02',
'T0-V724-L02',
'T0-V788-L01',
'T0-V828-L01',
'T0-V822-L01',
'T0-V351-L01',
'T0-V840-L01',
'T0-V851-L01',
'T0-V893-L01',
'T0-K403-L01',
'T0-V716-L01',
'T0-V666-L01',
'T0-V944-L01',
'T0-V954-L01',
'T0-D677-L01',
'T0-F745-L01',
'T0-V988-L01',
'T0-W028-L01',
'T0-V828-L02',
'T0-W084-L01',
'T0-W116-L01')
GROUP BY entity_name



SELECT LENGTH('T0BWVW0') "7-digit",
       LENGTH('T0BWVW00001') "11-digit"
FROM dual

--AND source_value IN ('T0-J350-005') --,'T0-L679-004','T0-U398-002')
--AND destination_value IN ('T0BTDGX')

SELECT source_value ,entity_name, count(*)
FROM xx00ifcmn_code_conv_master_all
WHERE 1=1
AND module_name = 'AR'
GROUP BY source_value , entity_name
HAVING count(*) > 1

SELECT LENGTH('T0BWMHM') "7-digit",
       LENGTH('T0BWMHM0001') "11-digit"
FROM dual

--T0-Q600-004  T0BWJK2   T0BWJK20001
--T0-L679-004  T0BWJK4   T0BWJK40001
--T0-U398-002  T0BWJK3   T0BWJK30001

SELECT * --source_value, destination_value, start_date_active --distinct source_value --, creation_date
FROM xx00ifcmn_code_conv_master_all
WHERE 1=1
AND module_name = 'AR'
AND entity_name = 'AR_ORIG_SYSTEM_SHIP_ADDRESS_NAME'
AND start_date_active = TO_DATE('10/3/2019','MM/DD/YYYY')
AND enabled_flag = 'Y'

AND source_value IN ('T0-V631-K01',
'T0-K829-K01',
'T0-K829-K01',
'T0-J941-K01',
'T0-Q163-K01',
'T0-K666-K01',
'T0-K668-K01',
'T0-K668-K02',
'T0-V665-K01',
'T0-U341-K01',
'T0-K660-K01',
'T0-V431-K01',
'T0-V690-K01',
'T0-Q015-K01',
'T0-Q015-K02',
'T0-K426-K01',
'T0-K686-K01',
'T0-L284-K01',
'T0-L679-K01',
'T0-L846-K01',
'T0-Q600-K01',
'T0-R431-K01',
'T0-R831-K01',
'T0-U111-K01',
'T0-U118-K01',
'T0-U398-K01',
'T0-U399-K01',
'T0-V118-K01',
'T0-V244-K01',
'T0-V283-K01',
'T0-V348-K01',
'T0-R423-K01',
'T0-J294-K01',
'T0-J779-K01',
'T0-L228-K01',
'T0-J350-K01',
'T0-L891-K01',
'T0-K613-K01',
'T0-K466-K01',
'T0-U279-K01',
'T0-V685-K01',
'T0-J294-K02',
'T0-U164-K01',
'T0-V092-K01',
'T0-V319-K01',
'T0-V736-K01',
'T0-V746-K01',
'T0-V745-K01',
'T0-V740-K01',
'T0-V744-K01',
'T0-V744-K02',
'T0-V768-K01',
'T0-V665-K02',
'T0-V724-K02',
'T0-V788-K01',
'T0-V828-K01',
'T0-V822-K01',
'T0-V351-K01',
'T0-V840-K01',
'T0-V851-K01',
'KICYOK',
'T0-K403-K01',
'T0-V716-K01',
'T0-V666-K01',
'T0-V944-K01',
'T0-V954-K01',
'T0-D677-K01',
'T0-F745-K01',
'T0-V988-K01',
'T0-W028-K01',
'T0-V828-K02',
'T0-W084-K01',
'T0-W116-K01',
'KICFUNA',
' KICYOKO')
ORDER BY 1
--ORDER BY 3, 1