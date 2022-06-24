{{
    config (
        materialized = 'table'
    )
}}

SELECT
    promo_id,
    discount as promo_discount,
    status as promo_status
from {{ source('src_postgres', 'promos') }}