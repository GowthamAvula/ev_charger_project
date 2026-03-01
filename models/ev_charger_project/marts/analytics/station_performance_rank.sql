{{ config(materialized='table') }}

with station_summary as (
    select
        station_id,
        sum(price_paid) as total_revenue,
        count(*) as total_sessions
    from {{ ref('stg_charging_sessions') }}
    group by station_id
)

select
    *,
    rank() over(order by total_revenue desc) as revenue_rank,
    rank() over(order by total_sessions desc) as session_rank
from station_summary