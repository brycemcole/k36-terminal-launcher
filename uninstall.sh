#!/usr/bin/env bash
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Run with sudo: sudo ./uninstall.sh"
  exit 1
fi

backup="$(ls -1t /etc/systemd/system/emulationstation.service.before-k36-terminal-launcher-* 2>/dev/null | head -1 || true)"

if [ -z "$backup" ]; then
  echo "No installer-created EmulationStation service backup found."
  exit 1
fi

cp -a "$backup" /etc/systemd/system/emulationstation.service
systemctl daemon-reload

echo "Restored $backup."
echo "Reboot to return to the stock EmulationStation service."
