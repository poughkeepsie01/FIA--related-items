/* Formatted on 10/21/2019 12:07:42 PM (QP5 v5.227.12220.39754) */
SELECT (SELECT additional_key
          FROM APPS.pcm_default_values
         WHERE     table_name = 'MTL_PARAMETERS'
               AND field_name = 'ORGANIZATION_ID'
               AND DEFAULT_VALUE = rt.organization_id)
          ORG,
              RT.DESTINATION_TYPE_CODE DESTINATION_TYPE,
       RT.TRANSACTION_TYPE,
       RT.TRANSACTION_DATE,
       PV.VENDOR_NAME,
       REPLACE (RT.ATTRIBUTE1, CHR (13), '') DR_NUMBER,
       PV.ITEM_CODE,
       REPLACE (PV.ITEM_DESCRIPTION, CHR (9), '') ITEM_DESCRIPTION,
       (   GCC.SEGMENT1
        || '.'
        || GCC.SEGMENT2
        || '.'
        || GCC.SEGMENT3
        || '.'
        || GCC.SEGMENT4
        || '.'
        || GCC.SEGMENT5
        || '.'
        || GCC.SEGMENT6
        || '.'
        || GCC.SEGMENT7
        || '.'
        || GCC.SEGMENT8
        || '.'
        || GCC.SEGMENT9
        || '.'
        || GCC.SEGMENT10
        || '.'
        || GCC.SEGMENT11-- modification end Lib_ver.4.01
       )
          CHARGE_OF_ACCOUNT,
       PV.PO_NUMBER,
       GLI.CURRENCY_CODE CUR,
       RT.QUANTITY,
       RT.PO_UNIT_PRICE,
       GLI.ENTERED_DR ENTERED_DEBIT,
       GLI.ENTERED_CR ENTERED_CREDIT,
       GLI.ACCOUNTED_DR ACCOUNTED_DEBIT,
       GLI.ACCOUNTED_CR ACCOUNTED_CREDIT
  FROM APPS.RCV_RECEIVING_SUB_LEDGER GLI,       
       APPS.RCV_TRANSACTIONS RT,
       (SELECT PHA.SEGMENT1 PO_NUMBER,
               MSI.SEGMENT1 ITEM_CODE,
               PLA.ITEM_DESCRIPTION,
               POV.VENDOR_NAME,
               PVS.VENDOR_SITE_CODE,
               PLL.LINE_LOCATION_ID,
               PLA.PO_LINE_ID
          FROM APPS.PO_HEADERS_ALL PHA,
               APPS.PO_LINE_LOCATIONS_ALL PLL,
               APPS.PO_LINES_ALL PLA,
               APPS.MTL_SYSTEM_ITEMS MSI,
               APPS.PO_VENDORS POV,
               APPS.PO_VENDOR_SITES_ALL PVS
         WHERE     PHA.PO_HEADER_ID = PLL.PO_HEADER_ID
               AND PLL.PO_LINE_ID = PLA.PO_LINE_ID
               AND PLL.SHIP_TO_ORGANIZATION_ID = MSI.ORGANIZATION_ID
               AND PLA.ITEM_ID = MSI.INVENTORY_ITEM_ID
               AND PHA.VENDOR_ID = POV.VENDOR_ID
               AND PHA.VENDOR_SITE_ID = PVS.VENDOR_SITE_ID) PV,
       APPS.GL_CODE_COMBINATIONS GCC,
       xx00if.XX00IFGL_JOURNAL_IF_ALL_BK XIFA,              
       xxia.XX00IFGL_JOURNAL_STG_ALL_BK XISA
 WHERE     GLI.RCV_TRANSACTION_ID = RT.TRANSACTION_ID(+)
       AND GLI.RCV_TRANSACTION_ID = XISA.TRANSACTION_ID
       AND XIFA.JE_HEADER_NUM = XISA.JE_HEADER_NUM
       AND XIFA.JE_LINE_NUM = XISA.JE_LINE_NUM
       AND XIFA.USER_JE_SOURCE_NAME = XISA.USER_JE_SOURCE_NAME
       AND GLI.CODE_COMBINATION_ID = XISA.CODE_COMBINATION_ID
       AND GLI.CODE_COMBINATION_ID = XIFA.CODE_COMBINATION_ID
       AND RT.PO_LINE_LOCATION_ID = PV.LINE_LOCATION_ID
       AND RT.PO_LINE_ID = PV.PO_LINE_ID
       AND GLI.CODE_COMBINATION_ID = GCC.CODE_COMBINATION_ID(+)
       AND GLI.JE_SOURCE_NAME = 'Purchasing'
       AND GLI.SET_OF_BOOKS_ID IN (SELECT SET_OF_BOOKS_ID
                                     FROM APPS.GL_SETS_OF_BOOKS
                                    WHERE CURRENCY_CODE = 'USD')
       AND  PV.PO_NUMBER =   GLI.REFERENCE4                                 
--        AND GLI.accounting_date = TO_DATE('01/02/2017','MM/DD/YYYY')         
--        AND GLI.accounting_date BETWEEN TO_DATE('01/10/2017','MM/DD/YYYY') 
--        AND TO_DATE('01/10/2017','MM/DD/YYYY')                                           
       AND GLI.PERIOD_NAME = :vGL_Period       --1
--       AND XISA.PERIOD_NAME = :vGL_Period
--       AND GLI.PERIOD_NAME LIKE '%' || :vGL_Period || '%'       --1
       AND XISA.PROCESS_STATUS = 'INTERFACED'       
--       AND XIFA.FTP_FILE_NAME LIKE '%'||:File_Name||'%' --3
       AND EXISTS
              (SELECT DESTINATION_TYPE_CODE
                 FROM APPS.PO_DISTRIBUTIONS_ALL
                 WHERE     PO_HEADER_ID = RT.PO_HEADER_ID
                      AND DESTINATION_TYPE_CODE = 'EXPENSE') --UPPER (:vDestination_Type))
        AND (   GCC.SEGMENT1
        || '.'
        || GCC.SEGMENT2
        || '.'
        || GCC.SEGMENT3
        || '.'
        || GCC.SEGMENT4
        || '.'
        || GCC.SEGMENT5
        || '.'
        || GCC.SEGMENT6
        || '.'
        || GCC.SEGMENT7
        || '.'
        || GCC.SEGMENT8
        || '.'
        || GCC.SEGMENT9
        || '.'
        || GCC.SEGMENT10
        || '.'
        || GCC.SEGMENT11-- modification end Lib_ver.4.01
       ) LIKE '%14801110%'                      
--        AND GCC.SEGMENT5 = '14801110'; 
      
    