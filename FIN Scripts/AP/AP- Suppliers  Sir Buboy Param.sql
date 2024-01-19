            
            
            (SELECT
            --asp.vendor_id ,
           -- asp.segment1 "Supplier Num" ,
            asp.vendor_name  ,
            ass.vendor_site_code  ,
            --hou.name "Operating Unit Name" ,
            ass.ACCTS_PAY_CODE_COMBINATION_ID,
            gl.SEGMENT1||'.'||gl.SEGMENT2||'.'||gl.SEGMENT3||'.'||gl.SEGMENT4||'.'||gl.SEGMENT5||'.'||gl.SEGMENT6||'.'||gl.SEGMENT7||'.'||gl.SEGMENT8||'.'||gl.SEGMENT9||'.'||gl.SEGMENT10||'.'||gl.SEGMENT11 "Liability Account",
           -- asp.vendor_type_lookup_code,
            ass.address_line1 
            --ass.city ,
            --ass.state ,
            --ass.zip ,
            --ass.country ,
            --ass.phone ,
            --person.person_first_name ,
            --person.person_last_name ,
            --pty_rel.primary_phone_number ,
            --pty_rel.email_address,
            --ass.terms_id
            FROM
            apps.ap_suppliers asp ,
            apps.ap_supplier_sites_all ass ,
            APPS.ap_supplier_contacts apsc ,
            apps.hz_parties person ,
            apps.hz_parties pty_rel,
            apps.hr_operating_units hou,
            apps.gl_code_combinations GL
            WHERE
            ass.vendor_id = asp.vendor_id
            AND apsc.per_party_id = person.party_id
            AND apsc.rel_party_id = pty_rel.party_id
            AND ass.org_id = hou.organization_id
            AND apsc.org_party_site_id = ass.party_site_id
            AND asp.vendor_type_lookup_code = 'VENDOR'
            AND ass.ACCTS_PAY_CODE_COMBINATION_ID = gl.code_combination_ID
            --AND asp.segment1 = 'T0B17W1'
            --AND asp.vendor_name LIKE '%T0B17W1%'
         )
