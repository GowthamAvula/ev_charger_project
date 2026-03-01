{{ config(materialized='table') }}

select distinct
    session_date as date,
    extract(year from session_date) as year,
    extract(month from session_date) as month,
    extract(quarter from session_date) as quarter,
    extract(dayofweek from session_date) as day_of_week,
    format_date('%A', session_date) as weekday_name
from {{ ref('stg_charging_sessions') }}