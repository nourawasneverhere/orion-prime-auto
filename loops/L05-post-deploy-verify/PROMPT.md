Run Orion loop **L05 — Post-deploy verify**.

If this trigger is a git push, confirm changed files include orion-platform or mcp-vault.

SSH VPS and run:
  bash /root/Empire/Atlas/Ventures/Orion-Prime/Empire\ Orion\ Prime\ Auto/runbooks/verify-only.sh

Report PASS/FAIL per verify script. Do not run full deploy unless human approves.

@Atlas/Ventures/Orion-Prime/Empire Orion Prime Auto/loops/L05-post-deploy-verify/LOOP.md
