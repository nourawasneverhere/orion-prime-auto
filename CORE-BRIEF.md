# Orion Prime — Cursor Automation Core Brief

> **Mandatory.** Paste this (or `@` link) at the **top of every Cursor Automation** for Orion Prime — ops loops and build loops alike.

---

## Non-negotiable quality bar

All **products**, **tech**, and **code** you produce or modify for Orion Prime must be **enterprise-grade**:

**Palantir · Databricks · C3.ai · Snowflake class**

That means:

| Dimension | Required |
|-----------|----------|
| **Employ** | Operators run it daily without manual workarounds or “fix it in prod” |
| **Use** | Real inputs → real outputs (memos, fees, portal views, graph writes) from **production data paths** |
| **Sell** | Client could pay for it: contract path + deliverable + Osan revenue where applicable |
| **Verify** | Automated verify script or loop exit proves behavior — not a human demo |

---

## Forbidden — never ship

| Pattern | Examples |
|---------|----------|
| **Scaffold** | “TODO”, placeholder UI, roadmap JSON as runtime, demo HTML |
| **Stub** | `fundModuleAccounting()` hardcoded stats, random IR scores, keyword-only Chief router |
| **Synthetic client path** | Default memos, sandbox-only revenue as production, seed deals sold as mandates |
| **Localhost product** | `127.0.0.1`-only interfaces without auth/nginx path for partners/LPs |
| **Docs-only SKU** | Markdown describing a feature that has no running service |
| **Substitute stack** | n8n, Sheets, Airtable, ChatGPT-as-runtime for Orion core |

If you cannot meet the bar **in this run**, **stop** and report **BLOCKED: scaffold risk** with what is missing — do not commit partial work labeled “done”.

---

## Enterprise-grade checklist (before you mark PASS)

Every **build** or **fix** must satisfy **all** that apply:

1. **Auth** — Partner/LP/MNPI boundaries enforced (token, RBAC, no double response bugs)
2. **Data** — AGE/Postgres/Qdrant as source of truth; normalize graph shapes (`properties` vs flat)
3. **Governance** — `empire_audit_log` on writes; `partner_approved` on IC-gated transitions
4. **Revenue** — Osan **production** path (`book_orion_mandate_fee`, not sandbox-only)
5. **Observability** — `/health`, verify script, or loop exit criteria updated
6. **Deploy** — Change rsyncs to VPS; `verify:r1` / `r2` / `r4` / `hardening:e2e` pass
7. **No regression** — IC queue, Deal Room, Portal, Circle still green after change

---

## What Cursor Automations do (two modes)

### Mode A — Ops loops (L01–L10)

**Monitor and prove** the platform stays enterprise-grade.  
They **do not** lower the bar. On FAIL they **escalate**, they do not patch with stubs.

### Mode B — Build loops (L21+, git-triggered agents)

**Implement** missing R1–R6 rows from:

`Atlas/Ventures/Orion-Prime/Operations/Engine/Build/Orion-Complete-Products-Services-Tech-Checklist.md`

Each build loop must end with:

- Code merged path documented  
- Verify script extended or passing  
- MANIFEST row updated  
- **No** “scaffold acceptable for now” language  

---

## Reference architecture (Orion = mini enterprise data platform)

| Enterprise pattern | Orion equivalent |
|--------------------|------------------|
| Palantir ontology + actions | AGE graph + mcp-orion tools + IC gates |
| Databricks jobs + monitoring | BullMQ workers + L01/L09 loops |
| Snowflake governed warehouse | Postgres warm tier + audit log |
| C3.ai production apps | Deal Room, Portal, Circle (auth + real APIs) |
| ML/feature store | Qdrant deal memory + comp vectors |

---

## Sandbox vs production

| Label | Allowed in automation output? |
|-------|-------------------------------|
| **Sandbox Gate 3 evidence** | Yes, if file header says NOT REAL CONTRACT / sandbox |
| **Sandbox as production revenue** | **Never** |
| **Seed pipeline data** | Employ/internal OK; **never** labeled sell-complete |

---

## Escalation text (use verbatim on block)

```
BLOCKED: scaffold risk — Orion Prime requires Palantir/Databricks/C3/Snowflake-grade complete product.
Missing: [list]. No stub shipped. Human decision required.
```

---

## Related vault docs

- `Operations/Engine/Build/Orion-Complete-Products-Services-Tech-Checklist.md`
- `Operations/Launch/Readiness-Truth.md`
- `Canon/Strategy/Gate-3-Market-Truth.md`
- `Empire Orion Prime Auto/MANIFEST.md`
