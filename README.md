# K36 Terminal Launcher

A minimal terminal-style game launcher for ArkOS-based K36/R36-class handhelds.

This is not a new OS image. It is a small replacement for the default EmulationStation boot target. It keeps ArkOS, RetroArch, Drastic, PortMaster, PICO-8/Fake-08, and the normal ROM folders in place, but starts a plain text game list instead of the stock EmulationStation UI.

## What It Does

- Starts a terminal game selector on `/dev/tty1`.
- Scans installed games from `/roms/gba`, `/roms/nds`, `/roms/pico-8/carts`, and `/roms/ports`.
- Launches games through the existing ArkOS wrappers.
- Keeps stock EmulationStation available from the menu.
- Supports D-pad scrolling, held-button repeat, and A-button launch.
- Watches for Select+Start while a game is running and returns to the terminal menu.
- Avoids constant full-screen redraws to reduce terminal flicker.
- Repaints briefly after boot so late verbose boot output does not cover the menu.

## Status

Early field build. It has been tested on a K36/RG351P-style ArkOS image with:

- GBA through RetroArch
- NDS through Drastic
- PICO-8 carts through Fake-08
- PortMaster shell ports

Different K36 clone images may use different input event codes or service layout. Contributions and device reports are welcome.

## Install

Copy this repo to the handheld or run from a shell on the device:

```bash
sudo ./install.sh
sudo reboot
```

The installer backs up the current EmulationStation service before replacing it.

## Roll Back

```bash
sudo ./uninstall.sh
sudo reboot
```

You can also choose `Stock EmulationStation` from the terminal launcher menu without uninstalling.

## Development

Quick local syntax check:

```bash
python3 -m py_compile bin/k36-terminal-launcher
```

Run against a mounted ROM folder for menu scan testing:

```bash
K36_ROMS_ROOT=/Volumes/EASYROMS python3 bin/k36-terminal-launcher --list
```

## Scope

This project intentionally stays small:

- No firmware image distribution.
- No ROMs, BIOS files, or game data.
- No replacement emulator stack.
- No destructive cleanup of user data.

The goal is to make a simple, hackable terminal launcher that can sit on top of existing ArkOS/K36 installs.
