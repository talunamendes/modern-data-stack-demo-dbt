-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="table",
    database="compact-works-374801",
    schema="fiap_fase04_curated"
) }}

with neighbourhood_normalized as (
    select
        REGEXP_REPLACE(NORMALIZE(upper(neighbourhood), NFD), r'\pM', '') as neighbourhood_name
    --from `compact-works-374801.fiap_fase04_raw.airbnb_neighbourhood`
    from {{ source('bq_raw', 'airbnb_neighbourhood') }}
    order by neighbourhood

)

select * from neighbourhood_normalized



