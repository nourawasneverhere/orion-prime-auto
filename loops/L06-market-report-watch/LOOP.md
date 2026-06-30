# L06 — Market report freshness

**Phase:** R2 · **Trigger:** Cron `0 10 * * 3` (Wed 10:00)

## Outcome

Market Agent output exists in vault within last 14 days.

## Steps

1. SSH VPS → list newest file in `$EMPIRE_VAULT/Atlas/Ventures/Orion-Prime/Operations/Engine/Reports/`
2. Check mtime ≤ 14 days.
3. Optional: confirm market-report-worker in systemd logs ran in last 7 days.

## Exit criteria

- At least one report file modified within 14 days OR worker log shows successful run

## Escalate

Restart `empire-orion-platform`; check market-report-worker.
