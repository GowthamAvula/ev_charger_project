{{ config(materialized='table') }}

with user_summary as (
    select
        user_id,
        sum(price_paid) as total_spent,
        count(*) as total_sessions
    from {{ ref('stg_charging_sessions') }}
    group by user_id
)

select
    *,
    case
        when total_spent > 2000 then 'High Value'
        when total_spent between 1000 and 2000 then 'Medium Value'
        else 'Low Value'
    end as customer_segment
from user_summary