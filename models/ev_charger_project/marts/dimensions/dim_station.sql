{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['station_id']) }} as station_key,
    station_id,
    city,
    charger_type,

    count(*) as total_sessions,
    sum(price_paid) as total_revenue,
    sum(energy_kwh) as total_energy,
    avg(session_duration_minutes) as avg_duration

from {{ ref('stg_charging_sessions') }}
group by station_id, city, charger_type