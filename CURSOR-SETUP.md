# Cursor Automations — Orion Prime Setup

Repo: **https://github.com/nourawasneverhere/orion-prime-auto**

Catalog only. Product code: **https://github.com/nourawasneverhere/empire-vault**

---

## Two-repo model

| Automation type | Git repo in Cursor | Branch |
|-----------------|-------------------|--------|
| **OPS** L01–L10 | `nourawasneverhere/orion-prime-auto` | `main` |
| **BUILD** L21–L22 | `nourawasneverhere/empire-vault` | `main` |
| **BUILD** L21 PR gate | `nourawasneverhere/empire-vault` | PR branch |

---

## Secrets (Automation → Secrets)

```
ORION_VPS_HOST=5.223.47.73
ORION_VPS_USER=root
ORION_SSH_PRIVATE_KEY=<PEM>
ORION_PARTNER_TOKEN=<smoke only>
ORION_LP_TOKEN=<smoke only>
```

Never commit real values. See `secrets.env.example`.

---

## VPS: clone this catalog once

```bash
ssh root@5.223.47.73 'test -d /root/orion-prime-auto || git clone https://github.com/nourawasneverhere/orion-prime-auto.git /root/orion-prime-auto'
```

Runbooks use `ORION_PLATFORM=/root/orion-platform` by default.

---

## Create each automation

### Instructions field (every automation)

1. Paste full `prompts/AUTOMATION-SYSTEM-PROMPT.md`
2. Paste loop block from `loops/Lxx-…/PROMPT.md`

---

### L01 — Daily platform health (start here)

**Name:** `Orion L01 Daily Platform Health`  
**Description:** `OPS — SSH VPS, run daily-health.sh. PASS/FAIL only.`  
**Git repo:** `orion-prime-auto`  
**Trigger:** Cron `0 7 * * 1-5`

Use prompt: `loops/L01-daily-platform-health/PROMPT.md`

---

### L03 — Deal Room + IC smoke

**Name:** `Orion L03 IC Queue Smoke`  
**Git repo:** `orion-prime-auto`  
**Trigger:** Cron `0 8 * * *`

Use prompt: `loops/L03-deal-room-ic-smoke/PROMPT.md`

---

### L05 — Post-deploy verify

**Name:** `Orion L05 Post-Deploy Verify`  
**Git repo:** `orion-prime-auto` (monitor) or trigger on push to empire-vault  
**Trigger:** Git push (Orion paths) or webhook

Use prompt: `loops/L05-post-deploy-verify/PROMPT.md`

---

### L21 — Scaffold gate on PR

**Name:** `Orion L21 Scaffold Gate`  
**Git repo:** `empire-vault`  
**Trigger:** PR opened/pushed touching `orion-platform/`, `mcp-vault/`, Orion paths

Use prompt: `loops/L21-scaffold-gate/PROMPT.md`

---

### L22 — Checklist row closer

**Name:** `Orion L22 Checklist Row Closer`  
**Git repo:** `empire-vault`  
**Trigger:** Manual or cron `0 9 * * 1-5`

```
L22 BUILD:
1. Read TASK-QUEUE.md — first ⬜ Open BUILD row (skip 🚫 human-only)
2. Read checklist row in empire-vault: Atlas/Ventures/Orion-Prime/Operations/Engine/Build/Orion-Complete-Products-Services-Tech-Checklist.md
3. Implement COMPLETE in empire-vault — no scaffold
4. Deploy if required; on VPS run verify:r1 / r2 / r4 / hardening:e2e as applicable — exit 0 or BLOCKED
5. PR empire-vault: ORION-BUILD: {row-id}
6. PR orion-prime-auto: TASK-QUEUE.md → ✅
7. ONE row only
```

---

## OPS vs BUILD (do not mix)

| OPS | BUILD |
|-----|-------|
| SSH + runbook on VPS | Edit code in empire-vault |
| No local Docker required | Verify on VPS after deploy |
| PASS / FAIL report | PR + checklist row closed |

---

## Full loop list

See **MANIFEST.md** and **TASK-QUEUE.md**.
