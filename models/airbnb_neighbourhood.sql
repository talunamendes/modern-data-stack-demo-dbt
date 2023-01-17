-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="table",
    database = "compact-works-374801",
    schema = "fiap_fase04_curated_dataset",
    cluster_by = "neighbourhood"
) }}

with neighbourhood_normalized as (
    select
        REGEXP_REPLACE(NORMALIZE(upper(neighbourhood), NFD), r'\pM', '') as neighbourhood
    from `compact-works-374801.fiap_fase04_raw_dataset.airbnb_neighbourhood`
    order by neighbourhood

)

with  airbnb_neighbourhood (
    select {{dbt_utils.surrogate_key(['neighbourhood_normalized.neighbourhood'])}} as neighbourhood_key,
        neighbourhood_normalized.neighbourhood
    from neighbourhood_normalized
)

select * from airbnb_neighbourhood



