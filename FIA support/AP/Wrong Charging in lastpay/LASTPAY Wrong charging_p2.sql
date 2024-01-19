/* Formatted on 12/10/2019 10:28:11 AM (QP5 v5.227.12220.39754) */
SELECT code_combination_id -- ,segment1,segment2,segment3,segment4,segment5,segment6
  --  INTO v_expense
  FROM gl_code_combinations
 WHERE     SEGMENT1 = 'T090593'
       AND segment2 = NVL ('A99', 'A99')                  --NVL ('A99', 'A99')
       AND segment3 = 'L10'                                  --GetDtl.segment3
       AND segment4 = NVL ('000000', '000000')
       AND segment5 = '20604110'
       AND segment6 = '2261'
       AND segment7 = '00000'
       AND segment8 = 'PHL'
       AND segment9 = '0000000'
       AND segment10 = '000000'
       AND segment11 = '0000'
       AND ROWNUM <= 1;

SELECT SUBSTR ('2001670', 6, 2)
  FROM DUAL xseg2
= A99
v_sbu = A99
v_cc = 0000000
v_coa_id = 50368
v_doc_cat_gb = GLOBE BILLING
v_doc_cat_lp = LASTPAY
v_doc_cat_el = EMERGENCY LOAN
v_doc_cat_ss = SSS/LOAN/OTHERS
v_doc_cat_ta = TRAVEL ADVANCES
v_doc_cat_pc = PETTY CASH
v_sitecode_gb = T0883230001
v_def_org_id = 101
employee_num = T090593115C0034
line_num = 18
cost_center = 2001670
GetHdr.doc_cat = LASTPAY
GetHdr.doc_num = PRF44104
GetHdr.doc_date = 11/15/2019
GetHdr.doc_type = INDIRECT
GetHdr.emp_no = T090593115C0034
GetHdr.net_amount = 43680.65
GetHdr.cost_center = 2001670
GetHdr.description = ''
GetHdr.line_num = 18
GetHdr.attribute1 = 1337823
xsection = 1600
xdept = 'SPM'
xseg5 = A99
xseg2 = A99
v_expense = 1137250




SELECT *
FROM ap_invoice_lines_interface
WHERE dist_code_combination_id = '1137250'
AND invoice_id IN (SELECT invoice_id
FROM ap_invoices_interface
WHERE invoice_num = 'PRF44104')