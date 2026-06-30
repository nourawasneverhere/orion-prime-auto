# L04 — Gate 3 ops nudge

**Phase:** R1 · **Trigger:** Cron `0 9 * * 5` (Fri 09:00)

## Outcome

Human reminded to log Mom Test calls and check production Gate 3 status.

## Steps

1. Read `Atlas/Ventures/Orion-Prime/Operations/GTM/Conversation-Log.md` — count rows with real dates (exclude header).
2. Call vault `list_mandate_records` on VPS — count production vs sandbox mandates.
3. Post nudge: conversations logged, mandates on record, link to Gate-3 doc.

## Exit criteria

N/A — informational loop (always PASS if message sent).

## Human action

- Log Mom Test rows
- Run `npm run gate3:mandate` only after **real** signed mandate
