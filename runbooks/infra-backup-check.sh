#!/usr/bin/env bash
# L10 — Qdrant + Redis docker health (backup policy check-lite)
set -euo pipefail
FAIL=0
check() {
  local name="$1"; shift
  if bash -c "$*" >/dev/null 2>&1; then echo "OK $name"; else echo "FAIL $name"; FAIL=1; fi
}

check qdrant 'curl -sf http://127.0.0.1:6335/healthz || curl -sf http://127.0.0.1:6335/'
check redis 'docker exec orion-platform-redis-1 redis-cli ping | grep -q PONG'
if docker ps --format '{{.Names}}' 2>/dev/null | grep -qE 'qdrant|redis'; then
  echo "OK docker_containers"
else
  echo "FAIL docker_containers"
  FAIL=1
fi
exit "$FAIL"
