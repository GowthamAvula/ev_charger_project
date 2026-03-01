{{ config(materialized='view') }}
select
    session_id,
    station_id,
    user_id,
    start_time,
    end_time,
    session_date,
    energy_kwh,
    price_paid,
    session_duration_minutes,
    charger_type,
    payment_method,
    city
from {{ source('ev_analytics', 'charging_sessions') }}