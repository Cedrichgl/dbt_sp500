with base as (
    select * from {{ ref('stg_sp500_traffic') }}
),

aggregated as (
    select
        date,
        company_name,
        ticker,
        total_visits,
        total_bounce_rate,
        total_avg_visit_duration
    from base
)

select * from aggregated
order by company_name, date