#!/bin/bash
talosctl gen config --force \
    --talos-version 1.9.4 \
    --kubernetes-version 1.32.0 \
    mcmumf https://192.168.69.102:6443

# # hl1
# talosctl machineconfig patch controlplane.yaml \
#     --patch @patches/common.yaml \
#     --patch @nodes/hl1.yaml \
#     --output _out/hl1.yaml

# # hl2
# talosctl machineconfig patch worker.yaml \
#     --patch @nodes/hl2.yaml \
#     --output _out/hl2.yaml

# hl3 (control plane and storage)
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @nodes/hl3.yaml \
    --output _out/hl3.yaml
