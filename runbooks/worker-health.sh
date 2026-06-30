#!/usr/bin/env bash
# L09 — BullMQ / Redis / worker health
set -euo pipefail
FAIL=0
check() { if "$@"; then echo "OK $1"; else echo "FAIL $1"; FAIL=1; fi; }

check redis_ping 'redis-cli -p 6380 ping | grep -q PONG'
check systemd_orion 'systemctl is-active --quiet empire-orion-platform'
exits=$(journalctl -u empire-orion-platform --since "24 hours ago" 2>/dev/null | grep -c "exited" || true)
if [[ "$exits" -le 2 ]]; then echo "OK worker_exits_24h $exits"; else echo "FAIL worker_exits_24h $exits"; FAIL=1; fi
exit "$FAIL"
