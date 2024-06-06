{{ config(
    materialized='incremental',
    file_format='parquet',
    incremental_strategy='insert_overwrite',
    location_root='s3a://hudi/',
    unique_key='id'
   )
}}

select
    id,
    cast(rand() as string) as name,
    current_timestamp() as ts
from {{ ref('spark_insert_table') }}