#!/usr/bin/env bash
# L10 — Qdrant + Redis docker health (backup policy check-lite)
set -euo pipefail
FAIL=0
check() { if "$@"; then echo "OK $1"; else echo "FAIL $1"; FAIL=1; fi; }

check qdrant 'curl -sf http://127.0.0.1:6335/healthz >/dev/null || curl -sf http://127.0.0.1:6335/ >/dev/null'
check redis 'redis-cli -p 6380 ping | grep -q PONG'
if docker ps --format '{{.Names}}' 2>/dev/null | grep -qE 'qdrant|redis'; then
  echo "OK docker_containers"
else
  echo "FAIL docker_containers"
  FAIL=1
fi
exit "$FAIL"
