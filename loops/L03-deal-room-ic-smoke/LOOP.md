# L03 — Deal Room + IC queue smoke

**Phase:** R2 · **Trigger:** Cron `0 8 * * *` (daily 08:00)

## Outcome

Deal Room auth works; IC queue shows deals in screening/term_sheet/due_diligence (not “Queue empty” when pipeline has seed deals).

## Steps

1. SSH VPS.
2. Run `runbooks/ic-queue-smoke.sh` with `ORION_PARTNER_TOKEN` from secrets.
3. Count `<tr><td>` rows in IC queue HTML (expect ≥1 on seed pipeline).
4. Hit `/deal-room/health` without token → expect 200 on health only; IC path requires token.

## Exit criteria

- Health 200
- IC queue HTML contains at least one `deal-seed` row OR pipeline API returns deals with normalized status

## Escalate

Check `nodeProps` / AGE normalization in deal-room http-server.
