Run Orion loop **L02 — Weekly hardening E2E** (OPS-02).

SSH to VPS (ORION_VPS_* secrets). Ensure catalog:
  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh

Run:
  cd /root/orionprime/auto && bash runbooks/hardening-weekly.sh

PASS → report OK hardening-e2e.
FAIL → list failed checks; suggest graph / qdrant / redis / deal-room auth — do not ship stub fixes.

Reference: loops/L02-weekly-hardening/LOOP.md
