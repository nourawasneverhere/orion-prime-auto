# Orion Prime Auto — Manifest

> **GitHub:** https://github.com/nourawasneverhere/orion-prime-auto  
> **VPS path:** `/root/orionprime/auto`  
> **All automations:** [[CORE-BRIEF]] · [[GOVERNANCE]] · [[AUTOMATION-TASKS]]

---

## Cursor Automations (cloud agents)

| Id | Name | Trigger | Type | Config | Status |
|----|------|---------|------|--------|--------|
| **AUTO-01** | Daily platform + graph verify | Cron `0 7 * * 1-5` | OPS | `automations/AUTO-01-daily-health.json` | 🔲 draft |
| **AUTO-02** | Weekly hardening E2E | Cron `0 6 * * 1` | OPS | `automations/AUTO-02-hardening.json` | 🔲 draft |
| **AUTO-03** | IC queue / AGE smoke | Cron `0 8 * * *` | OPS | `automations/AUTO-03-ic-smoke.json` | 🔲 draft |
| **AUTO-04** | Gate 3 ops nudge | Cron `0 9 * * 5` | OPS | `automations/AUTO-04-gate3-nudge.json` | 🔲 draft |
| **AUTO-05** | Post-deploy verify | Git push Orion paths | OPS | `automations/AUTO-05-post-deploy.json` | 🔲 draft |
| **AUTO-06** | Market report freshness | Cron `0 10 * * 3` | OPS | `automations/AUTO-06-market-report.json` | 🔲 draft |
| **AUTO-07** | Fund + mandate digest | Cron `0 17 * * 1` | OPS | `automations/AUTO-07-fund-digest.json` | 🔲 draft |
| **AUTO-08** | TLS watch | Cron `0 6 * * 0` | OPS | `automations/AUTO-08-tls-watch.json` | 🔲 draft |
| **AUTO-09** | Worker + Redis health | Cron `30 7 * * *` | OPS | `automations/AUTO-09-worker-health.json` | 🔲 draft |
| **AUTO-10** | Infra backup check | Cron `0 5 * * 0` | OPS | `automations/AUTO-10-infra-backup.json` | 🔲 draft |
| **AUTO-11** | Scaffold PR gate | PR empire-vault Orion paths | GATE | `automations/AUTO-11-scaffold-gate.json` | 🔲 draft |
| **AUTO-12** | Checklist row closer | Cron `0 9 * * 1-5` | BUILD | `automations/AUTO-12-builder.json` | 🔲 draft |

**Task index:** [[TASK-QUEUE]] · **Full specs:** [[AUTOMATION-TASKS]]

---

## Ops loops L01–L10

| Id | Loop | Phase | Maps to |
|----|------|-------|---------|
| **L01** | [Daily platform health](loops/L01-daily-platform-health/LOOP.md) | R1–R2 | OPS-01 / AUTO-01 |
| **L02** | [Weekly hardening](loops/L02-weekly-hardening/LOOP.md) | R1–R2 | OPS-02 / AUTO-02 |
| **L03** | [Deal Room + IC smoke](loops/L03-deal-room-ic-smoke/LOOP.md) | R2 | OPS-03 / AUTO-03 |
| **L04** | [Gate 3 nudge](loops/L04-gate3-ops-nudge/LOOP.md) | R1 | OPS-04 / AUTO-04 |
| **L05** | [Post-deploy verify](loops/L05-post-deploy-verify/LOOP.md) | R1–R4 | OPS-05 / AUTO-05 |
| **L06** | [Market report watch](loops/L06-market-report-watch/LOOP.md) | R2 | OPS-06 / AUTO-06 |
| **L07** | [Fund + mandate digest](loops/L07-fund-mandate-digest/LOOP.md) | R4 | OPS-07 / AUTO-07 |
| **L08** | [TLS cert watch](loops/L08-tls-cert-watch/LOOP.md) | Infra | OPS-08 / AUTO-08 |
| **L09** | [Worker queue health](loops/L09-worker-queue-health/LOOP.md) | R2–R3 | OPS-09 / AUTO-09 |
| **L10** | [Infra backup check](loops/L10-infra-backup/LOOP.md) | Infra | OPS-10 / AUTO-10 |

---

## Build / gate loops

| Id | Loop | Maps to |
|----|------|---------|
| **L21** | [Scaffold gate](loops/L21-scaffold-gate/LOOP.md) | GATE-21 / AUTO-11 |
| **L22** | Checklist row closer | BUILD-* / AUTO-12 |

---

## Phase activation

| Release | Enable AUTO |
|---------|-------------|
| **R1–R2 (now)** | AUTO-01 … AUTO-06, AUTO-09, AUTO-10, AUTO-11 |
| **R4** | + AUTO-07, AUTO-08 (when domain) |
| **R3** | + AUTO-09 extensions |
| **BUILD** | AUTO-12 when ⬜ BUILD rows open |
| **R5–R6** | L16–L20 (future) — see `phases/R5-R6-fund.md` |

---

## Human-only

Mom Test · production Gate 3 signature · legal counsel · real LP tokens

**Status:** 🔲 draft · 🟡 live in Cursor · ✅ verified 7d green
