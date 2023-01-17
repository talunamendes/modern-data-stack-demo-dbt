-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="table",
) }}


with calendar_summary as (
SELECT
	listing_id,
	date,
    price,
    available
from {{ source('airbnb', 'raw_airbnb_calendar') }}
order by date

)
select * from calendar_summary



