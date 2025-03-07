#!/bin/bash
talosctl gen config --force \
    --talos-version 1.9.4 \
    --kubernetes-version 1.32.0 \
    mcmumf https://192.168.69.100:6443 \
    --output-dir _out

# cp1 (control-plane)
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @nodes/cp1.yaml \
    --output _out/cp1.yaml

# cp2 (control-plane)
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @nodes/cp2.yaml \
    --output _out/cp2.yaml

# cp3 (control-plane)
talosctl machineconfig patch controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @nodes/cp3.yaml \
    --output _out/cp3.yaml

# w1 (worker and storage)
talosctl machineconfig patch worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @nodes/w1.yaml \
    --output _out/w1.yaml

# w2 (worker and storage)
talosctl machineconfig patch worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @nodes/w2.yaml \
    --output _out/w2.yaml

# w3 (worker and storage)
talosctl machineconfig patch worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @nodes/w3.yaml \
    --output _out/w4.yaml
