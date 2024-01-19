            
            
            (SELECT
            asp.vendor_id ,
            asp.segment1 "Supplier Num" ,
            asp.vendor_name "Supplier Name" ,
            ass.vendor_site_code "Site name" ,
            hou.name "Operating Unit Name" ,
            asp.vendor_type_lookup_code,
            ass.address_line1 ,
            ass.city ,
            ass.state ,
            ass.zip ,
            ass.country ,
            ass.phone ,
            person.person_first_name ,
            person.person_last_name ,
            pty_rel.primary_phone_number ,
            pty_rel.email_address,
            ass.terms_id
            FROM
            ap_suppliers asp ,
            ap_supplier_sites_all ass ,
            APPS.ap_supplier_contacts apsc ,
            hz_parties person ,
            hz_parties pty_rel,
            hr_operating_units hou
            WHERE
            ass.vendor_id = asp.vendor_id
            AND apsc.per_party_id = person.party_id
            AND apsc.rel_party_id = pty_rel.party_id
            AND ass.org_id = hou.organization_id
            AND apsc.org_party_site_id = ass.party_site_id
            --AND asp.segment1 = 'T0B17W1'
            --AND asp.vendor_name LIKE '%T0B17W1%'
            ) VN,
            AP_TERMS AP
