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

_Note: you may need to edit your cloudflared extension patch directly_

1. Generate configs: `build-configs.sh`
2. Update cloudflared extension in each node's machine config
   1. Replace `${cloudflared_tunnel_token}` with the actual token
   2. So far, I haven't been able to figure out how to get it to populate from env
3. Apply configs: `apply-configs.sh`
4. Setup control-plane conversations:
    ```sh
    export TALOSCONFIG="_out/talosconfig"
    talosctl config endpoint $CONTROL_PLANE_IP
    talosctl config node $CONTROL_PLANE_IP
    ```
5. Bootstrap:
    ```sh
    talosctl bootstrap
    ```
6. Retrieve kubeconfig: `talosctl --talosconfig $TALOSCONFIG kubeconfig _out/kubeconfig`


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
