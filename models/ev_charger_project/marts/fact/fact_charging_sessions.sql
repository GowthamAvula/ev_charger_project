{{ config(materialized='table') }}

select
    session_id,
    station_id,
    user_id,
    session_date,

    energy_kwh,
    price_paid,

    session_duration_minutes,

    -- Derived metrics
    price_paid / nullif(energy_kwh, 0) as revenue_per_kwh,
    session_duration_minutes / 60 as session_duration_hours

from {{ ref('stg_charging_sessions') }}