Run Orion loop **L10 — Qdrant + Redis infra** (OPS-10).

SSH to VPS:

  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  cd /root/orionprime/auto && bash runbooks/infra-backup-check.sh

PASS → Qdrant + Redis reachable; docker containers running.
FAIL → docker ps / systemctl status — escalate; do not mark PASS without real infra.

Reference: loops/L10-infra-backup/LOOP.md
