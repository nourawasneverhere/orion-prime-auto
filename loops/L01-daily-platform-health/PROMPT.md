You are running Orion loop **L01 — Daily platform health**.

**CORE-BRIEF applies:** Palantir/Databricks/C3/Snowflake grade — this loop proves the platform is still employ/sell-grade, not scaffold.

SSH to the Orion VPS using secrets ORION_VPS_HOST and ORION_SSH credentials.

On VPS:
  bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
  cd /root/orionprime/auto && bash runbooks/daily-health.sh

If the script exits 0, reply with a short PASS summary listing each service and verify script.

If exit non-zero, reply FAIL with:
- which checks failed
- last 20 lines of journalctl for empire-orion-platform
- recommended next command for a human

Do not print ORION_PARTNER_TOKEN or ORION_LP_TOKEN values.

Reference: loops/L01-daily-platform-health/LOOP.md (includes verify:r1 graph checks · GRAPH-01)
