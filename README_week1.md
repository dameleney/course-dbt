# Week1 Project Answers

How many users do we have?
Query: `select count(distinct(user_id)) from dbt_david_m.stg_users`
Result: 130

On average, how many orders do we receive per hour?
Query: 
with orders_per_day_hour as
  (
    select date(created_at),
    date_part('hour',created_at) as hour,
    date_part('day',created_at) as day,
    count('order_id') as order_count
    
    from dbt_david_m.stg_orders
    
    group by 1,2,3
  )
  select avg(order_count) from orders_per_day_hour

Answer: 7.5

On average, how long does an order take from being placed to being delivered?
Query:
with delivery_time as (
SELECT delivered_at-created_at AS duration
    FROM dbt_david_m.stg_orders
    where status = 'delivered'),

average_delivery_time AS (
  SELECT avg(delivery_time) AS average_delivery_time_days
  FROM delivery_time
)

select average_delivery_time_days FROM average_delivery_time

How many users have only made one purchase? Two purchases? Three+ purchases?

Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

On average, how many unique sessions do we have per hour?