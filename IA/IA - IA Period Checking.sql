--IA Period Checking 
select b.organization_id, b.organization_code, a.rec_type, a.status, a.period_name, c.description created_by, a.creation_date 
from APPS. ORG_ACCT_PERIODS_V a, APPS. mtl_parameters b, APPS. fnd_user c
where a.organization_id = b.organization_id 
and a.created_by = c.user_id
--and a.creation_date like sysdate
and a.period_name = 'FEB-2023' --> change date 
and b.organization_code not like 'Z%'
and b.organization_code not like 'Y%'
order by a.creation_date desc