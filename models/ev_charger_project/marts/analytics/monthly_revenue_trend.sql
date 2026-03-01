{{ config(materialized='table') }}

select
    extract(year from session_date) as year,
    extract(month from session_date) as month,
    sum(price_paid) as total_revenue,
    sum(energy_kwh) as total_energy,
    count(*) as total_sessions
from {{ ref('stg_charging_sessions') }}
group by 1,2
order by 1,2