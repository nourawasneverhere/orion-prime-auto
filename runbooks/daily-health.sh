#!/usr/bin/env bash
# L01 — daily health checks on Orion VPS
set -euo pipefail
export EMPIRE_VAULT="${EMPIRE_VAULT:-/root/Empire}"
export ORION_AUTO="${ORION_AUTO:-/root/orionprime/auto}"
PLATFORM="${ORION_PLATFORM:-/root/orion-platform}"
FAIL=0

check() {
  local name="$1"
  shift
  if bash -c "$*" >/dev/null 2>&1; then
    echo "OK $name"
  else
    echo "FAIL $name"
    FAIL=1
  fi
}

check curl_3004 'curl -sf http://127.0.0.1:3004/health'
check curl_3005 'curl -sf http://127.0.0.1:3005/health'
check curl_3006 'curl -sf http://127.0.0.1:3006/health'
check curl_3007 'curl -sf http://127.0.0.1:3007/health'
check systemd_orion 'systemctl is-active --quiet empire-orion-platform'

cd "$PLATFORM"
check verify_r1 'node src/scripts/verify-r1.mjs'
check verify_r2 'node src/scripts/verify-r2.mjs'
check verify_r4 'node src/scripts/verify-r4.mjs'

exit "$FAIL"
