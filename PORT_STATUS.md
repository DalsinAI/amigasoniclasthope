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

## Standalone RC2 (6 November 2026): SHA-256 check in the Installer

- [x] Tools/SHA256 (port/sha256, built by scripts/build-sha256.sh with os32-gcc16-open6; 6612 bytes, same bytes on every build) in the drawer, Licences/SHA256.txt beside the other licences
- [x] Lab t4-opensurge: Tools/SHA256 gives OK/0 for the right hash, FAILED/10 for a wrong one, 20 for a missing file; inside an Installer script `(run ... (safe))` returns those codes
- [x] All three downloads (AS2R zip, Aishi & Reimu zip, Sonic The Last Hope.rar) check OK on the Amiga, 18-25 s each in the lab
- [x] Installer texts kept under 512 characters per literal: Installer 47.19 refused Install-SonicTLH's longer first message ("Symbol or String too long")
- [x] Install-SonicTLH run by hand from its icon (every requester clicked): RAR intro message, folder SYS:Games/Downloads/Sonic The Last Hope, "Check the archive", Sonic The Last Hope.rar chosen in the file requester, "The SHA-256 of ... matches", game copied to Work:Games/SonicTLH/Game, MenuButtonList patched to "private", "awake", "entity", surge.cfg added, "Sonic The Last Hope standalone-rc2 is installed"
- The unpacked folder itself is checked by three file sizes only; the RAR archive is checked by SHA-256 when the player still has it, and the Installer says so
