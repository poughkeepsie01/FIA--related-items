----------------
--LEGAL ENTITY--
----------------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXG00_AFF_ENTITY'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;

-------
--SBU--
-------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXGD4_AFF_SBU'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;

--------
--SITE--
--------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXGD4_AFF_SITE'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;


---------------
--COST CENTER--
---------------

SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXGD4_AFF_CENTER'
ORDER BY ffvl.flex_Value;


-------------------
--NATURAL ACCOUNT--
-------------------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXG00_AFF_ACCOUNT'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;

---------------
--SUB ACCOUNT--
---------------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXGD4_AFF_SUB_ACCOUNT'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;


--------------------
--PRODUCT CATEGORY--
--------------------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXGD4_AFF_PRODUCT_CATEGORY'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;


----------
--REGION--
----------
SELECT  ffvl.flex_value,
        ffvl.description 
FROM    fnd_flex_values_vl ffvl,
        fnd_flex_value_sets ffvs
WHERE   ffvl.flex_value_set_id = ffvs.flex_value_set_id
AND     ffvs.flex_value_set_name  = 'XXG00_AFF_REGION'
GROUP BY ffvl.flex_Value, ffvl.description
ORDER BY ffvl.flex_Value;


