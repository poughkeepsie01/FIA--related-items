--IA Period Checking
  SELECT b.organization_id,
         b.organization_code,
         a.rec_type,
         a.status,
         a.period_name,
         c.description created_by,
         a.creation_date,
         a.last_update_date
    FROM ORG_ACCT_PERIODS_V a, mtl_parameters b, fnd_user c
   WHERE     a.organization_id = b.organization_id
         AND a.created_by = c.user_id
         --and a.creation_date like sysdate
         AND a.period_name = :period_name                      --> change date
         AND b.organization_code NOT LIKE 'Z%'
         AND b.organization_code NOT LIKE 'Y%'
ORDER BY a.creation_date DESC