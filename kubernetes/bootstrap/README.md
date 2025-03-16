# Bootstrap

Important items to get the cluster goin'.

## Overview

Cilium is used to replace the Kube Proxy as well as provide a CNI.

ArgoCD is needed to deploy the application sets.

[Sync-waves](https://argo-cd.readthedocs.io/en/stable/user-guide/sync-waves/) are used to reduce thrashing of services as app sets are applied.

## Setup

1. Instasll cilium
    ```sh
    helm install cilium cilium/cilium --version 1.17.2 \
        --namespace kube-system \
        --set=ipam.mode=kubernetes \
        --set=kubeProxyReplacement=true \
        --set=securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
        --set=securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
        --set=cgroup.autoMount.enabled=false \
        --set=cgroup.hostRoot=/sys/fs/cgroup \
        --set=k8sServiceHost=localhost \
        --set=k8sServicePort=7445
    ```
2. Install ArgoCD
    ```sh
    $ cd kubernetes/bootstrap
    $ kubectl kustomize argocd --enable-helm | kubectl apply -f -
    ...
    ```
3. Apply your App Set(s)
4. Prosper
