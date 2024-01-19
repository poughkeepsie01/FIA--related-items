SELECT   ba.bank_account_id,    
         bb.bank_name bank_name,
         ba.bank_branch_id,   
         ba.bank_account_num bank_account_num,
         ba.bank_account_name,
         ba.currency_code,         
         bb.address_line1, 
         bb.address_line2, 
         bb.address_line3, 
         bc.name country,
         bb.address_line1||' ' ||bb.address_line2||' ' ||bb.address_line3||' ' ||bc.name address_name
    FROM ce_bank_accounts ba, 
         ce_bank_branches_v bb,
         pa_country_v bc
   WHERE ba.bank_id = bb.bank_party_id
     AND ba.bank_branch_id = bb.branch_party_id
     and bb.country = bc.country_code
     and ba.end_date is null
ORDER BY bb.bank_name, ba.bank_account_num, ba.currency_code