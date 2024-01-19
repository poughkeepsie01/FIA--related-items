/* Formatted on 12/19/2019 8:01:01 AM (QP5 v5.227.12220.39754) */
  SELECT pha.po_header_id PHA_PO_ID,
         pha.segment1 PO_NUMBER,
         pda.po_header_id PDA_PO_ID,
         pda.po_distribution_id PDA_DIST_ID,
         aida.po_distribution_id AIDA_DIST_ID,
         aida.invoice_id AIDA_INVOICE_ID,
         aia.invoice_id AIA_INVOICE_ID,
         aia.invoice_num,
         aida.period_name,
         xihia.invoice_date,
         xihia.invoice_amount,
         xihia.process_status,
         xihia.ftp_file_name,
         xihia.accounting_date,
         xihia.invoice_num INVOICE_LINE_NUM,
         xihia.line_number,
         xihia.amount,
         gcc.code_combination_id,
            gcc.segment1
         || '.'
         || gcc.segment2
         || '.'
         || gcc.segment3
         || '.'
         || gcc.segment4
         || '.'
         || gcc.segment5
         || '.'
         || gcc.segment6
         || '.'
         || gcc.segment7
         || '.'
         || gcc.segment8
         || '.'
         || gcc.segment9
         || '.'
         || gcc.segment10
         || '.'
         || gcc.segment11
            charging,
         xihia.description,
         xihia.process_status,
         xihia.ftp_file_name
    FROM po_headers_all pha
         LEFT JOIN po_distributions_all pda
            ON pha.po_header_id = pda.po_header_id
         LEFT JOIN ap_invoice_distributions_all aida
            ON aida.po_distribution_id = pda.po_distribution_id
         LEFT JOIN gl_code_combinations gcc
            ON pda.code_combination_id = gcc.code_combination_id
         LEFT JOIN ap_invoices_all aia ON aia.invoice_id = aida.invoice_id
         LEFT JOIN
         xx00ifap_invoice_line_if_all xihia
            ON     xihia.invoice_id = aia.invoice_id
               AND xihia.invoice_id = aida.invoice_id
   WHERE     1 = 1
         AND aida.line_type_lookup_code = 'ACCRUAL'
         AND pha.segment1 IN
                ('6024228',
                 '6024227',
                 '6017094',
                 '6048841',
                 '6048840',
                 '6007817',
                 '6007842',
                 '6057735')
GROUP BY pha.po_header_id,
         pha.segment1,
         pda.po_header_id,
         pda.po_distribution_id,
         aida.po_distribution_id,
         aida.invoice_id,
         aida.period_name,
         aia.invoice_id,
         aia.invoice_num,
         xihia.invoice_date,
         xihia.invoice_amount,
         xihia.accounting_date,
         xihia.invoice_num,
         xihia.amount,
         xihia.line_number,
         xihia.description,
         xihia.process_status,
         xihia.ftp_file_name,
         gcc.segment1,
         gcc.segment2,
         gcc.segment3,
         gcc.segment4,
         gcc.segment5,
         gcc.segment6,
         gcc.segment7,
         gcc.segment8,
         gcc.segment9,
         gcc.segment10,
         gcc.segment11,
         gcc.code_combination_id
ORDER BY TO_DATE (aida.period_name, 'MON-YYYY'),
         aia.invoice_num,
         xihia.invoice_num,
         xihia.line_number