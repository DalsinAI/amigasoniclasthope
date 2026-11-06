/* PatchMenu.rexx FILE
   Brings an OpenSurge 0.5/0.6.0 game's scripts/ui/menubuttonlist.ss up to
   OpenSurge 0.6.1: the line
       object "MenuButtonList"
   becomes
       object "MenuButtonList" is "private", "awake", "entity"
   as scripts/prepare-amiga-port.sh does with sed. Every other line is kept
   as it is. The Installer runs it after copying the player's own files.
   MIT, Copyright (c) 2026 AmiCradle Team. */

PARSE ARG file
file = Strip(file)
IF Left(file, 1) = '"' THEN PARSE VAR file '"' file '"'
IF file = '' THEN DO
  SAY 'Usage: RX PatchMenu.rexx FILE'
  EXIT 10
END
IF ~Show('L', 'rexxsupport.library') THEN
  IF ~AddLib('rexxsupport.library', 0, -30, 0) THEN DO
    SAY 'PatchMenu: rexxsupport.library is missing'
    EXIT 20
  END
IF ~Open('in', file, 'R') THEN DO
  SAY 'PatchMenu: cannot read' file
  EXIT 10
END
new = file'.new'
IF ~Open('out', new, 'W') THEN DO
  SAY 'PatchMenu: cannot write' new
  CALL Close('in')
  EXIT 10
END
old = 'object "MenuButtonList"'
changed = 0
DO FOREVER
  line = ReadLn('in')
  IF Eof('in') THEN DO
    IF line ~= '' THEN CALL WriteCh('out', line)
    LEAVE
  END
  IF Strip(line, 'T', '0d'x) = old THEN DO
    line = old 'is "private", "awake", "entity"'
    changed = changed + 1
  END
  CALL WriteLn('out', line)
END
CALL Close('in')
CALL Close('out')
IF changed = 0 THEN DO
  CALL Delete(new)
  SAY 'PatchMenu: nothing to change in' file
  EXIT 0
END
IF ~Delete(file) THEN DO
  SAY 'PatchMenu: cannot replace' file
  EXIT 10
END
IF ~Rename(new, file) THEN DO
  SAY 'PatchMenu: cannot rename' new
  EXIT 10
END
SAY 'PatchMenu: patched' file
EXIT 0
