{% snapshot station_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='station_id',
    strategy='check',
    check_cols=['city','charger_type']
  )
}}

select
    station_id,
    city,
    charger_type
from {{ ref('stg_charging_sessions') }}

{% endsnapshot %}