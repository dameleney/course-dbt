
{{
    config (
        materialized = 'table'
    )
}}

SELECT  
    address_id AS address_uuid,
    address,
    zipcode,
    state,
    country
FROM {{ source('postgres_src', 'addresses') }}