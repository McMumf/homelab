# Talos

## Overview

### Setup

1. Generate configs: `build-configs.sh`
2. Apply configs: `apply-configs.sh`
3. Bootstrap: `alosctl bootstrap --nodes 192.168.69.102 --endpoints 192.168.69.102  --talosconfig=talosconfig`

### Schematic

ID: `1ebd35242dcf45bc9eeddccf6f06a4d4187a824719bb84443092d59fe34cb3d0`

```yaml
customization:
    systemExtensions:
        officialExtensions:
            - siderolabs/cloudflared
            - siderolabs/crun
            - siderolabs/glibc
            - siderolabs/i915
            - siderolabs/intel-ucode
            - siderolabs/iscsi-tools
            - siderolabs/nut-client
            - siderolabs/qemu-guest-agent
            - siderolabs/realtek-firmware
```
