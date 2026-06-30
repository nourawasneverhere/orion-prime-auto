Run Orion loop **L08 — TLS cert watch** (OPS-08).

Requires ORION_PUBLIC_DOMAIN in automation secrets. If missing → report BLOCKED tls_no_domain (exit 2 from runbook).

SSH to VPS:

  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  export ORION_PUBLIC_DOMAIN="$ORION_PUBLIC_DOMAIN"
  cd /root/orionprime/auto && bash runbooks/tls-watch.sh

PASS → HTTPS 200 on / /deal-room/ /portal/ /circle/ + certbot expiry OK.
FAIL → escalate for BUILD-03 (complete nginx+certbot fix only).

Reference: loops/L08-tls-cert-watch/LOOP.md
