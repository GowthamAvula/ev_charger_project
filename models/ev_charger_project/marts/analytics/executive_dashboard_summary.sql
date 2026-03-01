{{ config(materialized='table') }}

select
    extract(year from session_date) as year,
    extract(month from session_date) as month,
    sum(price_paid) as revenue,
    count(distinct user_id) as active_users,
    count(*) as total_sessions,
    sum(energy_kwh) as total_energy
from {{ ref('fact_charging_sessions') }}
group by 1,2
order by 1,2