# Cursor Automations — Orion Prime

**Catalog:** https://github.com/nourawasneverhere/orion-prime-auto  
**VPS path:** `/root/orionprime/auto`  
**Product:** https://github.com/nourawasneverhere/empire-vault

---

## Instructions (every automation)

1. Paste **`prompts/MANDATORY-BRIEF.txt`**
2. Paste loop **`PROMPT.md`** or use **`automations/AUTO-*.json`**

---

## Git repo per automation

| AUTO | Name | Git repo | Cron / trigger |
|------|------|----------|----------------|
| AUTO-01 | Daily health + graph verify | orion-prime-auto | `0 7 * * 1-5` |
| AUTO-02 | Hardening E2E | orion-prime-auto | `0 6 * * 1` |
| AUTO-03 | IC / AGE smoke | orion-prime-auto | `0 8 * * *` |
| AUTO-04 | Gate 3 nudge | orion-prime-auto | `0 9 * * 5` |
| AUTO-05 | Post-deploy verify | orion-prime-auto | git push Orion |
| AUTO-06 | Market report | orion-prime-auto | `0 10 * * 3` |
| AUTO-07 | Fund digest | orion-prime-auto | `0 17 * * 1` |
| AUTO-08 | TLS watch | orion-prime-auto | `0 6 * * 0` |
| AUTO-09 | Worker health | orion-prime-auto | `30 7 * * *` |
| AUTO-10 | Infra backup | orion-prime-auto | `0 5 * * 0` |
| AUTO-11 | Scaffold PR gate | empire-vault | PR Orion paths |
| AUTO-12 | BUILD one row | empire-vault | `0 9 * * 1-5` |

---

## Secrets

```
ORION_VPS_HOST=5.223.47.73
ORION_VPS_USER=root
ORION_SSH_PRIVATE_KEY=<PEM>
ORION_PARTNER_TOKEN=<L03 smoke>
ORION_LP_TOKEN=<optional>
ORION_PUBLIC_DOMAIN=<when TLS live>
```

---

## VPS bootstrap

```bash
ssh root@5.223.47.73 'bash -s' < runbooks/ensure-catalog-on-vps.sh
# or on VPS after first clone:
bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
```

All OPS runbooks:

```bash
cd /root/orionprime/auto && bash runbooks/daily-health.sh
```

---

## OPS vs BUILD

| OPS (AUTO-01…10) | BUILD (AUTO-12) |
|------------------|-----------------|
| SSH + runbook | Edit empire-vault |
| PASS/FAIL report | verify on VPS + PR |
| No stub patches | One BUILD-* row |

See **AUTOMATION-TASKS.md** for full task list and graph coverage (GRAPH-01…03).
