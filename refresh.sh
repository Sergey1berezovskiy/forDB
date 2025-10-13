#!/usr/bin/env bash
set -euo pipefail

echo "==> Refreshing materialized views..."
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_weekly_plan_fact;"
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_weekly_so;"
psql -v ON_ERROR_STOP=1 "$DATABASE_URL" -c "REFRESH MATERIALIZED VIEW CONCURRENTLY mv_dash_long;"
echo "==> Done."
