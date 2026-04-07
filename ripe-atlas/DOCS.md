# RIPE Atlas Probe — Add-on Documentation

## What is RIPE Atlas?

[RIPE Atlas](https://atlas.ripe.net/) is a global network of hardware and software probes that continuously measure Internet connectivity and reachability. By running a software probe, you contribute measurements to the community and earn credits to run your own custom measurements.

## Prerequisites

No pre-registration is needed before installing. The probe generates its own SSH key pair on first boot.

## Installation

1. In Home Assistant, go to **Settings → Add-ons → Add-on Store**.
2. Click the three-dot menu (⋮) in the top-right corner and choose **Repositories**.
3. Add the URL of this repository and click **Add**.
4. Find **RIPE Atlas Probe** in the store and click **Install**.
5. Start the add-on.

## Registering the Probe

On first boot the probe generates an SSH key pair. The public key is printed to the add-on log:

1. Go to **Settings → Add-ons → RIPE Atlas Probe → Log**.
2. Look for the block between the `====` lines — it contains your public key.
3. Copy the public key and paste it at <https://atlas.ripe.net/apply/swprobe/> to register.

The public key is printed every time the add-on starts, so you can always retrieve it from the log.

## Configuration

No configuration options are required. The add-on is ready to start with default settings.

## Network Requirements

This add-on runs with `host_network: true` and `privileged: true` so the probe can:

- Open raw sockets needed for ICMP/traceroute measurements.
- Establish a persistent TLS connection to the RIPE Atlas infrastructure.

Make sure your firewall allows outbound TCP connections on port **443**.

## Logs

View real-time probe logs via **Settings → Add-ons → RIPE Atlas Probe → Log**.

## Support

- RIPE Atlas documentation: <https://atlas.ripe.net/docs/software-probe/>
- Upstream Docker image: <https://github.com/jamesits/docker-ripe-atlas>
