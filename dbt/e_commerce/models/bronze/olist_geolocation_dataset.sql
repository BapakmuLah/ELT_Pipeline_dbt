-- ADJUST DATA TYPE OF GEOLOCATION DATASET --

select LPAD(CAST(geolocation_zip_code_prefix as STRING), 5, '0') as geolocation_zip_code_prefix,
       CAST(geolocation_lat as DOUBLE) as geolocation_lat,
       CAST(geolocation_lng as DOUBLE) as geolocation_lng,
       CAST(geolocation_city as STRING) as geolocation_city,
       CAST(geolocation_state as STRING) as geolocation_state 
FROM e_commerce_elt.bronze.olist_geolocation_dataset