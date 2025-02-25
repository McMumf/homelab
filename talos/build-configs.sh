#!/bin/bash
talosctl gen config --force \
    --talos-version 1.9.0\
    --kubernetes-version 1.32.0 \
    --with-secrets secrets.yaml \
    juicecloud https://k8s.mcmumf.dev:6443 

# hl1
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @nodes/hl1.yaml \
    --output outputs/hl1.yaml

# hl2
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @nodes/hl2.yaml \
    --output outputs/hl2.yaml

# hl3
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @nodes/hl3.yaml \
    --output outputs/hl3.yaml