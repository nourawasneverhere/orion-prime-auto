#!/usr/bin/env bash
# L09 — BullMQ / Redis / worker health
set -euo pipefail
FAIL=0
check() {
  local name="$1"; shift
  if bash -c "$*" >/dev/null 2>&1; then echo "OK $name"; else echo "FAIL $name"; FAIL=1; fi
}

check redis_ping 'docker exec orion-platform-redis-1 redis-cli ping | grep -q PONG'
check systemd_orion 'systemctl is-active --quiet empire-orion-platform'
exits=$(journalctl -u empire-orion-platform --since "24 hours ago" 2>/dev/null | grep -c "exited" || true)
if [[ "$exits" -le 2 ]]; then echo "OK worker_exits_24h $exits"; else echo "FAIL worker_exits_24h $exits"; FAIL=1; fi
exit "$FAIL"
