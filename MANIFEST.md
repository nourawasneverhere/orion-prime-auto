# Empire Orion Prime Auto — Manifest

> All loops governed by **CORE-BRIEF.md** — enterprise-grade only; no scaffold.

## Ops loops (prove platform stays sell-grade)

| Id | Loop | Phase | Trigger | Type | Status |
|----|------|-------|---------|------|--------|
| **L01** | [Daily platform health](loops/L01-daily-platform-health/LOOP.md) | R1–R2 | Cron weekdays 07:00 | OPS | 🔲 draft |
| **L02** | [Weekly hardening E2E](loops/L02-weekly-hardening/LOOP.md) | R1–R2 | Cron Mon 06:00 | OPS | 🔲 draft |
| **L03** | [Deal Room + IC queue smoke](loops/L03-deal-room-ic-smoke/LOOP.md) | R2 | Cron daily 08:00 | OPS | 🔲 draft |
| **L04** | [Gate 3 ops nudge](loops/L04-gate3-ops-nudge/LOOP.md) | R1 | Cron Fri 09:00 | OPS | 🔲 draft |
| **L05** | [Post-deploy verify](loops/L05-post-deploy-verify/LOOP.md) | R1–R4 | Git push / webhook | OPS | 🔲 draft |
| **L06** | [Market report freshness](loops/L06-market-report-watch/LOOP.md) | R2 | Cron Wed 10:00 | OPS | 🔲 draft |
| **L07** | [Fund + mandate digest](loops/L07-fund-mandate-digest/LOOP.md) | R4 | Cron Mon 17:00 | OPS | 🔲 draft |
| **L08** | [TLS cert watch](loops/L08-tls-cert-watch/LOOP.md) | Infra | Cron Sun 06:00 | OPS | 🔲 draft |
| **L09** | [BullMQ / worker health](loops/L09-worker-queue-health/LOOP.md) | R2–R3 | Cron daily 07:30 | OPS | 🔲 draft |
| **L10** | [Qdrant + Redis backup check](loops/L10-infra-backup/LOOP.md) | Infra | Cron Sun 05:00 | OPS | 🔲 draft |

## Build / gate loops (ship enterprise-grade product only)

| Id | Loop | Phase | Trigger | Type | Status |
|----|------|-------|---------|------|--------|
| **L21** | Scaffold gate on PR | R1–R6 | Git PR (Orion paths) | BUILD-GATE | 🔲 planned |
| **L22** | Checklist row closer | R1–R6 | Manual / webhook | BUILD | 🔲 planned |

**L21** enforces `SCAFFOLD-REJECT.md` + verify scripts on every Orion diff.  
**L22** implements one checklist row end-to-end per run; must pass CORE-BRIEF or BLOCKED.

**Status:** 🔲 draft · 🟡 live in Cursor · ✅ verified 7d green

---

## Phase activation

| Release | Enable loops |
|---------|----------------|
| **R1–R2 (now)** | L01–L06, L09, L10 |
| **R4** | + L07, L08 |
| **R3** | + L09 (portfolio monitor extensions — see `phases/R3-ops.md`) |
| **R5–R6** | Add loops in `phases/R5-R6-fund.md` when built |

---

## Not in this catalog (human-only)

- Mom Test live calls
- Production Gate 3 signature + deposit
- Legal counsel review
- LP token issuance to real clients (use L07 digest; create tokens manually)
- Full `DEPLOY-ORION-PLATFORM.sh` on every cron (use L05 on intentional pushes only)
