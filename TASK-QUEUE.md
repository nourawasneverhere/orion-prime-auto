# Orion Prime — Automation Task Queue

> **OPS loops** = monitor (L01–L10). **BUILD rows** = ship one checklist item (L22). **Human** = not automatable.  
> Canonical checklist: `empire-vault` → `Atlas/Ventures/Orion-Prime/Operations/Engine/Build/Orion-Complete-Products-Services-Tech-Checklist.md`

**Legend:** ⬜ Open · 🟡 In progress · ✅ Done · 🚫 Human-only · 🔲 Loop draft (see MANIFEST)

---

## Track OPS — Monitor (Cursor Automations L01–L10)

| Id | Loop | Phase | Status | Cursor |
|----|------|-------|--------|--------|
| L01 | Daily platform health | R1–R2 | 🔲 draft | Cron weekdays 07:00 · repo `orion-prime-auto` |
| L02 | Weekly hardening E2E | R1–R2 | 🔲 draft | Mon 06:00 |
| L03 | Deal Room + IC smoke | R2 | 🔲 draft | Daily 08:00 |
| L04 | Gate 3 ops nudge | R1 | 🔲 draft | Fri 09:00 |
| L05 | Post-deploy verify | R1–R4 | 🔲 draft | Git push Orion paths |
| L06 | Market report freshness | R2 | 🔲 draft | Wed 10:00 |
| L07 | Fund + mandate digest | R4 | 🔲 draft | Mon 17:00 |
| L08 | TLS cert watch | Infra | 🔲 draft | Sun 06:00 · needs domain |
| L09 | BullMQ / worker health | R2–R3 | 🔲 draft | Daily 07:30 |
| L10 | Qdrant + Redis backup | Infra | 🔲 draft | Sun 05:00 |

**OPS exit:** platform stays green — automations **prove**, they do not patch with stubs.

---

## Track GATE — PR review (L21)

| Id | Loop | Phase | Status |
|----|------|-------|--------|
| L21 | Scaffold gate on PR | R1–R6 | 🔲 planned |

Enforces `SCAFFOLD-REJECT.md` + verify on every Orion diff in empire-vault.

---

## Track BUILD — Checklist rows (L22, one row per run)

### R1 — First revenue (Gate 3)

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| R1-LEGAL-NDA | NDA template counsel review | 🚫 | Legal human |
| R1-LEGAL-MANDATE | Advisory mandate template | 🚫 | Legal human |
| R1-GATE3 | Production Gate 3 close (signed mandate + deposit) | 🚫 | Mom Test + human |
| R1-OSAN-PROD | Remove sandbox-only Osan path; production `book_orion_mandate_fee` only | ⬜ | L22 |
| R1-MEMO-CLIENT | Remove synthetic default memos from client paths | ⬜ | L22 |
| R1-INVESTOR-SEED | Replace hardcoded investor list with curated JSON + graph | ⬜ | L22 |

### R2 — Advisory catalog

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| R2-CIRCLE-INSIDER | Circle Insider Stripe/Osan billing (not deferred) | ⬜ | L22 |
| R2-DEAL-ROOM | Deal Room auth + IC + workspace (employ daily) | ✅ | verify:r2 |
| R2-BRIEF | Orion Brief issue #1 + subscribers | ✅ | verify:r2 |
| R2-PORTAL-SCAFFOLD | Remove scaffold portal/deal-room on VPS | ⬜ | L22 |
| R2-MARKET-AGENT | Weekly market reports in Engine/Reports/ | ⬜ | L22 |

### R3 — Operations catalog

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| R3-PORTFOLIO | Portfolio monitor + AssetHealth alerts | ⬜ | L22 · product not built |
| R3-OPS-CATALOG | Operations product SKUs + Osan paths | ⬜ | L22 |
| R3-WORKERS | R3 worker pipeline extensions | ⬜ | L22 |

### R4 — Capital

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| R4-PORTAL | Investor Portal LP auth + real fund snapshot | ✅ | verify:r4 |
| R4-MANDATE-TOOLS | Mandate + fund MCP tools | ✅ | verify:r4 |
| R4-GHOST-MCP | Ghost MCP capital routing | ⬜ | L22 |
| R4-TLS | HTTPS nginx + certbot (needs domain) | ⬜ | L22 · human DNS |

### R5 — Wealth

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| R5-WEALTH-WF | Ownership / wealth workflows | ⬜ | L22 · not built |
| R5-RESIDENCY | Residency advisory package | ⬜ | L22 |

### R6 — Fund / institutional

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| R6-FUND-I | Fund I institutional portal | ⬜ | L22 · not built |
| R6-CHIEF-AI | Chief AI MNPI boundaries | ⬜ | L22 |
| R6-ASEAN | ASEAN Network institutional tier | ⬜ | L22 |

### Infra master (checklist L2–L4)

| Row id | Item | Status | Automation |
|--------|------|--------|------------|
| INFRA-TLS | Public URLs not 127.0.0.1 only | ⬜ | L22 + L08 |
| INFRA-DEPLOY | One-command deploy + verify runbook | ⬜ | L22 |
| INFRA-MCP-OSAN-PROD | mcp-osan production Orion revenue | ⬜ | L22 |
| INFRA-GHOST | Ghost MCP (R4) | ⬜ | L22 |

---

## Track FUTURE OPS (R5–R6, create when product exists)

| Id | Loop | Phase | Status |
|----|------|-------|--------|
| L16 | Quarterly hold/exit report | R5 | planned |
| L17 | Wealth workflow job health | R5 | planned |
| L18 | Fund capital call reconcile | R6 | planned |
| L19 | Chief AI MNPI red-team | R6 | planned |
| L20 | L10 governance checklist runner | R6 | planned |

See `phases/R5-R6-fund.md`.

---

## Human-only (never automate)

- Mom Test live sales calls  
- Production Gate 3 signature + deposit  
- Legal counsel review  
- LP token issuance to real clients (L07 digest only)  
- Full deploy on every cron (use L05 on intentional pushes)

---

## Coverage honesty

| Covered in this repo | Not fully specced yet |
|----------------------|------------------------|
| L01–L10 OPS loop specs + runbooks | Per-row `tasks/` files like origine-auto (optional next) |
| L21–L22 gate + build model | Every checklist checkbox as atomic task file |
| TASK-QUEUE backlog by release | R5–R6 ops loops L16–L20 |

**End-to-end Orion Prime** = all BUILD rows ✅ + OPS loops live + human Gate 3 closed. Automations **monitor** (OPS) and **close one row** (L22) — they do not replace sales or legal.
