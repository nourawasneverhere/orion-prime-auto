#!/usr/bin/env bash
# L02 — weekly hardening e2e
set -euo pipefail
PLATFORM="${ORION_PLATFORM:-/root/orion-platform}"
cd "$PLATFORM"
node src/scripts/hardening-e2e.mjs
echo "OK hardening-e2e"
