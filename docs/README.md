# Homelab Documentation

## First Time Setup

### 1. Talos

Follow the talos guide [here](../talos/README.md).

### 2. Bootstrap

#### 2.1 Install Calico

```sh
kubectl kustomize calico --enable-helm | kubectl create -f -
```

_Note: it is important to utilize `create`_

#### 2.2 Install Longhorn

#### 2.3 Install MetalLB

#### 2.4 Install Ingress NGINX

#### 2.5 Install Vault

1. Run the install
2. Configure the seal keys
3. Configure the secret engines
4. Configure the access policies
5. Create a secret for external-secrets to utilize

#### 2.6 Install External-Secrets

#### 2.7 Install ArgoCD

### 3. Deploy Application Sets
