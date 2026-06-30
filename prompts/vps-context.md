# VPS context — Orion Prime Automations

| Key | Default |
|-----|---------|
| **Catalog on VPS** | `/root/orionprime/auto` |
| **Product platform** | `/root/orion-platform` |
| **Empire vault on VPS** | `/root/Empire` |
| **Host** | `5.223.47.73` |
| **mcp-orion** | `http://127.0.0.1:3004` |
| **Investor Portal** | `http://127.0.0.1:3005` |
| **Deal Room** | `http://127.0.0.1:3006` |
| **Circle** | `http://127.0.0.1:3007` |
| **Redis** | `127.0.0.1:6380` |
| **Qdrant** | `http://127.0.0.1:6335` |

Bootstrap catalog:

```bash
bash /root/orionprime/auto/runbooks/ensure-catalog-on-vps.sh
```

Loop ids L01–L10: MANIFEST.md · Executable tasks: AUTOMATION-TASKS.md
