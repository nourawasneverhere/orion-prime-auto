#!/usr/bin/env bash
# L01 — daily health checks on Orion VPS
set -euo pipefail
export EMPIRE_VAULT="${EMPIRE_VAULT:-/root/Empire}"
PLATFORM="${ORION_PLATFORM:-/root/orion-platform}"
FAIL=0

check() {
  local name="$1"
  shift
  if "$@"; then
    echo "OK $name"
  else
    echo "FAIL $name"
    FAIL=1
  fi
}

check curl_3004 'curl -sf http://127.0.0.1:3004/health >/dev/null'
check curl_3005 'curl -sf http://127.0.0.1:3005/health >/dev/null'
check curl_3006 'curl -sf http://127.0.0.1:3006/health >/dev/null'
check curl_3007 'curl -sf http://127.0.0.1:3007/health >/dev/null'
check systemd_orion 'systemctl is-active --quiet empire-orion-platform'

cd "$PLATFORM"
check verify_r1 'node src/scripts/verify-r1.mjs >/dev/null'
check verify_r2 'node src/scripts/verify-r2.mjs >/dev/null'
check verify_r4 'node src/scripts/verify-r4.mjs >/dev/null'

exit "$FAIL"
