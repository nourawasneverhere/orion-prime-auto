# Orion Prime — Automation Tasks (executable only)

> **Policy:** Palantir · Databricks · C3.ai · Snowflake · **no scaffold**.  
> Every row below is something **Cursor Automation can run today or when noted secret/domain exists**.  
> Human sales, legal, Gate 3 signature → not listed.

**Catalog GitHub:** https://github.com/nourawasneverhere/orion-prime-auto  
**VPS catalog path:** `/root/orionprime/auto`  
**Product GitHub:** https://github.com/nourawasneverhere/empire-vault  
**VPS product path:** `/root/orion-platform` · `/root/Empire`

---

## How to read

| Column | Meaning |
|--------|---------|
| **Id** | Task id for TASK-QUEUE tracking |
| **Loop** | MANIFEST loop / AUTO config |
| **Repo** | Cursor git checkout |
| **Exit** | PASS proof — not "agent finished" |
| **Now** | ✅ schedulable · ⏸ needs secret/domain · 🚫 product not built |

---

## Tier 1 — OPS monitor (prove employ-grade platform)

These **do not edit code**. SSH VPS → run runbook → PASS/FAIL.

| Id | Name | Loop | Cron | Runbook | Exit | Now |
|----|------|------|------|---------|------|-----|
| **OPS-01** | Daily platform + graph verify | L01 / AUTO-01 | `0 7 * * 1-5` | `runbooks/daily-health.sh` | All OK lines + verify:r1/r2/r4 exit 0 | ✅ |
| **OPS-02** | Weekly hardening E2E | L02 / AUTO-02 | `0 6 * * 1` | `runbooks/hardening-weekly.sh` | hardening:e2e exit 0 | ✅ |
| **OPS-03** | Deal Room + IC queue (AGE read path) | L03 / AUTO-03 | `0 8 * * *` | `runbooks/ic-queue-smoke.sh` | IC HTML shows deals | ✅ |
| **OPS-04** | Gate 3 ops nudge | L04 / AUTO-04 | `0 9 * * 5` | agent reads vault log + mandate count | Nudge posted; no code change | ✅ |
| **OPS-05** | Post-deploy verify | L05 / AUTO-05 | git push Orion | `runbooks/verify-only.sh` | verify exit 0 | ✅ |
| **OPS-06** | Market report freshness | L06 / AUTO-06 | `0 10 * * 3` | `runbooks/market-report-fresh.sh` | Report ≤14 days old | ✅ |
| **OPS-07** | Fund + mandate digest | L07 / AUTO-07 | `0 17 * * 1` | agent MCP/Postgres queries | Digest without secrets | ✅ |
| **OPS-08** | TLS + public URLs | L08 / AUTO-08 | `0 6 * * 0` | `runbooks/tls-watch.sh` | HTTPS 200 on paths | ⏸ `ORION_PUBLIC_DOMAIN` |
| **OPS-09** | BullMQ / Redis / workers | L09 / AUTO-09 | `30 7 * * *` | `runbooks/worker-health.sh` | Redis PONG + low restarts | ✅ |
| **OPS-10** | Qdrant + Redis infra | L10 / AUTO-10 | `0 5 * * 0` | `runbooks/infra-backup-check.sh` | Qdrant + Redis up | ✅ |

### Knowledge graph — covered by OPS (no separate product build)

| Id | What | How automation proves it |
|----|------|---------------------------|
| **GRAPH-01** | AGE pipeline + curated investors | **OPS-01** → verify:r1 `graph-curated-investors`, `advance_deal` gate |
| **GRAPH-02** | IC queue reads AGE `{properties}` shape | **OPS-03** → ic-queue-smoke |
| **GRAPH-03** | Deal signals / BullMQ on graph writes | **OPS-09** + **OPS-02** hardening |

Full twin-spec sync + staleness monitor = **BUILD** rows (Tier 3), not OPS.

---

## Tier 2 — GATE (block scaffold PRs)

| Id | Name | Loop | Repo | Trigger | Exit | Now |
|----|------|------|------|---------|------|-----|
| **GATE-21** | Scaffold gate on PR | L21 / AUTO-11 | empire-vault | PR touches `orion-platform/`, `mcp-vault/`, Orion paths | Comment FAIL on SCAFFOLD-REJECT match; no approve | ✅ |

---

## Tier 3 — BUILD (one row per run · empire-vault)

Automation **may edit code**, deploy, verify on VPS, open PR. **One id per run.**

| Id | Row | Phase | Exit verify | Now |
|----|-----|-------|-------------|-----|
| **BUILD-01** | OPS regression fix from failed OPS-01..10 | — | Same runbook PASS after fix | ✅ when OPS fails |
| **BUILD-02** | Circle Insider Osan billing (paid tier) | R2 | verify:r2 + live billing path | ⬜ |
| **BUILD-03** | HTTPS nginx + certbot | R4 | OPS-08 PASS after domain | ⏸ domain |
| **BUILD-04** | Ghost MCP capital routing | R4 | New verify step + E2E | 🚫 not built |
| **BUILD-05** | Graph twin-spec → AGE writer full sync | L2 | verify:r1 + staleness query | ⬜ |
| **BUILD-06** | Graph staleness monitor (empire policy) | L2 | Cron + alert; no stale reads in agents | ⬜ |
| **BUILD-07** | mcp-osan production-only Orion revenue | L1 MCP | verify:r1 Osan path | ⬜ |
| **BUILD-08** | Portfolio Monitor + AssetHealth (real KPI) | R3 | verify:r3 when exists | 🚫 R3 not built |
| **BUILD-09** | SPV / syndication state machines | R4 | verify:r4 extension | 🚫 partial |
| **BUILD-10** | Fund I + institutional portal | R6 | verify:r6 when exists | 🚫 not built |

**L22 / AUTO-12:** pick first ⬜ in this table (skip 🚫 and ⏸).

---

## Tier 4 — Not automatable (human-only)

Do **not** schedule in Cursor:

- Gate 3 production close (signed mandate + deposit)
- Legal counsel on templates
- Mom Test / sales calls
- LP token issuance to real clients
- DNS purchase / domain registration (you provide domain; automation runs BUILD-03 + OPS-08)

---

## Tier 5 — Future OPS (enable when R5–R6 product exists)

| Loop | When |
|------|------|
| L16–L20 | See `phases/R5-R6-fund.md` — create AUTO configs after product ships |

---

## VPS bootstrap (once)

Automation or deploy runs:

```bash
bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
```

Clones/syncs this repo to **`/root/orionprime/auto`**. All runbooks assume that path.

---

## Cursor wiring summary

| Automation | Git repo | Instructions source |
|------------|----------|---------------------|
| AUTO-01 … AUTO-10 | `orion-prime-auto` | `prompts/MANDATORY-BRIEF.txt` + `loops/Lxx/PROMPT.md` |
| AUTO-11 | `empire-vault` | `prompts/MANDATORY-BRIEF.txt` + `loops/L21/PROMPT.md` |
| AUTO-12 | `empire-vault` | `prompts/MANDATORY-BRIEF.txt` + BUILD row from this file |

Configs: `automations/AUTO-*.json` · Setup: **CURSOR-SETUP.md**

---

## End-to-end Orion

**Automations alone do not finish Orion.** They:

1. **Prove** R1–R4 stack stays green (Tier 1 + graph OPS)  
2. **Block** scaffold merges (Tier 2)  
3. **Close one BUILD row** at a time (Tier 3)  

**You** close Gate 3 revenue and legal. **Full checklist** remains in empire-vault `Orion-Complete-Products-Services-Tech-Checklist.md`.
