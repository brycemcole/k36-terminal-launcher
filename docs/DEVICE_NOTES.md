# Device Notes

## K36 / ArkOS

The launcher expects the ArkOS-style layout:

- `/roms/gba`
- `/roms/nds`
- `/roms/pico-8/carts`
- `/roms/ports`
- `/usr/local/bin/perfmax`
- `/usr/local/bin/perfnorm`
- `/usr/local/bin/drastic.sh`
- `/usr/local/bin/pico8.sh`
- `/usr/local/bin/AltSDL.sh`

It replaces the systemd `emulationstation.service` command with `/usr/local/bin/k36-terminal-launcher`.

## Input

The launcher reads `/dev/input/event*` directly and currently handles common D-pad/button event codes seen on RK3326 ArkOS handhelds:

- Up: `103`, `544`, or absolute hat `17 = -1`
- Down: `108`, `545`, or absolute hat `17 = 1`
- Launch: `304`, `305`
- Back/cancel: `1`, `14`
- Home combo: `314` plus `315`

If your device boots but controls do not move the menu, open an issue with your device model and `evtest` output.

## Safety

The installer backs up the active EmulationStation service before replacing it. It does not remove ROMs, BIOS files, saves, themes, or existing emulator configs.
