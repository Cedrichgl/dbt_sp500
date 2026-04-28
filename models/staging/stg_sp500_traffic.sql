
WITH SOURCE AS (

SELECT * FROM {{ source("sp500_raw", "SP_500") }}

), 

RENAMED AS (
    
    SELECT 
        company_name,
        ticker,
        domain,
        country,

        date::date as date,

        desktop_visits::float            as desktop_visits,
        desktop_bounce_rate::float       as desktop_bounce_rate,
        desktop_avg_visit_duration::float as desktop_avg_visit_duration,
        desktop_pages_per_visit::float   as desktop_pages_per_visit,

        mobile_visits::float             as mobile_visits,
        mobile_bounce_rate::float        as mobile_bounce_rate,
        mobile_avg_visit_duration::float as mobile_avg_visit_duration,
        mobile_pages_per_visit::float    as mobile_pages_per_visit,

        total_visits::float              as total_visits,
        total_bounce_rate::float         as total_bounce_rate,
        total_avg_visit_duration::float  as total_avg_visit_duration,
        total_pages_per_visit::float     as total_pages_per_visit

        FROM SOURCE


)

select * from renamed

