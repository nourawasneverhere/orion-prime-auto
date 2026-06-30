#!/usr/bin/env bash
# L03 — IC queue must show deals when pipeline has seed data
set -euo pipefail
TOKEN="${ORION_PARTNER_TOKEN:?Set ORION_PARTNER_TOKEN}"
HTML=$(curl -sf "http://127.0.0.1:3006/ic-queue?token=${TOKEN}")
COUNT=$(echo "$HTML" | grep -c 'deal-seed' || true)
if [[ "$COUNT" -ge 1 ]]; then
  echo "OK ic-queue deals=$COUNT"
  exit 0
fi
echo "FAIL ic-queue empty or no deal-seed rows (count=$COUNT)"
exit 1
