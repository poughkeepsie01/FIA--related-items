SELECT  JOURNAL_NAME,
        JOURNAL_DESCRIPTION,
        GAAP_CATEGORY,
        ACCOUNTING_DATE,
        PERIOD,
        CURRENCY,
        CONVERSION_TYPE,
        CONVERSION_DATE,
        CONVERSION_RATE,
        ENTITY,
        SBU,
        SITE,
        CENTER,
        ACCOUNT,
        SUB_ACCOUNT,
        PRODUCT_CATEGORY,
        REGION,
        INTERCOMP,
        FUTURE1,
        FUTURE2,
        DEBIT,
        CONVERTED_DEBIT,
        CREDIT,
        CONVERTED_CREDIT,
        LINE_DESCRIPTION,
        LINE_DFF_CONTEXT,
        LINE_DFF,
        CAPTURED_INFO_DFF,
        LEDGER_NAME
FROM    XXPUR_TIP_ERV_LEDGER
where   1=1
and period_name = 'AUG-2019'--:p_period_name
and line_description LIKE '%EH1800170AI001%'
--and     LEDGER_NAME = :P_ledger





--VIEW SCRIPT

SELECT    erv.PERIOD_NAME
            || ' '
            || erv.ERV_LEDGER
            || ' '
            || erv.APPLIED_TO_DIST_ID_NUM_1
               Journal_Name,
               erv.PERIOD_NAME
            || ' '
            || erv.ERV_LEDGER
            || ' '
            || erv.APPLIED_TO_DIST_ID_NUM_1
               Journal_Description,
            erv.GAAP_CATEGORY,
            erv.ADJ_ACCOUNTING_DATE Accounting_Date,
            erv.PERIOD_NAME Period,
            erv.CURRENCY_CODE Currency,
            'User' Conversion_Type,
            '' Conversion_Date,
            1 Conversion_Rate,
            erv.ENTITY ENTITY,
            erv.SBU SBU,
            erv.SITE SITE,
            erv.CENTER CENTER,
            erv.ACCOUNT ACCOUNT,
            erv.SUB_ACCOUNT SUB_ACCOUNT,
            erv.PRODUCT_CATEGORY PRODUCT_CATEGORY,
            erv.REGION REGION,
            '0000000' INTERCOMP,
            erv.FUTURE1 FUTURE1,
            erv.FUTURE2 FUTURE2,
            erv.ENTERED_DR Debit,
            erv.ACCOUNTED_DR Converted_Debit,
            erv.ENTERED_CR Credit,
            erv.ACCOUNTED_CR Converted_Credit,
               'Supplier: '
            || erv.Supplier_Number
            || ' '
            || erv.VENDOR_NAME
            || '  Invoice No: '
            || erv.INVOICE_NUM
            || '  PO NO: '
            || erv.PO_NUM
               Line_Description,
            '' Line_DFF_Context,
            '' Line_DFF,
            erv.VENDOR_SITE_CODE || '.......' Captured_Info_DFF,
            erv.NAME LEDGER_NAME,
            erv.period_name
       -- 2015/06/03 Lib Ver 4.01 -- (TIP-ISD) M.Isip -- Newly Created
       FROM (
       
       
       SELECT types.TYPE,
                    ah.PERIOD_NAME PERIOD_NAME,
                    ah.ACCOUNTING_DATE ERV_ACCOUNTING_DATE,
                    gp.END_DATE ADJ_ACCOUNTING_DATE,
                    gp.PERIOD_YEAR PERIOD_YEAR,
                    gp.PERIOD_NUM PERIOD_NUM,
                    ai.INVOICE_NUM INVOICE_NUM,
                    ai.INVOICE_DATE INVOICE_DATE,
                    al.CURRENCY_CODE CURRENCY_CODE,
                    aps.SEGMENT1 Supplier_Number,
                    aps.VENDOR_NAME VENDOR_NAME,
                    apsa.VENDOR_SITE_CODE VENDOR_SITE_CODE,
                    poh.segment1 PO_NUM,
--                    DECODE (types.TYPE,
--                            'A', al.ENTERED_DR,
--                            'V', al.ENTERED_CR)
--                       ENTERED_DR,
--                    DECODE (types.TYPE,
--                            'A', al.ENTERED_CR,
--                            'V', al.ENTERED_DR)
--                       ENTERED_CR,
--                    DECODE (types.TYPE,
--                            'A', al.ACCOUNTED_DR,
--                            'V', al.ACCOUNTED_CR)
--                       ACCOUNTED_DR,
--                    DECODE (types.TYPE,
--                            'A', al.ACCOUNTED_CR,
--                            'V', al.ACCOUNTED_DR)
--                       ACCOUNTED_CR,
--modified
                    DECODE (types.TYPE,
                            'V', al.ENTERED_DR,
                            'A', al.ENTERED_CR)
                       ENTERED_DR,
                    DECODE (types.TYPE,
                            'V', al.ENTERED_CR,
                            'A', al.ENTERED_DR)
                       ENTERED_CR,
                    DECODE (types.TYPE,
                            'V', al.ACCOUNTED_DR,
                            'A', al.ACCOUNTED_CR)
                       ACCOUNTED_DR,
                    DECODE (types.TYPE,
                            'V', al.ACCOUNTED_CR,
                            'A', al.ACCOUNTED_DR)
                       ACCOUNTED_CR,
                    ccid.segment1 ENTITY,
                    ccid.segment2 SBU,
                    ccid.segment3 SITE,
                    DECODE (types.TYPE,  'A', ccid.segment4,  'V', '0000000')
                       CENTER,
                    DECODE (types.TYPE,  'A', ccid.segment5,  'V', '45501110')
                       ACCOUNT,
                    DECODE (types.TYPE,  'A', ccid.segment6,  'V', '8131')
                       SUB_ACCOUNT,
                    DECODE (types.TYPE,  'A', ccid.segment7,  'V', '00000')
                       PRODUCT_CATEGORY,
                    DECODE (types.TYPE,  'A', ccid.segment8,  'V', 'PHL')
                       REGION,
                    DECODE (types.TYPE,  'A', ccid.segment9,  'V', '0000000')
                       INTERCOMP,
                    ccid.segment10 FUTURE1,
                    ccid.segment11 FUTURE2,
                    '' INT_VALUE,
                    xd.APPLIED_TO_SOURCE_ID_NUM_1,
                    xd.APPLIED_TO_DIST_ID_NUM_1,
                    gl.NAME,
                    tdv.TABLE_NAME ERV_LEDGER,
                    tdv.FIELD_NAME LEDGER_NAME,
                    tdv.DEFAULT_VALUE GAAP_CATEGORY
               FROM xla.XLA_AE_LINES PARTITION (AP) al,
                    xla.XLA_AE_HEADERS PARTITION (AP) ah,
                    xla.XLA_DISTRIBUTION_LINKS PARTITION (AP) xd,
                    xla.XLA_TRANSACTION_ENTITIES PARTITION (AP) xt,
                    ap.AP_INVOICES_ALL ai,
                    ap.AP_SUPPLIER_SITES_ALL apsa,
                    ap.AP_SUPPLIERS aps,
                    gl.GL_PERIODS gp,
                    gl.GL_LEDGERS gl,
                    xla.XLA_AE_LINES PARTITION (AP) al2,
                    xla.XLA_DISTRIBUTION_LINKS PARTITION (AP) xd2,
                    PO_HEADERS_ALL poh,
                    gl.gl_code_combinations ccid,
                    (SELECT 'A' TYPE FROM DUAL
                     UNION ALL
                     SELECT 'V' TYPE FROM DUAL) types,
                    XX00IFAP_INVOICE_HDR_IF_ALL xih,
                    TIP_DEFAULT_VALUES tdv
              WHERE     al.ACCOUNTING_CLASS_CODE = 'EXCHANGE_RATE_VARIANCE'
                    AND al.AE_HEADER_ID = ah.AE_HEADER_ID
                    AND al.AE_HEADER_ID = xd.AE_HEADER_ID
                    AND al.AE_LINE_NUM = xd.AE_LINE_NUM
                    AND ah.LEDGER_ID = gl.LEDGER_ID
                    AND tdv.organization_id = ai.org_id
                    AND tdv.DESCRIPTION = 'For ERV Data Download'
                    AND tdv.FIELD_NAME = gl.NAME
                    AND ah.ENTITY_ID = xt.ENTITY_ID
                    AND xt.SOURCE_ID_INT_1 = ai.INVOICE_ID
                    AND ai.INVOICE_ID = xih.INVOICE_ID
                    AND xih.PROCESS_STATUS = 'TRANSFERRED'
                    AND ai.VENDOR_SITE_ID = apsa.VENDOR_SITE_ID
                    AND apsa.VENDOR_ID = aps.VENDOR_ID
                    AND gp.PERIOD_SET_NAME = 'XXG00_CAL_APR'
                    AND ah.ACCOUNTING_DATE >= gp.START_DATE
                    AND ah.ACCOUNTING_DATE <= gp.END_DATE
                    AND xd.AE_HEADER_ID = xd2.AE_HEADER_ID
                    AND xd.ALLOC_TO_DIST_ID_NUM_1 = xd2.ALLOC_TO_DIST_ID_NUM_1
                    AND al2.ACCOUNTING_CLASS_CODE = 'ACCRUAL'
                    AND xd2.ACCOUNTING_LINE_CODE = 'AP_ACCRUAL_INV'
                    AND al2.AE_HEADER_ID = xd2.AE_HEADER_ID
                    AND al2.AE_LINE_NUM = xd2.AE_LINE_NUM
                    AND al2.CODE_COMBINATION_ID = ccid.CODE_COMBINATION_ID
                    AND xd2.APPLIED_TO_SOURCE_ID_NUM_1 = poh.PO_HEADER_ID
                    AND al2.ae_header_id = 2443704
                    
                    ) erv
                    
   ORDER BY erv.APPLIED_TO_DIST_ID_NUM_1, erv.TYPE;
   
   
SELECT 'A' TYPE FROM DUAL
UNION ALL
SELECT 'V' TYPE FROM DUAL   