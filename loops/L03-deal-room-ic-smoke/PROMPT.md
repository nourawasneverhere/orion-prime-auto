Run Orion loop **L03 — Deal Room + IC queue smoke** (OPS-03 · GRAPH-02).

SSH to VPS. ORION_PARTNER_TOKEN required in automation secrets.

  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  cd /root/orionprime/auto && bash runbooks/ic-queue-smoke.sh

PASS → IC queue shows deals (AGE properties path OK).
FAIL → check nodeProps normalization in deal-room; journalctl empire-orion-platform -n 20.

Never print token value.

Reference: loops/L03-deal-room-ic-smoke/LOOP.md
