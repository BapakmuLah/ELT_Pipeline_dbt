-- STAGING UNTUK GEOLOCATION DATASET

select LPAD(CAST(geolocation_zip_code_prefix as STRING), 5, '0') as geolocation_zip_code_prefix,
       CAST(geolocation_lat as DOUBLE) as latitude,
       CAST(geolocation_lng as DOUBLE) as longitude,
       CAST(geolocation_city as STRING) as city,
       CAST(geolocation_state as STRING) as state 
FROM {{ ref("olist_geolocation_dataset")}}


