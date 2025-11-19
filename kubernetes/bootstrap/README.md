# Bootstrap

Important items to get the cluster goin'.

## Overview

Cilium is used to replace the Kube Proxy as well as provide a CNI.

ArgoCD is needed to deploy the application sets.

[Sync-waves](https://argo-cd.readthedocs.io/en/stable/user-guide/sync-waves/) are used to reduce thrashing of services as app sets are applied.

## Setup

1. Install Gateway API
    ```sh
    $ cd kubernetes/bootstrap
    $ kubectl apply -k gateway-api
    ...
    ```
2. Install cilium
    ```sh
    $ cd kubernetes/bootstrap
    $ kubectl kustomize cilium --enable-helm | kubectl apply -f -
    ...
    ```
3. Install ArgoCD
    ```sh
    $ kubectl kustomize argocd --enable-helm | kubectl apply -f -
    ...
    ```
4. Apply your App Set(s)
5. Prosper
