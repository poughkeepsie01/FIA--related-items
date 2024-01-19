SELECT *
FROM dba_audit_trail
WHERE 1=1
AND os_username = ''

SELECT *
FROM org_organization_definitions
WHERE organization_code = 'HPC'

SELECT COUNT(*)
FROM mtl_system_items_b
WHERE organization_id = 324

SELECT *
FROM mtl_system_items_interface
--WHERE process_flag = 1


SELECT *
FROM dba_objects
WHERE 1=1
AND object_name LIKE '%PHY%INVENTOR%'
AND object_type = 'TABLE'


SELECT *
FROM MTL_physical_adjustments
WHERE 1=1
AND physical_inventory_id = 664703

SELECT *
FROM MTL_PHYSICAL_INVENTORIES
WHERE 1=1
--AND physical_inventory_name LIKE '%MDCLINE-A%DUMMY2%'
--AND last_adjustment_date IS NOT NULL
--AND to_char(physical_inventory_date,'MON-YYYY') != to_char(last_adjustment_date,'MON-YYYY') 
--AND to_char(physical_inventory_date,'YYYY') = '2018'
AND physical_inventory_id = 664703


SELECT *
FROM fnd_user
WHERE user_id = 4749