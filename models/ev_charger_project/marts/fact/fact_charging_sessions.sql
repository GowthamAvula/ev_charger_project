{{ config(materialized='table') }}

select
    session_id,
    station_id,
    user_id,
    session_date,
    start_time,

    energy_kwh,
    price_paid,
    session_duration_minutes,

    price_paid / nullif(energy_kwh,0) as revenue_per_kwh,
    session_duration_minutes / 60 as duration_hours,

    extract(hour from start_time) as session_hour,

    case
        when extract(hour from start_time) between 7 and 10 then 'Morning Peak'
        when extract(hour from start_time) between 17 and 21 then 'Evening Peak'
        else 'Off Peak'
    end as peak_category

from {{ ref('stg_charging_sessions') }}