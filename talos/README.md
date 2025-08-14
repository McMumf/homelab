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
7. Deploy the k8s bootstrap services: [kubernetes/bootstrap/README](../kubernetes/bootstrap/README.md)

### Schematic

ID: `72b8d480a52e4864ddf7915064656d75b44474fcc48edbe9bdbbbc6223543695`

```yaml
customization:
    systemExtensions:
        officialExtensions:
            - siderolabs/glibc
            - siderolabs/i915
            - siderolabs/intel-ucode
            - siderolabs/iscsi-tools
            - siderolabs/nut-client
            - siderolabs/util-linux-tools
```

## Updating w/ Secure Boot

1. Run the install command. Example:

  ```shell
  $ talosctl upgrade --nodes <node ip> --image factory.talos.dev/metal-installer-secureboot/72b8d480a52e4864ddf7915064656d75b44474fcc48edbe9bdbbbc6223543695"<new_version>
  ```
2. Make sure it boots with new EFI image
  - May need to enroll the EFI image from disk in bios

## Updating Kubernetes

1. Dry Run the upgrade

  ```shell
  $ talosctl --nodes <controlplane node> upgrade-k8s --to 1.33.3 --dry-run
  ```

- Checks what will be upgraded
- Will pull the required images

2. Do the upgrade

  ```shell
  $ talosctl --nodes <controlplane node> upgrade-k8s --to 1.33.3
  talosctl --nodes 192.168.5.100 upgrade-k8s --to 1.33.3 --dry-run
  automatically detected the lowest Kubernetes version 1.33.0
  discovered controlplane nodes ["cp-1" "cp-2" "c-3"]
  discovered worker nodes ["worker-1" "worker-2", "worker-3"]
  ...

  ```
