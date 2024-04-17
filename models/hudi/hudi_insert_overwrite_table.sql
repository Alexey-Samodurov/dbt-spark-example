{{ config(
    materialized='incremental',
    file_format='hudi',
    incremental_strategy='insert_overwrite',
    location_root='s3a://result-parquet/default',
    options={
        'type': 'cow',
        'precombineKey': 'ts'
    },
    unique_key='id'
   )
}}

select
    id,
    cast(rand() as string) as name,
    current_timestamp() as ts
from {{ ref('hudi_insert_table') }}