# Scaffold rejection — automation enforcement

When an Orion automation **reviews code** or **implements a feature**, reject and FAIL the loop if any of these appear **without** a tracked exception in CORE-BRIEF:

## Code signals (grep / review)

- `TODO` / `FIXME` / `scaffold` / `stub` / `demo only` in production paths
- `fundModuleAccounting(` with hardcoded committed amounts in user-facing APIs
- `Math.random()` for business scores (IR fit, opportunity score in production path)
- HTTP servers without auth on MNPI routes (Deal Room, Portal)
- `127.0.0.1` bind without nginx/TLS path documented for external SKUs
- `sync_osan_sandbox` as primary revenue path
- Empty catch blocks hiding vault/graph failures
- Placeholder HTML: “coming soon”, “billing opens at R2 close” **after** billing was built

## Product signals

- Feature marked ✅ in checklist but `verify:*` fails
- Seed data presented as client mandate in UI
- Circle Insider without Osan booking path
- Investor Portal without LP token verification

## Allowed

- Explicit **sandbox** fixtures under `Operations/Pilot/Sandbox/` with NOT REAL headers
- Seed graph for **internal** pipeline testing (not sold as live deals)
- `secrets.env.example` placeholders

## Enforcement loop (add as L21 when ready)

**Trigger:** Git PR opened on Orion paths  
**Action:** Agent runs this checklist + verify scripts  
**Exit:** PASS only if zero scaffold signals in diff + verify green  

See `loops/L21-scaffold-gate/` (planned).
