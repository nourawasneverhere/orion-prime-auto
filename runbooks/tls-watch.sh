#!/usr/bin/env bash
# L08 — TLS / nginx public health (requires ORION_PUBLIC_DOMAIN)
set -euo pipefail
DOMAIN="${ORION_PUBLIC_DOMAIN:-}"

if [[ -z "$DOMAIN" ]]; then
  echo "BLOCKED tls_no_domain — set ORION_PUBLIC_DOMAIN in automation secrets"
  exit 2
fi

FAIL=0
for path in / /deal-room/ /portal/ /circle/; do
  if curl -sf "https://${DOMAIN}${path}" -o /dev/null; then
    echo "OK https_${DOMAIN}${path}"
  else
    echo "FAIL https_${DOMAIN}${path}"
    FAIL=1
  fi
done

if command -v certbot >/dev/null; then
  expiry=$(certbot certificates 2>/dev/null | grep -A2 "$DOMAIN" | grep 'Expiry Date' || true)
  if [[ -n "$expiry" ]]; then echo "OK certbot_expiry $expiry"; else echo "FAIL certbot_cert"; FAIL=1; fi
else
  echo "FAIL certbot_missing"
  FAIL=1
fi
exit "$FAIL"
