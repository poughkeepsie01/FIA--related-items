/* Formatted on 10/30/2019 2:10:41 PM (QP5 v5.227.12220.39754) */
SELECT    gcc.segment1
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
          concatenated_segments,
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
       gcc.segment11
  FROM (SELECT 'T090593' SEGMENT1,
               cbs.DEFAULT_VALUE SEGMENT2,
               CASE
                  WHEN (   cbs.DEFAULT_VALUE = 'E20'
                        OR cbs.DEFAULT_VALUE = 'E30')
                  THEN
                     'C20'
                  WHEN (   cbs.DEFAULT_VALUE = 'A99'
                        OR cbs.DEFAULT_VALUE = 'M10'
                        OR cbs.DEFAULT_VALUE = 'S30'
                        OR cbs.DEFAULT_VALUE = 'C40'
                        OR cbs.DEFAULT_VALUE = 'M20')
                  THEN
                     'L10'
                  ELSE
                     '000'
               END
                  SEGMENT3,
               :SEGMENT4 SEGMENT4,
                  '42'
               || CASE
                     WHEN (SUBSTR (:SEGMENT4, 1, 1) = '1') THEN 5
                     WHEN (SUBSTR (:SEGMENT4, 1, 1) = '2') THEN 3
                     WHEN (SUBSTR (:SEGMENT4, 1, 1) = '3') THEN 2
                     WHEN (SUBSTR (:SEGMENT4, 1, 1) = '4') THEN 1
                     WHEN (SUBSTR (:SEGMENT4, 1, 1) = '5') THEN 7
                  END
               || '06990'
                  SEGMENT5,
               '7479' SEGMENT6,
               CASE
                  WHEN cbs.DEFAULT_VALUE = 'A99' THEN 'X2000'
                  WHEN cbs.DEFAULT_VALUE = 'M10' THEN 'X2110'
                  WHEN cbs.DEFAULT_VALUE = 'S30' THEN 'X1310'
                  WHEN cbs.DEFAULT_VALUE = 'C40' THEN 'X1110'
                  WHEN cbs.DEFAULT_VALUE = 'E20' THEN 'X2410'
                  WHEN cbs.DEFAULT_VALUE = 'E30' THEN 'X2510'
                  WHEN cbs.DEFAULT_VALUE = 'M20' THEN 'X2710'
               END
                  SEGMENT7,
               'PHL' SEGMENT8,
               '0000000' SEGMENT9,
               '000000' SEGMENT10,
               '0000' SEGMENT11
          FROM DUAL,
               (SELECT DEFAULT_VALUE
                  FROM APPS.tip_cbs_default_values
                 WHERE     1 = 1
                       AND table_name = 'TIP_CBS_EMPLOYEEINFO'
                       AND field_name = 'SBU'
                       AND additional_key = :SEGMENT4) cbs) gcc
