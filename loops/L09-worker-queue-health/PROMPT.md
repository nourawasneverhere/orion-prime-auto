Run Orion loop **L09 — BullMQ / worker health** (OPS-09 · GRAPH-03).

SSH to VPS:

  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  cd /root/orionprime/auto && bash runbooks/worker-health.sh

PASS → Redis PONG + empire-orion-platform active + low restart count.
FAIL → journalctl -u empire-orion-platform -n 30 — no stub worker patches.

Reference: loops/L09-worker-queue-health/LOOP.md
