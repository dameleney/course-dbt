{{
    config (
        materialized = 'table'
    )
}}

SELECT 
    quantity,
    order_id,
    product_id
FROM {{ source('postgres_src', 'order_items') }}