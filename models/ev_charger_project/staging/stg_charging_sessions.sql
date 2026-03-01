{{ config(materialized='view') }}

select
    session_id,
    station_id,
    user_id,

    cast(start_time as timestamp) as start_time,
    cast(end_time as timestamp) as end_time,
    session_date,

    energy_kwh,
    price_paid,
    session_duration_minutes,

    charger_type,
    payment_method,
    city

from {{ source('ev_analytics','charging_sessions') }}

where energy_kwh > 0
and price_paid >= 0
