with base as (
    select * from {{ ref('stg_sp500_traffic') }}
),

aggregated as (
    select
        company_name,
        ticker,
        country,
        sum(total_visits)                    as total_visits,
        avg(total_bounce_rate)               as avg_bounce_rate,
        avg(total_avg_visit_duration)        as avg_visit_duration,
        avg(total_pages_per_visit)           as avg_pages_per_visit
    from base
    group by 1, 2, 3
)

select * from aggregated
order by total_visits desc