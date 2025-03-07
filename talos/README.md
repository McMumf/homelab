# Talos

## Overview

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
    talosctl --talosconfig $TALOSCONFIG config endpoint <control plane 1 IP>
    talosctl --talosconfig $TALOSCONFIG config node <control plane 1 IP>
    talosctl --talosconfig $TALOSCONFIG bootstrap
    ```
5. Retrieve kubeconfig: `talosctl --talosconfig $TALOSCONFIG kubeconfig .`

### Schematic

ID: `4fa1e2bb9d7fa57fe0ad9513a765322ea3064e9bfede11c3c9a18777f847bffd`

```yaml
customization:
  systemExtensions:
    officialExtensions:
      - siderolabs/cloudflared
      - siderolabs/glibc
      - siderolabs/i915
      - siderolabs/iscsi-tools
      - siderolabs/nut-client
      - siderolabs/realtek-firmware
```
