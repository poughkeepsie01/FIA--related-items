SELECT aii.STATUS,
       aia.INVOICE_ID,
       aia.VENDOR_ID,
       aia.INVOICE_NUM,
       aia.INVOICE_AMOUNT,
       aia.VENDOR_SITE_ID,
       aia.INVOICE_DATE,
       aia.INVOICE_TYPE_LOOKUP_CODE,
       aia.ORG_ID,
       aia.GL_DATE,       
       aia.BATCH_ID,
       aba.batch_name,
       aia.ATTRIBUTE11,       
       fu.DESCRIPTION created_by,
       aia.CANCELLED_DATE,
       fu2.DESCRIPTION cancelled_by,       
       aia.AWT_GROUP_ID,
       aag.NAME,
       aia.ACCTS_PAY_CODE_COMBINATION_ID code_comb_id,
       (    gcc.segment1 || '.' || gcc.segment2 || '.' || gcc.segment3 || '.' || gcc.segment4 || '.' || gcc.segment5 || '.' || 
            gcc.segment6 || '.' || gcc.segment7 || '.' || gcc.segment8 || '.' || gcc.segment9 || '.' || gcc.segment10 || '.' || gcc.segment11 ) CODE_COMBINATION,
       gcc.enabled_flag GL_CODE_ACTIVE,
       gcc.start_date_active GL_CODE_START,
       gcc.end_date_active GL_CODE_END,
       xihsa.process_status STG_STATUS,
       xihsa.error_message  STG_ERROR,
       xihia.process_status IF_STATUS,
       xihia.error_message  IF_ERROR,
       xihia.ftp_file_name           
FROM ap_invoices_interface aii,
     ap_invoices_all aia,
     ap_batches_all aba,     
     xx00ifap_invoice_hdr_stg_all xihsa,
     xx00ifap_invoice_hdr_if_all xihia,
     gl_code_combinations gcc,
     ap_awt_groups aag, 
     fnd_user fu,
     fnd_user fu2
WHERE 1=1
AND  aia.invoice_id = aii.invoice_id(+)
AND  aia.accts_pay_code_combination_id = gcc.code_combination_id(+)
AND  aia.awt_group_id = aag.group_id(+)
AND  aba.batch_id = aia.batch_id
AND  aia.invoice_id = xihsa.invoice_id(+)
AND  aia.invoice_id = xihia.invoice_id(+)
AND  aia.created_by = fu.user_id(+)
AND  aia.cancelled_by = fu2.user_id(+) 
AND  aia.invoice_id  LIKE '%' || :p_invoice_id || '%'    
AND  aia.invoice_num LIKE '%' || :p_invoice_num || '%'
AND  aba.batch_name  LIKE '%' || :p_batch_name || '%' 
