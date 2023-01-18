{{ config(
    materialized="view"
) }}

with airbnb_covid as (
select
    lis.id,
	lis.neighbourhood,
	cal.available,
    cal.date,
    cov.dt_inicio_sintomas
from {{ ref('cleansed_airbnb_listing') }} lis
    inner join {{ ref('cleansed_airbnb_calendar') }} cal on list.id = cal.listing_id
    inner join {{ source('raw_covid')}} cov on REGEXP_REPLACE(NORMALIZE(upper(cov.bairro_resid__estadia), NFD), r'\pM', '')
     = lis.neighbourhood and cov.dt_inicio_sintomas = cal.date --TODO transformacao de datas para mesmo formato
order by lis.host_id, lis.id, cal.date
)
select * from airbnb