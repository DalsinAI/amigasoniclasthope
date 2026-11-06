# Port status

- [x] Upstream package acquired and checksum recorded
- [x] Complete OpenSurge game data and bundled engine source confirmed
- [x] Reproducible content-port script added
- [x] Boot tested on Cradle AmigaOS 3 target
- [x] Title screen tested
- [x] First playable level tested
- [x] Local stored-ZIP release candidate built

Compatibility target: the shared Amiga OpenSurge 0.6.1.3 RC engine. Public
binary/data releases are withheld until asset redistribution permission is
clear.

Cradle test (2026-11-02): title, Start Game and the first playable level all
render correctly. Packaging applies the current `MenuButtonList` entity tags
required by OpenSurge 0.6.1.3. The 88 MiB stored `game.zip` contains 1,261
files. Its title and actual first level were also retested in F10 fullscreen;
palette, terrain, background, water, HUD and sprites all remain present.

## Standalone RC1 (5 November 2026)

- [x] Standalone LhA with the rc3 engine inside (`scripts/package-standalone.sh`)
- [x] No game data in git or in the archive; Install-SonicTLH builds it from the player's download
- [x] Lab t4-opensurge (5 Nov): Install-SonicTLH given the folder unpacked from Sonic The Last Hope.rar: name and three file sizes checked, Game drawer built beside the engine, MenuButtonList patched, surge.cfg added
- [x] Game drawer compared with the upstream folder on the host: identical except the two changed files; src, screenshots, the Windows program and docs left out
- [x] StartGame: title, Start Game, first level playing (timer running, Sonic, HUD, terrain and background drawn)
- [x] Clean quit: in-game quit dialog, then the window's close gadget at the title; logfile ends "tchau!"

AmigaOS cannot unpack RAR, so the player unpacks it first (UnRAR from Aminet, or on another computer) and gives the Installer the folder; the game.zip route from prepare-amiga-port.sh is the other way in. The Installer ran unattended in the lab (requesters replaced by fixed answers in a lab-only copy).
