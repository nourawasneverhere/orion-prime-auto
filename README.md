# Orion Prime Auto — Cursor Automation Catalog

> **Independent GitHub repo:** https://github.com/nourawasneverhere/orion-prime-auto  
> **Local path (vault mirror):** `Empire/Orion-Prime/Auto/`  
> **Vault copy:** `Empire/Atlas/Ventures/Orion-Prime/Empire Orion Prime Auto/`  
> **Grade:** Palantir · Databricks · C3.ai · Snowflake — **NO scaffold · NO stub · employ or sell only**

Source of truth for **Cursor Automations** on Orion Prime until R1–R6 is complete.

Governance: **GOVERNANCE.md** · **CORE-BRIEF.md** · paste **prompts/AUTOMATION-SYSTEM-PROMPT.md** at top of every automation.

---

## Quick start (Cursor Automations UI)

1. Open **Cursor → Automations → New**
2. **Git repo (this catalog):** `nourawasneverhere/orion-prime-auto` · branch `main`
3. **Git repo (code changes):** `nourawasneverhere/empire-vault` · branch `main` — BUILD loops only
4. **Instructions:** paste `prompts/AUTOMATION-SYSTEM-PROMPT.md` + loop block from `loops/Lxx-…/PROMPT.md`
5. Start with **L01** (daily health) — see **CURSOR-SETUP.md**

---

## Two-repo model

| Repo | Role |
|------|------|
| **orion-prime-auto** (this repo) | Loops, briefs, runbooks, TASK-QUEUE |
| **empire-vault** | `orion-platform`, `mcp-vault`, vault docs, checklist |

---

## What's in this repo

| Path | Purpose |
|------|---------|
| `CORE-BRIEF.md` | Mandatory enterprise quality bar |
| `GOVERNANCE.md` | Agent + operator rules |
| `MANIFEST.md` | All loops L01–L10, L21–L22 |
| `TASK-QUEUE.md` | Automation-eligible work until R1–R6 complete |
| `prompts/AUTOMATION-SYSTEM-PROMPT.md` | Paste top of every automation |
| `loops/Lxx-…/` | LOOP.md + PROMPT.md per loop |
| `runbooks/` | Shell scripts run on VPS via SSH |
| `phases/` | Which loops activate per release train |

---

## Code paths (not in this catalog)

| Path in empire-vault | Use |
|----------------------|-----|
| `Atlas/OS/Samantha/orion-platform/` | Deal Room, Portal, Circle, verify scripts |
| `Atlas/OS/Samantha/mcp-vault/` | mcp-orion tools |
| `Atlas/Ventures/Orion-Prime/Operations/Engine/Build/Orion-Complete-Products-Services-Tech-Checklist.md` | Full product/tech checklist (L22 source) |

Deploy: `Atlas/OS/Samantha/Closed-Loop/DEPLOY-ORION-PLATFORM.sh`  
VPS: `5.223.47.73` · services `:3004`–`:3007`

---

## After each builder run (L22)

1. PR to **empire-vault** with code + verify output
2. PR to **orion-prime-auto** updating `TASK-QUEUE.md` → ✅ when green
3. ONE row per run — no scaffold
