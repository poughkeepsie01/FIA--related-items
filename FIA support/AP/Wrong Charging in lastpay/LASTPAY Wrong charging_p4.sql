  SELECT a.employee_num,
         a.expense_type,
         a.expense_line_num,
         a.amount,
         b.segment1,
         b.segment2,
         b.segment3,
         b.segment4,
         b.segment5,
         b.segment6,
         -- modification start Lib_ver.4.01
         b.segment7,
         b.segment8,
         b.segment9,
         b.segment10,
         b.segment11,
         -- modification end Lib_ver.4.01
         b.charge_dept,
         b.charge_bu
    FROM tip_lastpay_lines_interface a,
         tip_lastpay_account_mst b,
         -- modification start Lib_ver.4.01
         tip_lastpay_headers_interface c
   -- modification end Lib_ver.4.01
   WHERE     a.expense_type = b.expense_type
         AND a.document_category = b.document_category
         AND b.document_type = 'INDIRECT'
         AND a.employee_num = 'T090593115C0034'
         AND a.document_num = 'PRF44104'
         AND a.document_category = 'LASTPAY'
         AND a.doc_line_num = '18'         
         AND b.cost_center = c.cost_center
         AND a.employee_num = c.employee_num
         AND a.document_num = c.document_num
         AND a.document_category = c.document_category
         AND a.doc_line_num = c.line_num
ORDER BY a.employee_num, a.expense_line_num;
