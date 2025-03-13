# Talos

## Overview

### Nodes

#### Control Planes

_Based on NASA's Manned Missions._

- Apollo
- Artemis
- Skylab

#### Workers

_Based on NASA's shuttles._

- Colombus
- Atlantis
- Challenger

### Setup

1. Generate configs: `build-configs.sh`
2. Apply configs: `apply-configs.sh`
3. Setup control-plane conversations:
    ```sh
    export TALOSCONFIG="_out/talosconfig"
    talosctl config endpoint $CONTROL_PLANE_IP
    talosctl config node $CONTROL_PLANE_IP
    ```
4. Bootstrap:
    ```sh
    talosctl bootstrap
    ```
5. Retrieve kubeconfig: `talosctl --talosconfig $TALOSCONFIG kubeconfig _out/kubeconfig`
6. Patch extensions
    ```sh
    talosctl patch mc -p @extensions/nut.yaml
    talosctl patch mc -p @extensions/cloudflared.yaml
    ```
    _note: you may need to edit your cloudflared patch directly_

### Schematic

ID: `4a6d075edb1b336415b3d809208217dfbd390359d21787afc2f832c41ec56007`

```yaml
customization:
    systemExtensions:
        officialExtensions:
            - siderolabs/cloudflared
            - siderolabs/glibc
            - siderolabs/i915
            - siderolabs/intel-ucode
            - siderolabs/iscsi-tools
            - siderolabs/nut-client
            - siderolabs/realtek-firmware
            - siderolabs/util-linux-tools
```
