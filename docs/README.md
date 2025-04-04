# Homelab Documentation

## First Time Setup

### 1. Talos

Follow the talos guide [here](../talos/README.md).

### 2. Bootstrap

#### 2.1 Install Cilium

```sh
cd kubernetes/bootstrap
kubectl kustomize calico --enable-helm | kubectl apply -f -
```

#### 2.2 Install ArgoCD

#### 2.3 Install Vault

1. Apply the `app.yam` in `kubernetes/infrastructure/vault`
2. Initialize Vault
   1. Port-forward for now until we get ingress installed
3. Configure the secret engines
4. Configure the access policies
5. Create a secret for external-secrets to utilize

#### 2.4 Install External-Secrets

#### 2.5 Install Cert-Manager

#### 2.6 Install MetalLB

#### 2.7 Install Ingress NGINX

### 3. Deploy Application Sets
