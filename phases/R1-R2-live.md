# Phase map — R1 + R2 (live now)

Enable in Cursor Automations:

| Loop | Why |
|------|-----|
| L01 | Daily health + verify |
| L02 | Weekly hardening |
| L03 | Deal Room / IC regression |
| L04 | Gate 3 human nudge |
| L05 | Verify after Orion git push |
| L06 | Market report staleness |
| L09 | Workers + Redis |
| L10 | Qdrant/Redis/docker |

**Exit when:** `verify:r1` + `verify:r2` + `hardening:e2e` green 30 consecutive days AND production Gate 3 closed.
