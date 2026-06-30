# L09 — BullMQ / worker health

**Phase:** R2–R3 · **Trigger:** Cron `30 7 * * *`

## Outcome

Redis reachable; empire-orion-platform workers running; no repeated crash loops.

## Steps

1. `redis-cli -p 6380 ping` → PONG
2. `systemctl is-active empire-orion-platform`
3. `journalctl -u empire-orion-platform --since "24 hours ago" | grep -c "exited"` → should be 0 or low

## Exit criteria

Redis PONG + service active + exit count ≤ 2 in 24h
