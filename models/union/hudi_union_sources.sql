{{ config(
    materialized='table',
    file_format='hudi',
    options={
        'type': 'cow',
        },
    unique_key='id'
    )
}}

with union as (
    select id from {{ source('hudi', 'hudi_insert_table') }}
    union all
    select id from {{ source('hudi', 'hudi_insert_table') }}
    union all
    select id from {{ source('spark', 'spark_insert_table') }}
    union all
    select id from {{ source('spark', 'spark_insert_overwrite_table') }}
)

select * from union

