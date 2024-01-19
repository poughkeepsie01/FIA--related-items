SELECT tdtl.TRANSACTION_NUMBER,
       tdtl.TRANSACTION_TYPE,
       tdtl.TRANSACTION_DATE,
       tdtl.STATUS_FLAG,
       tdtl.INTERFACE_FLAG,              
       tdtl.ATTRIBUTE2,
       tdtl.CREATION_DATE,       
       tdtv.REQUESTOR,
       CASE 
            WHEN ((tdtv.BU_APPR1_ACTION = 'Approved' AND tdtv.BU_APPR2_ACTION = 'Approved') AND tdtv.ACCT_CHECKER_ACTION IS NULL)
                 THEN 'Rejected'
            WHEN ((tdtv.BU_APPR1_ACTION = 'Approved' AND tdtv.BU_APPR2_ACTION IS NULL) AND tdtv.ACCT_CHECKER_ACTION IS NULL)
                 THEN 'Rejected'  
            WHEN (tdtv.BU_APPR1_ACTION = 'Rejected' OR tdtv.BU_APPR2_ACTION = 'Rejected')
                 THEN 'Rejected'          
            WHEN (tdtv.BU_APPR1_ACTION = 'Cancelled' OR tdtv.BU_APPR2_ACTION = 'Cancelled')
                 THEN 'Cancelled'                                                                                                                       
            ELSE 
                'Approved'                        
       END IS_BU_APPROVED, 
       CASE
           WHEN (tdtv.ACCT_CHECKER_ACTION IS NULL AND tdtv.ACCT_APPR1_ACTION IS NULL AND tdtv.ACCT_APPR2_ACTION IS NULL)
                THEN 'Rejected'
           WHEN tdtv.ACCT_APPR1_ACTION = 'Rejected' 
                THEN 'Rejected'
           WHEN tdtv.ACCT_APPR2_ACTION = 'Rejected'
                THEN 'Rejected'                  
           ELSE 
                'Approved'                                 
       END IS_ACCT_APPROVED,                                           
       tdtv.CLOSED_FLAG,
       rila.TRX_DATE,
       rila.TRX_NUMBER,
       rila.ATTRIBUTE11,
       xthsa.PROCESS_STATUS STG_STATUS,
       xthsa.ERROR_MESSAGE STG_ERROR_MSG,       
       xthia.PROCESS_STATUS IF_STATUS,
       xthia.FTP_FILE_NAME,
       xthia.ERROR_MESSAGE IF_ERROR_MSG
FROM tip_dncn_trx_lines tdtl,
     tip_dncn_trx_view  tdtv,
     ra_interface_lines_all rila,
     xx00ifar_trx_hdr_stg_all xthsa,
     xx00ifar_trx_hdr_if_all xthia
WHERE 1=1
AND tdtl.transaction_number = tdtv.trx_no
AND tdtl.transaction_number = rila.interface_line_attribute1(+)
AND tdtl.transaction_number = xthsa.interface_line_attribute1(+)
AND tdtl.transaction_number = xthia.interface_line_attribute1(+)
AND tdtl.transaction_number LIKE '%BS%'
AND tdtl.transaction_number LIKE '%'|| :bs_number ||'%'
GROUP BY tdtl.TRANSACTION_NUMBER,
       tdtl.TRANSACTION_TYPE,
       tdtl.TRANSACTION_DATE,
       tdtl.STATUS_FLAG,
       tdtl.INTERFACE_FLAG,
       tdtl.ATTRIBUTE2,
       tdtl.CREATION_DATE,       
       tdtv.REQUESTOR,
       tdtv.CLOSED_FLAG,
       tdtv.BU_APPR1_ACTION,
       tdtv.BU_APPR2_ACTION,
       tdtv.ACCT_CHECKER_ACTION,
       tdtv.ACCT_APPR1_ACTION,
       tdtv.ACCT_APPR2_ACTION,
       rila.TRX_DATE,
       rila.TRX_NUMBER,
       rila.ATTRIBUTE11,
       xthsa.PROCESS_STATUS,
       xthsa.ERROR_MESSAGE,
       xthia.PROCESS_STATUS,
       xthia.FTP_FILE_NAME,
       xthia.ERROR_MESSAGE
ORDER BY transaction_date DESC;
