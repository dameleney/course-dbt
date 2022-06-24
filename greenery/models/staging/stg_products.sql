SELECT 
    price,
    inventory,
    product_id,
    name
FROM {{ source('src_postgres','products')}}