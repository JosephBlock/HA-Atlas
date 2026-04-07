#!/bin/bash
set -euo pipefail

PROBE_KEY_DIR=/etc/ripe-atlas
PROBE_KEY_PUB="${PROBE_KEY_DIR}/probe_key.pub"

echo "[RIPE Atlas] Starting RIPE Atlas software probe..."

# Delegate to the upstream entrypoint so it can generate keys on first boot.
# We run it in the background briefly to let key generation complete, then
# print the public key and keep the process running.

# Find the upstream start command
if [[ -x /usr/local/bin/atlas ]]; then
    ATLAS_CMD=/usr/local/bin/atlas
elif [[ -x /usr/sbin/ripe-atlas ]]; then
    ATLAS_CMD=/usr/sbin/ripe-atlas
elif [[ -x /docker-entrypoint.sh ]]; then
    ATLAS_CMD=/docker-entrypoint.sh
else
    echo "[RIPE Atlas] ERROR: Could not find the RIPE Atlas probe binary."
    exit 1
fi

# If the public key doesn't exist yet, start the probe once briefly so it
# can perform first-boot key generation, then wait for the key file.
if [[ ! -f "${PROBE_KEY_PUB}" ]]; then
    echo "[RIPE Atlas] First boot detected — generating probe key pair..."
    "${ATLAS_CMD}" &
    ATLAS_PID=$!

    # Wait up to 60 s for the public key to appear
    for i in $(seq 1 60); do
        if [[ -f "${PROBE_KEY_PUB}" ]]; then
            break
        fi
        sleep 1
    done

    if [[ ! -f "${PROBE_KEY_PUB}" ]]; then
        echo "[RIPE Atlas] WARNING: probe_key.pub not found after 60 s."
        echo "[RIPE Atlas]          The probe may still be initialising — check back in the logs."
    fi
fi

# Print the public key every boot so the user can always find it in the logs.
if [[ -f "${PROBE_KEY_PUB}" ]]; then
    echo "[RIPE Atlas] ============================================================"
    echo "[RIPE Atlas]  Probe public key (register at https://atlas.ripe.net/apply/swprobe/):"
    echo "[RIPE Atlas] ------------------------------------------------------------"
    cat "${PROBE_KEY_PUB}"
    echo "[RIPE Atlas] ============================================================"
fi

# If we already started the probe in the background, wait for it.
# Otherwise start it now in the foreground.
if [[ -n "${ATLAS_PID:-}" ]]; then
    wait "${ATLAS_PID}"
else
    exec "${ATLAS_CMD}"
fi
