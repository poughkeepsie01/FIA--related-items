select  distinct
        hca.cust_account_id,        
        hp.party_name "CUSTOMER NAME",
        hca.created_by,
        hca.account_number,
        hca.status customer_status,
        hcsu.location,
        hcsu.site_use_code,
        hcsu.status location_status,        
        hcsu.site_use_id,        
        hl.address1,
        hl.address2,
        hl.address3,
        hl.city,
        hl.state,
        hl.postal_code,        
        hcsu.site_use_id customer_site_use_id,
        hps.identifying_address_flag primary_address_flag,        
--        HOU.NAME "OPERATING UNIT",
        hp.creation_date,                      
        hca.last_update_date
from    apps.hz_parties hp,
        apps.hz_party_sites hps,
        apps.hz_locations hl,
        apps.hz_cust_accounts hca,
        apps.hz_cust_acct_sites_all hcas,
        apps.hz_cust_site_uses_all hcsu,
        apps.hz_customer_profiles hcp,
        apps.hr_operating_units hou
where   hp.party_id = hca.party_id(+)
and     hp.party_id = hcp.party_id
and     hp.party_id = hps.party_id
and     hps.party_site_id = hcas.party_site_id
and     hps.location_id = hl.location_id
and     hca.cust_account_id = hcas.cust_account_id
and     hcas.cust_acct_site_id = hcsu.cust_acct_site_id
and     hca.cust_account_id = hcp.cust_account_id
--and     hp.party_name LIKE '%OSC%'
--and     hp.party_name IN ('KIOXIA CORPORATION','Toshiba Logistics Philippines Corporation','YLCI BLDG.1[FAO TOSHIBA LOGISTICS PHILS CORP]')
and     hcsu.location in ('T0BSSCQ0005','T0BSSCQ')
--and     hca.account_number IN ('KIC48Q')
--AND     hca.cust_account_id = 1925
--AND hps.location_id = 1925
--AND hl.location_id = 5178
--AND hcsu.location LIKE '%TOSHIBA%D%S%CORPORATION%'
--and     hp.party_name LIKE '%DAIICHI JITSUGYO CO. LTD%'
--AND UPPER(hl.address1) LIKE '%INTERNATIONAL%PROCUREMENT%OFFICE%'
--ORDER BY hp.creation_date DESC --hca.account_number
ORDER BY 1 



 



