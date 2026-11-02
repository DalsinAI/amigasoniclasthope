# Sonic The Last Hope for AmigaOS 3

Reproducible content-port tooling for running **Sonic The Last Hope** with the
shared [Amiga OpenSurge](https://github.com/DalsinAI/amigaopensurge) engine.

## Upstream

- Showcase: <https://sonicfangameshq.com/forums/showcase/sonic-the-last-hope.1543/>
- Expected archive SHA-256: `eb0daac18a3762218dedad340528fb2ac7cf70548de1ac109bd78dda2d3bd391`
- Expected extracted directory: `Sonic The Last Hope`
- Original engine: OpenSurge 0.6.0 / Allegro 5.2.7-1

The package contains complete OpenSurge GPLv3 engine source. Its showcase does
not state a clear redistribution licence for every bundled game asset, so this
repository contains only the reproducible local port recipe and metadata.

## Prepare a local port

```sh
./scripts/prepare-amiga-port.sh \
  "/path/to/Sonic The Last Hope" \
  /path/to/amigaopensurge/dist/opensurge \
  ./dist/SonicTLH
```

See [PORT_STATUS.md](PORT_STATUS.md) for validation results.

