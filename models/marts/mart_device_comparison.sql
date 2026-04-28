with base as (
    select * from {{ ref('stg_sp500_traffic') }}
),

aggregated as (
    select
        company_name,
        ticker,
        sum(desktop_visits)                  as total_desktop_visits,
        sum(mobile_visits)                   as total_mobile_visits,
        sum(total_visits)                    as total_visits,
        round(
            sum(desktop_visits) / nullif(sum(total_visits), 0) * 100, 2
        )                                    as desktop_share_pct,
        round(
            sum(mobile_visits) / nullif(sum(total_visits), 0) * 100, 2
        )                                    as mobile_share_pct
    from base
    group by 1, 2
)

select * from aggregated
order by total_visits desc