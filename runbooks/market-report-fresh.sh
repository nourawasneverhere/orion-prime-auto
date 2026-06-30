#!/usr/bin/env bash
# L06 — market report freshness (14-day window)
set -euo pipefail
REPORTS="${EMPIRE_VAULT:-/root/Empire}/Atlas/Ventures/Orion-Prime/Operations/Engine/Reports"
MAX_AGE_DAYS=14

if [[ ! -d "$REPORTS" ]]; then
  echo "FAIL reports_dir missing $REPORTS"
  exit 1
fi

newest=$(find "$REPORTS" -type f -name 'mkt-*.md' -print0 2>/dev/null | xargs -0 ls -t 2>/dev/null | head -1)
if [[ -z "$newest" ]]; then
  echo "FAIL no_market_reports"
  exit 1
fi

now=$(date +%s)
mtime=$(stat -c %Y "$newest" 2>/dev/null || stat -f %m "$newest")
age_days=$(( (now - mtime) / 86400 ))
if [[ "$age_days" -le "$MAX_AGE_DAYS" ]]; then
  echo "OK market_report_fresh ${age_days}d $newest"
  exit 0
fi
echo "FAIL market_report_stale ${age_days}d $newest"
exit 1
