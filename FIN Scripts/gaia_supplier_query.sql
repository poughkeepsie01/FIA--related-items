select
     apssa.LAST_UPDATE_DATE
    ,apssa.LAST_UPDATED_BY
    ,aps.VENDOR_TYPE_LOOKUP_CODE
    ,aps.SEGMENT1                                                     Representive_Code
    ,apssa.vendor_site_code
    ,aps.VENDOR_NAME                                                  Supplier_Name
    ,aps.ATTRIBUTE1                                                   Supplier_Official_Name
    ,aps.ATTRIBUTE2                                                   Supplier_Short_Name
    ,aps.ATTRIBUTE4                                                   Supplier_Name_Eng
    ,aps.ATTRIBUTE5                                                   Affliate_Class
    ,apssa.ORG_ID                                                     Organization_ID
    ,apssa.VENDOR_SITE_CODE                                           Torico_Partner_Code
    ,apssa.VENDOR_SITE_CODE_ALT                                       Supplier_Site_Name
    ,apssa.COUNTRY                                                    Supplier_Site_Country
    ,apssa.INACTIVE_DATE                                             End_Date
    ,att.NAME                                                        Pay_Terms
    ,(select a.PAYMENT_METHOD_NAME 
      from   IBY_PAYMENT_METHODS_TL a
      where  a.LANGUAGE = 'US'
      and    a.PAYMENT_METHOD_CODE = ieppm.PAYMENT_METHOD_CODE)      Payment_Method
    ,apssa.PAY_GROUP_LOOKUP_CODE                                     Pay_Group
--    ,decode(apssa.ATTRIBUTE1,'1','下請','2','一般')                  
--    ,apssa.ATTRIBUTE2                                                
--    ,apssa.ATTRIBUTE3                                                
--    ,(select a.PAYMENT_METHOD_NAME 
--      from   IBY_PAYMENT_METHODS_TL a
--      where  a.LANGUAGE = 'JA'
--      and    a.PAYMENT_METHOD_CODE = apssa.ATTRIBUTE5)               
--    ,apssa.ATTRIBUTE6                                                
--    ,apssa.ATTRIBUTE7                                                
    ,apssa.ATTRIBUTE8                                                
    ,apssa.ATTRIBUTE9                                                
    ,apssa.ATTRIBUTE10                                               
    ,apssa.ATTRIBUTE11                                               
    ,apssa.ATTRIBUTE12                                               
    ,apssa.ATTRIBUTE13                                               
    ,apssa.FAX                                                       
    ,apssa.INVOICE_CURRENCY_CODE                                     Invoice_Currency
    ,apssa.PAYMENT_CURRENCY_CODE                                     Payment_Currency
--    ,decode(apssa.BANK_CHARGE_BEARER,'I','控除しない'
--                                    ,'N','仕入先/優遇'
--                                    ,'S','仕入先/標準')              
    ,iepa.REMIT_ADVICE_DELIVERY_METHOD                               
    ,iepa.REMIT_ADVICE_EMAIL                                         
--    ,iepa.REMIT_ADVICE_FAX                                           
    ,ipiua.ORDER_OF_PREFERENCE                                       
    ,cbbv.BANK_NUMBER                                                Bank_Number
    ,cbbv.BRANCH_NUMBER                                              Branch_Number
    ,ieba.CURRENCY_CODE                                              Bank_Account_Currency
    ,cbbv.BANK_NAME                                                  Bank_Name
    ,cbbv.BANK_BRANCH_NAME                                           Branch_Name
    ,ieba.BANK_ACCOUNT_NUM                                           Bank_Account_Number
    ,ieba.BANK_ACCOUNT_TYPE                                          
    ,ieba.BANK_ACCOUNT_NAME                                          
    ,ieba.BANK_ACCOUNT_NAME_ALT                                      
    ,ieba.COUNTRY_CODE                                               
    ,ipiua.ATTRIBUTE1                                                
    ,ipiua.ATTRIBUTE2                                                
    ,ipiua.ATTRIBUTE3                                                
    ,ipiua.ATTRIBUTE4                                                
    ,ipiua.ATTRIBUTE5                                                
    ,ipiua.ATTRIBUTE6                                                
    ,ipiua.ATTRIBUTE7                                                
    ,ipiua.ATTRIBUTE8                                                
    ,apssa.VENDOR_SITE_ID                                            
    ,ieppm.EXT_PARTY_PMT_MTHD_ID                                     
    ,iepa.EXT_PAYEE_ID                                               
    ,ieba.EXT_BANK_ACCOUNT_ID                                        
--    ,ipiua.INSTRUMENT_PAYMapssa.INACTIVE_DATEENT_USE_ID                                 
from  
     AP_SUPPLIERS                                aps
    ,AP_SUPPLIER_SITES_ALL                       apssa
    ,IBY_EXTERNAL_PAYEES_ALL                     iepa
    ,(select * 
      from   IBY_EXT_PARTY_PMT_MTHDS      
      where  1=1
      and    PAYMENT_FLOW = 'DISBURSEMENTS'
      and    PAYMENT_FUNCTION = 'PAYABLES_DISB'
      and    PRIMARY_FLAG = 'Y') ieppm
    ,(select *
      from   AP_TERMS_TL
      where  LANGUAGE = 'JA' )                   att
    ,(select *
      from  IBY_PMT_INSTR_USES_ALL
      where 1=1 
      and   INSTRUMENT_TYPE    = 'BANKACCOUNT'
      and   PAYMENT_FLOW       = 'DISBURSEMENTS') ipiua
    ,IBY_EXT_BANK_ACCOUNTS                        ieba
    ,CE_BANK_BRANCHES_V                           cbbv
where 1=1
and   iepa.PAYEE_PARTY_ID         = aps.PARTY_ID
and   aps.VENDOR_ID               = apssa.VENDOR_ID
and   iepa.SUPPLIER_SITE_ID       = apssa.VENDOR_SITE_ID
and   iepa.ORG_ID                 = apssa.ORG_ID
and   iepa.EXT_PAYEE_ID           = ieppm.EXT_PMT_PARTY_ID(+)
and   apssa.TERMS_ID              = att.TERM_ID(+)
and   iepa.EXT_PAYEE_ID           = ipiua.EXT_PMT_PARTY_ID(+)
and   ipiua.INSTRUMENT_ID         = ieba.EXT_BANK_ACCOUNT_ID(+)
and   ieba.BANK_ID                = cbbv.BANK_PARTY_ID(+)
and   ieba.BRANCH_ID              = cbbv.BRANCH_PARTY_ID(+)
and   apssa.ORG_ID = 139  --OU指定
and   iepa.ORG_ID  = 139  --OU指定
and   aps.VENDOR_TYPE_LOOKUP_CODE = 'VENDOR'
and   apssa.INACTIVE_DATE is null
--and   aps.SEGMENT1 = 'T0B0XDU'
--and   apssa.VENDOR_SITE_CODE in ('T0B1K0R0001') --仕入先指定可能
--order by apssa.VENDOR_SITE_CODE,apssa.ORG_ID,ipiua.ORDER_OF_PREFERENCE