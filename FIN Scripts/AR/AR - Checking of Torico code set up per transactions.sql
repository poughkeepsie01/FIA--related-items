/* Formatted on 11/30/2019 3:47:11 PM (QP5 v5.227.12220.39754) */
  SELECT rila.creation_date,                    --rila.interface_line_context,
         CASE
            WHEN (SUBSTR (interface_line_attribute1, 1, 1)) = 'H' THEN 'HDD'
            WHEN (SUBSTR (interface_line_attribute1, 1, 1)) = 'F' THEN 'EHD/SSD'
            ELSE '-'
         END
            SITE,
         rila.interface_line_attribute1 INVOICE_NUMBER,
         --       rila.amount,
         --       rila.orig_system_ship_customer_id,
         hca.account_number customer_number,
         hca.account_name customer_name,
         xccma.entity_name,
         xccma.module_name,
         xccma.destination_value "7_DIGIT_TORICO",
         xccma2.destination_value "11_DIGIT_TORICO",
         --       rila.orig_system_ship_address_id,
         --       hca2.account_number address_number,
         --       hca2.account_name   address_name,
         rila.trx_date,
         rila.trx_number,
         rila.attribute11
    --       rila.ship_date_actual,
    --       rila.primary_salesrep_number,
    --       rila.primary_salesrep_id
    FROM ra_interface_lines_all rila
         LEFT JOIN hz_cust_accounts hca
            ON rila.orig_system_ship_customer_id = hca.cust_account_id
         LEFT JOIN
         xx00ifcmn_code_conv_master_all xccma
            ON     hca.account_number = xccma.source_value
               AND LENGTH (xccma.destination_value) = 7
         LEFT JOIN
         xx00ifcmn_code_conv_master_all xccma2
            ON     hca.account_number = xccma2.source_value
               AND LENGTH (xccma2.destination_value) = 11
   WHERE     1 = 1
         AND rila.interface_line_attribute1 NOT LIKE '%BS%'
         AND rila.interface_line_attribute1 NOT LIKE '%DN%'
         AND rila.interface_line_attribute1 NOT LIKE '%CN%'
         AND rila.attribute11 IS NULL
--         AND xccma.destination_value IS NULL
ORDER BY rila.creation_date DESC                  --interface_line_attribute1;