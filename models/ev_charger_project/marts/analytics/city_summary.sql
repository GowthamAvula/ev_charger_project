{{ config(materialized='table') }}

select
    city,
    count(*) as total_sessions,
    sum(price_paid) as revenue,
    sum(energy_kwh) as energy,
    avg(session_duration_minutes) as avg_duration
from {{ ref('stg_charging_sessions') }}
group by city