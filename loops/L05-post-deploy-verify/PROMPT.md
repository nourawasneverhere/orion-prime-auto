Run Orion loop **L05 — Post-deploy verify** (OPS-05).

SSH to VPS after Orion deploy/push:

  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  cd /root/orionprime/auto && bash runbooks/verify-only.sh

PASS → all verify scripts exit 0.
FAIL → report which verify failed; recommend BUILD-01 regression fix in empire-vault (complete only).

Reference: loops/L05-post-deploy-verify/LOOP.md
