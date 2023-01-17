-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="table"
) }}

with neighbourhood_normalized as (
    select
        REGEXP_REPLACE(NORMALIZE(upper(neighbourhood), NFD), r'\pM', '') as neighbourhood_name
    from {{ source('airbnb', 'raw_airbnb_neighbourhood') }}
    order by neighbourhood

)

select * from neighbourhood_normalized



