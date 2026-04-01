#!/usr/bin/env bash
set -euo pipefail

refresh_mv () {
  local mv=$1
  echo "==> Refreshing $mv ..."
  psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c "
    SET work_mem = '256MB';
    REFRESH MATERIALIZED VIEW CONCURRENTLY $mv;
  "
  echo "==> $mv DONE."
}

refresh_mv mv_weekly_plan_fact
refresh_mv mv_weekly_so
refresh_mv mv_dash_long
refresh_mv mv_stock_level
refresh_mv mv_detailed_so_stock
refresh_mv mv_promo_bonus
refresh_mv mv_promo_bonus_monthly_and_limit_long
