-- noinspection SqlNoDataSourceInspectionForFile

{{ config(
    materialized="table"
) }}


with listings_summary as (
SELECT
	id,
	host_id,
	host_since,
	REGEXP_REPLACE(NORMALIZE(upper(neighbourhood_cleansed), NFD), r'\pM', '') as neighbourhood ,
	latitude ,
	longitude ,
	room_type,
	price,
	has_availability ,
	availability_30 ,
	availability_60 ,
	availability_90 ,
	availability_365
from {{ source('airbnb', 'raw_airbnb_listings') }}
order by neighbourhood_cleansed

)

select * from listings_summary



