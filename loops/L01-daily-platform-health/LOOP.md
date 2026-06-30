# L01 — Daily platform health

**Phase:** R1–R2 · **Trigger:** Cron `0 7 * * 1-5` (weekdays 07:00)

## Outcome

All Orion services healthy; verify scripts pass; one-line ops summary posted.

## Steps

1. SSH to VPS (`ORION_VPS_HOST`).
2. Run `runbooks/daily-health.sh`.
3. Parse JSON summary: all checks must be `ok: true`.
4. On PASS → post green summary (loop id L01).
5. On FAIL → post failing check names + `systemctl status empire-orion-platform empire-mcp-orion empire-mcp-vault` excerpt.

## Exit criteria

| Check | Pass |
|-------|------|
| `:3004/health` | HTTP 200 |
| `:3005/health` | HTTP 200, auth configured |
| `:3006/health` | HTTP 200 |
| `:3007/health` | HTTP 200 |
| `verify:r1` | exit 0 |
| `verify:r2` | exit 0 |
| `verify:r4` | exit 0 |
| systemd | `empire-orion-platform` active |

## Escalate

Run manual: `ssh root@VPS 'journalctl -u empire-orion-platform -n 50'`
