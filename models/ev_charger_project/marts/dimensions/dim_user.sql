{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_key,
    user_id,

    count(*) as total_sessions,
    sum(price_paid) as total_spent,
    sum(energy_kwh) as total_energy,
    avg(price_paid) as avg_spend

from {{ ref('stg_charging_sessions') }}
group by user_id
