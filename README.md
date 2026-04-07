# HA-Atlas

Home Assistant add-on packaging for a RIPE Atlas software probe.

This repository contains the add-on definition and runtime files for the
`RIPE Atlas Probe` Home Assistant add-on.

## Repository Layout

- `ripe-atlas/` - Add-on source files
  - `config.yaml` - Home Assistant add-on metadata
  - `Dockerfile` - Container build definition
  - `run.sh` - Add-on startup script
  - `README.md` - End-user add-on documentation
  - `DOCS.md` - Detailed add-on docs

## What This Add-on Does

The add-on runs a RIPE Atlas software probe so your Home Assistant host can
contribute Internet reachability and performance measurements to the RIPE Atlas
network.

## Installation (Home Assistant)

1. Open Home Assistant and go to the add-on store.
2. Add your custom repository URL in the repository settings.
3. Install `RIPE Atlas Probe`.
4. Start the add-on and open logs to copy the generated public key.
5. Register the key at <https://atlas.ripe.net/apply/swprobe/>.

For full usage details, see `ripe-atlas/README.md` and `ripe-atlas/DOCS.md`.

## Upstream and References

- RIPE Atlas: <https://atlas.ripe.net/>
- Software probe docs: <https://atlas.ripe.net/docs/software-probe/>
- Upstream container project: <https://github.com/jamesits/docker-ripe-atlas>