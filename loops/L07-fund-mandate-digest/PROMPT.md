Run Orion loop **L07 — Fund + mandate digest** (OPS-07).

SSH to VPS. Informational digest only — no code changes.

1. Query mandate records and fund snapshot via mcp-vault tools on VPS (production paths).
2. Postgres: count active orion_circle_subscriptions if table exists.
3. Post digest: THB committed, mandate count, active Insider subs — no tokens.

If tools missing → FAIL with what's missing (not BLOCKED unless would stub).

Reference: loops/L07-fund-mandate-digest/LOOP.md
