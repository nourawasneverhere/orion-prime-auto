#!/usr/bin/env bash
# Ensure automation catalog exists at /root/orionprime/auto on VPS
set -euo pipefail
ORION_AUTO="${ORION_AUTO:-/root/orionprime/auto}"
REPO="${ORION_AUTO_REPO:-https://github.com/nourawasneverhere/orion-prime-auto.git}"

if [[ -d "$ORION_AUTO/.git" ]]; then
  git -C "$ORION_AUTO" fetch origin main --quiet
  git -C "$ORION_AUTO" reset --hard origin/main --quiet
  echo "OK catalog-sync $ORION_AUTO"
else
  mkdir -p "$(dirname "$ORION_AUTO")"
  git clone --depth 1 "$REPO" "$ORION_AUTO"
  echo "OK catalog-clone $ORION_AUTO"
fi
