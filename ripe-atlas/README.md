# RIPE Atlas Probe

Run a [RIPE Atlas](https://atlas.ripe.net/) software probe directly inside Home Assistant, contributing Internet measurements to the global RIPE Atlas network.

Container image build and publishing are maintained in a separate repository:
<https://github.com/JosephBlock/HA-Atlas>

## Installation

1. Add the repository URL `https://github.com/JosephBlock/HA-Apps` to Home Assistant.
2. Search for **RIPE Atlas Probe** in the app/add-on store.
3. Install and start the app.

## Quick Start

1. Start the app — it generates an SSH key pair on first boot.
2. Open the app **Log** tab and copy the public key printed between the `====` lines.
3. Paste it at <https://atlas.ripe.net/apply/swprobe/> to register your probe.

## Requirements

| Requirement | Details |
|-------------|---------|
| Home Assistant | Supervisor / OS (not Home Assistant Container) |
| Architecture | `amd64`, `aarch64`, `armhf`, `armv7` |
| Network | Outbound TCP 443 and 22 must be open |
| RIPE Atlas account | Free — <https://atlas.ripe.net/> |

## Credits

- Upstream probe Docker image: [jamesits/docker-ripe-atlas](https://github.com/jamesits/docker-ripe-atlas)
- RIPE Atlas software probe: [RIPE NCC](https://atlas.ripe.net/)
