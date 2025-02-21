# Homelab Documentation

## First Time Setup

### 1. Ansible

#### 1.1 Build Inventory

#### 1.2 Setup Ansible User

#### 1.3 Execute Roles

#### 1.4 Join Worker

1. Ensure ansible scripts are ran
2. Get the join token from the master: `kubeadm token create --print-join-command`
3. Run the following: `kubeadm join 192.168.69.100:6443 --token some.token1234 --discovery-token-ca-cert-hash sha256:somelonghash --cri-socket unix:///var/run/crio/crio.sock`
   1. If it fails with an error, run the following

        ```sh
        modprobe br_netfilter
        echo '1' > /proc/sys/net/ipv4/ip_forward
        ```

   2. Rerun the join command
4. Label the worker: `kubectl label node <WORKER-NAME> node-role.kubernetes.io/worker=worker`

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
