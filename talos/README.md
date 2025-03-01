# Talos

## Overview

### Setup

1. Generate configs: `build-configs.sh`
2. Apply configs: `apply-configs.sh`
3. Bootstrap: `alosctl bootstrap --nodes 192.168.69.102 --endpoints 192.168.69.102  --talosconfig=talosconfig`

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
