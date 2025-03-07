# Bootstrap

Important items to get the cluster goin'.

## Overview

ArgoCD is needed to deploy the application sets. 

[Sync-waves](https://argo-cd.readthedocs.io/en/stable/user-guide/sync-waves/) are used to reduce thrashing of services as app sets are applied.

## Setup

1. Install ArgoCD
    ```sh
    $ cd kubernetes/bootstrap
    $ kubectl kustomization argocd --enable-helm | kubectl apply -f -
    ```
2. Apply the App Set
3. Prosper
