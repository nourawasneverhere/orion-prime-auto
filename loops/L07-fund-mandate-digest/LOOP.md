# L07 — Fund + mandate digest

**Phase:** R4 · **Trigger:** Cron `0 17 * * 1` (Mon 17:00)

## Outcome

Weekly ops summary: fund snapshot, mandate records, circle subscriptions count.

## Steps

1. VPS → curl mcp-vault tool `get_orion_fund_snapshot` and `list_mandate_records`.
2. Postgres: `SELECT count(*) FROM orion_circle_subscriptions WHERE status='active'`.
3. Post digest (no tokens).

## Exit criteria

Digest posted with THB committed, mandate count, active Insider subs.
