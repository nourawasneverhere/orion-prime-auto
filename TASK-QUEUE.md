# Orion Prime — Task Queue (automation-executable)

> Canonical task definitions: **AUTOMATION-TASKS.md**  
> Full product checklist (including human rows): empire-vault → `Orion-Complete-Products-Services-Tech-Checklist.md`

**Legend:** ⬜ Open · 🟡 In progress · ✅ Done · ⏸ Blocked (secret/domain) · 🚫 Not automatable · 🚧 Product not built

**VPS catalog:** `/root/orionprime/auto`

---

## OPS — schedule in Cursor (Tier 1)

| Id | Status | AUTO | Loop |
|----|--------|------|------|
| OPS-01 Daily platform + graph verify | ⬜ | AUTO-01 | L01 |
| OPS-02 Weekly hardening E2E | ⬜ | AUTO-02 | L02 |
| OPS-03 IC queue / AGE smoke | ⬜ | AUTO-03 | L03 |
| OPS-04 Gate 3 ops nudge | ⬜ | AUTO-04 | L04 |
| OPS-05 Post-deploy verify | ⬜ | AUTO-05 | L05 |
| OPS-06 Market report freshness | ⬜ | AUTO-06 | L06 |
| OPS-07 Fund + mandate digest | ⬜ | AUTO-07 | L07 |
| OPS-08 TLS public URLs | ⏸ | AUTO-08 | L08 |
| OPS-09 Worker + Redis health | ⬜ | AUTO-09 | L09 |
| OPS-10 Qdrant + Redis infra | ⬜ | AUTO-10 | L10 |

**Graph proof:** OPS-01 (verify:r1) + OPS-03 (IC/AGE) — see AUTOMATION-TASKS.md GRAPH-01..03

---

## GATE — PR (Tier 2)

| Id | Status | AUTO |
|----|--------|------|
| GATE-21 Scaffold gate | ⬜ | AUTO-11 |

---

## BUILD — one per L22 run (Tier 3)

| Id | Status | Notes |
|----|--------|-------|
| BUILD-01 OPS regression fix | ⬜ | Only when OPS fails |
| BUILD-02 Circle Insider billing | ⬜ | R2 |
| BUILD-03 HTTPS + certbot | ⏸ | Needs `ORION_PUBLIC_DOMAIN` |
| BUILD-04 Ghost MCP routing | 🚧 | R4 not built |
| BUILD-05 Twin-spec AGE writer sync | ⬜ | Graph L2 |
| BUILD-06 Graph staleness monitor | ⬜ | Graph L2 |
| BUILD-07 mcp-osan production path | ⬜ | L1 MCP |
| BUILD-08 AssetHealth real KPI | 🚧 | R3 |
| BUILD-09 SPV/syndication workflows | 🚧 | R4 |
| BUILD-10 Fund I institutional | 🚧 | R6 |

**AUTO-12:** first ⬜ row above (skip ⏸ 🚧 unless unblocked)

---

## Human-only (never in Cursor)

Gate 3 production mandate · legal counsel · Mom Test · real LP token issuance · domain purchase

---

## After each BUILD run

1. PR **empire-vault** with verify output  
2. PR **orion-prime-auto** — update Status column here → ✅  
3. Re-run linked OPS task → PASS
