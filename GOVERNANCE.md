# Agent governance — Orion Prime Auto

## Operator rule (human + Cursor Agent)

1. **Ask before doing anything** — no commits, pushes, repo creates, deploys, or automation edits without explicit OK.
2. **Only do what was asked** — no extra files, refactors, or "while I'm here" work.
3. **Two-repo model** (same as Origine):
   - **orion-prime-auto** — this catalog (prompts, loops, runbooks)
   - **empire-vault** — product code (orion-platform, mcp-vault)
4. **Verify before "done"** — deliverable must exist (e.g. GitHub repo URL), not just a vault folder.
5. **OPS vs BUILD** — L01–L10 SSH/VPS monitor; L21+ code in empire-vault. Do not mix briefs.

## Enterprise grade only — no scaffold

**Palantir · Snowflake · Databricks · C3.ai class only.** No scaffold in governance, architecture, or deliverables.

| Forbidden | Examples |
|-----------|----------|
| Scaffold | TODO, placeholder UI, roadmap JSON as runtime, demo HTML |
| Stub | Hardcoded fund/LP stats, random scores, fake API responses |
| Docs-only | Markdown SKU with no running service |
| Substitute stack | n8n, Sheets, Airtable, ChatGPT-as-runtime for Orion core |

**Complete means:** employ · use · sell · verify (see [[CORE-BRIEF]]).

If the bar cannot be met in a run → `BLOCKED: scaffold risk`. Do not label partial work done.

When working in existing code: **remove/replace scaffold**, do not add more stub layers.

## Agent role — pre-flight (mandatory)

Before advising, building, or configuring Cursor Automations:

| # | Check |
|---|--------|
| 1 | **Precedent** — mirror origine-auto / orion-prime-auto pattern; do not invent repo layout |
| 2 | **Verify state** — repo, branch, GitHub paths, last run log |
| 3 | **OPS vs BUILD** — correct brief only (L01–L10 OPS · L21+ BUILD) |
| 4 | **Define done** — user's one-line deliverable must exist before "done" |
| 5 | **Ask first** — plan → explicit OK → act |
| 6 | **Dual report** — agent run status **and** PASS / FAIL / BLOCKED separately |

After errors: no empty "no more mistakes" — name what changed. Correct overclaims same session.

Role: Hagrid builds/verifies — see `Atlas/OS/_agents/cursor/Hagrid-Role.md` and `Agent-Session-Loop.md`.

## Read · analyze · full capabilities — complete output

Before any deliverable:

| Phase | Requirement |
|-------|-------------|
| **Read** | Role docs, precedent, actual source files — not memory alone |
| **Analyze** | Repo/GitHub state, architecture, run logs; label verified vs assumed |
| **Capabilities** | Use all applicable tools (read, grep, gh, verify, MCP, SSH when authorized) — never guess when one command confirms |
| **Output** | Full ask delivered: paste-ready, exact paths/URLs, gaps stated explicitly |

No half-deliverables. No "done" without proof. Enterprise-grade complete output only (see [[CORE-BRIEF]]).
