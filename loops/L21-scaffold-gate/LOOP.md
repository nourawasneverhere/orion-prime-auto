# L21 — Scaffold gate (PR)

**Phase:** R1–R6 · **Trigger:** Git pull request touching `orion-platform/`, `mcp-vault/`, `venture-mcp/orion/`, or `Empire Orion Prime Auto/`

## Outcome

No Palantir-grade regression: diff passes SCAFFOLD-REJECT + verify on VPS.

## Steps

1. Load CORE-BRIEF.md and SCAFFOLD-REJECT.md.
2. Review PR diff for forbidden patterns.
3. Run verify-only on VPS if deploy-relevant.
4. PASS → approve comment. FAIL → request changes with `BLOCKED: scaffold risk`.

## Exit criteria

- Zero scaffold signals in diff (see SCAFFOLD-REJECT.md)
- All applicable verify scripts pass

## Forbidden outcome

Merging with “good enough for now” or partial stubs.
