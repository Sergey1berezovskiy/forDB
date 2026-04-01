#!/usr/bin/env bash
set -euo pipefail 

echo "==> Refreshing materialized views..." 
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_weekly_plan_fact;" 
echo "==> mv_weekly_plan_fact DONE." 
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_weekly_so;" 
echo "==> mv_weekly_so DONE." psql -v ON_ERROR_STOP=1 
"$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_dash_long;" 
echo "==> mv_dash_long DONE." psql -v ON_ERROR_STOP=1 
"$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_stock_level;" 
echo "==> mv_stock_level DONE." 
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c 
"REFRESH MATERIALIZED VIEW CONCURRENTLY mv_detailed_so_stock;" 
echo "==> mv_detailed_so_stock DONE." 
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c 
"REFRESH MATERIALIZED VIEW CONCURRENTLY mv_promo_bonus;" 
echo "==> mv_promo_bonus DONE." 
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c 
"REFRESH MATERIALIZED VIEW CONCURRENTLY mv_promo_bonus_monthly_and_limit_long;"
echo "==> mv_promo_bonus_monthly_and_limit_long DONE." 
echo "==> Done."
