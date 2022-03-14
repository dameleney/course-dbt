SELECT
    discount,
    promo_id,
    status
FROM {{ source('postgres_src','promos') }}