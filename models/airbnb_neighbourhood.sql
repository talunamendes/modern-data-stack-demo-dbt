-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="table",
    schema="fiap_fase04_curated"
) }}

with neighbourhood_normalized as (
    select
        REGEXP_REPLACE(NORMALIZE(upper(neighbourhood), NFD), r'\pM', '') as neighbourhood_name
    from {{ source('bq_raw', 'airbnb_neighbourhood') }}
    order by neighbourhood

)

select * from neighbourhood_normalized



