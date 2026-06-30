# L05 — Post-deploy verify

**Phase:** R1–R4 · **Trigger:** Git push to `main` touching `Atlas/OS/Samantha/orion-platform/**` or `mcp-vault/**`

## Outcome

After Orion code lands, VPS verify passes without full redeploy (unless FAIL twice).

## Steps

1. Detect changed paths in push.
2. If Orion-related → SSH → `runbooks/verify-only.sh`.
3. On FAIL → comment on PR / Slack with failed verify name; do **not** auto-deploy without human approval.

## Exit criteria

- `verify:r1`, `verify:r2`, `verify:r4` all exit 0 on VPS current deploy

## Escalate

Human runs `DEPLOY-ORION-PLATFORM.sh`.
