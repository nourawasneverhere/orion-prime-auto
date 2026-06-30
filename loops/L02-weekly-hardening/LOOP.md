# L02 — Weekly hardening E2E

**Phase:** R1–R2 · **Trigger:** Cron `0 6 * * 1` (Mon 06:00)

## Outcome

Full `hardening:e2e` pass on VPS; failures block “green week” status.

## Steps

1. SSH VPS → `cd /root/orion-platform && node src/scripts/hardening-e2e.mjs`
2. Capture full JSON output.
3. PASS if `ok: true`; else list failed step names.

## Exit criteria

- `hardening:e2e` exit code 0

## Escalate

Re-run deploy: `DEPLOY-ORION-PLATFORM.sh` (human approval).
