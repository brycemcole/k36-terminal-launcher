#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [ "$(id -u)" -ne 0 ]; then
  echo "Run with sudo: sudo ./install.sh"
  exit 1
fi

if [ ! -d /etc/systemd/system ]; then
  echo "systemd service directory not found"
  exit 1
fi

install -m 0755 "$ROOT_DIR/bin/k36-terminal-launcher" /usr/local/bin/k36-terminal-launcher

if [ -f /etc/systemd/system/emulationstation.service ]; then
  cp -a /etc/systemd/system/emulationstation.service "/etc/systemd/system/emulationstation.service.before-k36-terminal-launcher-$STAMP"
fi

install -m 0644 "$ROOT_DIR/systemd/emulationstation.service" /etc/systemd/system/emulationstation.service
systemctl daemon-reload
systemctl enable emulationstation.service >/dev/null 2>&1 || true

echo "Installed K36 Terminal Launcher."
echo "Reboot to start it."
