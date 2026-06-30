# L10 — Qdrant + Redis backup check

**Phase:** Infra · **Trigger:** Cron `0 5 * * 0`

## Outcome

Docker containers for Qdrant/Redis up; disk space OK on VPS.

## Steps

1. `docker ps` includes qdrant + redis for orion-platform compose
2. `df -h /` — warn if >85% used
3. Document backup gap if no snapshot policy (informational)

## Exit criteria

Containers running; disk <85%
