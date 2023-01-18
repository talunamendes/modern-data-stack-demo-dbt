-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="view"
) }}

with airbnb as (
select
    lis.id,
	lis.neighbourhood,
	cal.available,
    cal.date
from {{ ref('cleansed_airbnb_listing') }} lis
    inner join {{ ref('cleansed_airbnb_calendar') }} cal on list.id = cal.listing_id
order by lis.host_id, lis.id, cal.date
)
select * from airbnb



