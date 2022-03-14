SELECT 
    price,
    inventory,
    product_id,
    name
FROM {{ source('postgres_src','products')}}