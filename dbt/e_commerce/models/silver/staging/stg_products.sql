-- HANDLE APAPUN YG FAIL PADA DBT TEST olist_products_dataset --

WITH source AS (SELECT * FROM {{ ref('olist_products_dataset') }}),

-- MEMBERSIHKAN KOLOM (TRIM, LOWER HANDLING NULL, CAST DATA TYPE)
cleaned AS (

    SELECT TRIM(product_id) AS product_id,
           COALESCE(LOWER(TRIM(product_category_name)), 'unknown') AS product_category_name, -- HANDLING NULL VALUES

           -- CAST DATA TYPE
           CAST(product_name_length AS INT) AS product_name_length,
           CAST(product_description_length AS INT) AS product_description_length,
           CAST(product_photos_qty AS INT) AS product_photos_qty,
           CAST(product_weight_g AS INT) AS product_weight_g,
           CAST(product_length_cm AS INT) AS product_length_cm,
           CAST(product_height_cm AS INT) AS product_height_cm,
           CAST(product_width_cm AS INT) AS product_width_cm
    FROM source
),

-- TAMBAHKAN BEBERAPA FITUR BARU (ANOMALY)
enriched AS (
    SELECT *,

        ------ ANOMALY FLAGS ------
        CASE WHEN product_weight_g IS NOT NULL AND product_weight_g <= 0 THEN 1 ELSE 0
        END AS is_invalid_weight,

        CASE WHEN product_length_cm IS NOT NULL AND product_length_cm <= 0 THEN 1 ELSE 0
        END AS is_invalid_length,

        CASE WHEN product_height_cm IS NOT NULL AND product_height_cm <= 0 THEN 1 ELSE 0
        END AS is_invalid_height,

        CASE WHEN product_width_cm IS NOT NULL AND product_width_cm <= 0 THEN 1 ELSE 0
        END AS is_invalid_width,

        ----- PRODUCT METRICS  -----

        -- volume (cm^3)
        (product_length_cm * product_height_cm * product_width_cm) AS product_volume_cm3,

        -- completeness score 
        (CASE WHEN product_category_name IS NOT NULL THEN 1 ELSE 0 END +
         CASE WHEN product_weight_g IS NOT NULL THEN 1 ELSE 0 END +
         CASE WHEN product_length_cm IS NOT NULL THEN 1 ELSE 0 END +
         CASE WHEN product_height_cm IS NOT NULL THEN 1 ELSE 0 END +
         CASE WHEN product_width_cm IS NOT NULL THEN 1 ELSE 0 END
        ) AS product_completeness_score
    FROM cleaned
),

-- FINAL COLUMNS
final AS (
    SELECT *,

        -- ANOMALY LEVELS --
        CASE WHEN is_invalid_weight = 1 THEN 'critical'
             WHEN is_invalid_length = 1 OR is_invalid_height = 1 OR is_invalid_width = 1 THEN 'warning'
            ELSE 'normal'
        END AS anomaly_level
    FROM enriched
)

SELECT * FROM final