Run Orion loop **L02 — Weekly hardening E2E**.

SSH to VPS, then:
  cd /root/orion-platform && node src/scripts/hardening-e2e.mjs

Report PASS/FAIL with failed check names from JSON output.
If FAIL, suggest whether issue is graph, qdrant, redis, or deal-room auth.

@Atlas/Ventures/Orion-Prime/Empire Orion Prime Auto/loops/L02-weekly-hardening/LOOP.md
