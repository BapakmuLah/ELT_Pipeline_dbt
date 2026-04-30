-- UNTUK MENGECEK APAKAH KOLOM 'LATITUDE' DAN 'LONGITUDE' DALAM GEOLOCATION DATASET DIMULAI DARI SIMBOL '-' --

{%test geolocation_prefix(model, column_name)%}

SELECT * FROM {{model}}
WHERE CAST({{column_name}} AS STRING) NOT LIKE '-%'

{% endtest %}