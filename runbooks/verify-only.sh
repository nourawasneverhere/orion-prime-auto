#!/usr/bin/env bash
# L05 — verify only, no deploy
set -euo pipefail
PLATFORM="${ORION_PLATFORM:-/root/orion-platform}"
cd "$PLATFORM"
node src/scripts/verify-r1.mjs
node src/scripts/verify-r2.mjs
node src/scripts/verify-r4.mjs
echo "OK verify-only"
