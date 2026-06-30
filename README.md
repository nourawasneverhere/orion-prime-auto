# Orion Prime Auto — Cursor Automation Catalog

> **GitHub:** https://github.com/nourawasneverhere/orion-prime-auto  
> **VPS catalog path:** `/root/orionprime/auto`  
> **Local mirror:** `Empire/Orion-Prime/Auto/`  
> **Grade:** Palantir · Databricks · C3.ai · Snowflake — **NO scaffold · NO stub · employ or sell only**

---

## Quick start

1. **Cursor → Automations → New**
2. **Git repo:** `nourawasneverhere/orion-prime-auto` (OPS) or `empire-vault` (BUILD/GATE)
3. **Instructions:** paste `prompts/MANDATORY-BRIEF.txt` + loop `PROMPT.md` or use `automations/AUTO-*.json`
4. **Secrets:** see `secrets.env.example`
5. **Start:** AUTO-01 (OPS-01 daily health)

Full guide: **CURSOR-SETUP.md** · Task index: **AUTOMATION-TASKS.md** · Status: **TASK-QUEUE.md**

---

## Two-repo model

| Repo | Role |
|------|------|
| **orion-prime-auto** | Loops, runbooks, prompts, task queue |
| **empire-vault** | orion-platform, mcp-vault, vault checklist |

---

## VPS bootstrap (once per server)

```bash
bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
```

---

## Key files

| File | Purpose |
|------|---------|
| **AUTOMATION-TASKS.md** | Every task automation can run (executable only) |
| **TASK-QUEUE.md** | Status tracker (⬜/✅) |
| **MANIFEST.md** | AUTO-01…12 + L01…L22 |
| **CORE-BRIEF.md** | Enterprise quality bar |
| **GOVERNANCE.md** | Agent + operator rules |
| **automations/** | Cursor prefill JSON |
| **runbooks/** | VPS shell proofs |

Product checklist (human + full R1–R6): empire-vault → `Orion-Complete-Products-Services-Tech-Checklist.md`
