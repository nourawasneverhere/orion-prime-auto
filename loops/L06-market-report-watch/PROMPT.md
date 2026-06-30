Run Orion loop **L06 — Market report freshness** (OPS-06).

SSH to VPS:

  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  cd /root/orionprime/auto && bash runbooks/market-report-fresh.sh

PASS → newest mkt-*.md within 14 days.
FAIL → check market-report-worker in empire-orion-platform logs; restart service if needed — no stub reports.

Reference: loops/L06-market-report-watch/LOOP.md
