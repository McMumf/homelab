#!/bin/bash
talosctl gen config --force \
    --talos-version 1.10.6 \
    --kubernetes-version 1.33.4 \
    homelab https://192.168.5.100:6443 \
    --config-patch @patches/cni.yaml \
    --output-dir _out

# apollo (control-plane)
talosctl machineconfig patch _out/controlplane.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @patches/mayastor-patch-cp.yaml \
    --patch @patches/extensions/nut.yaml \
    --patch @patches/metrics.yaml \
    --patch @nodes/apollo.yaml \
    --output _out/apollo.yaml

# artemis (control-plane)
# talosctl machineconfig patch _out/controlplane.yaml \
#     --patch @patches/common.yaml \
#     --patch @nodes/artemis.yaml \
#     --output _out/artemis.yaml
# Temporary worker?
talosctl machineconfig patch _out/worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @patches/mayastor-patch-cp.yaml \
    --patch @patches/extensions/nut.yaml \
    --patch @nodes/artemis.yaml \
    --output _out/artemis.yaml

# skylab (control-plane)
# talosctl machineconfig patch _out/controlplane.yaml \
#     --patch @patches/common.yaml \
#     --patch @nodes/skylab.yaml \
#     --output _out/skylab.yaml
# Temporary worker?
talosctl machineconfig patch _out/worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/mayastor-patch.yaml \
    --patch @patches/mayastor-patch-cp.yaml \
    --patch @patches/extensions/nut.yaml \
    --patch @nodes/skylab.yaml \
    --output _out/skylab.yaml

# columbia (worker and storage)
talosctl machineconfig patch _out/worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/extensions/nut.yaml \
    --patch @nodes/columbia.yaml \
    --output _out/columbia.yaml

# atlantis (worker and storage)
talosctl machineconfig patch _out/worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/extensions/nut.yaml \
    --patch @nodes/atlantis.yaml \
    --output _out/atlantis.yaml

# challenger (worker and storage)
talosctl machineconfig patch _out/worker.yaml \
    --patch @patches/common.yaml \
    --patch @patches/extensions/nut.yaml \
    --patch @nodes/challenger.yaml \
    --output _out/challenger.yaml
