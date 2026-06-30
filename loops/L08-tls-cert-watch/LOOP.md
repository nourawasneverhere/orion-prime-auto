# L08 — TLS cert watch

**Phase:** Infra · **Trigger:** Cron `0 6 * * 0` (Sun 06:00)

## Outcome

Alert if cert missing, expiring <14 days, or HTTPS endpoints fail.

## Steps

1. If `ORION_PUBLIC_DOMAIN` unset → PASS with note “TLS not configured”.
2. Else: `certbot certificates` on VPS; check expiry.
3. `curl -I https://$DOMAIN/circle/` → expect 200.

## Exit criteria

Cert valid >14 days OR TLS not yet configured (informational).
