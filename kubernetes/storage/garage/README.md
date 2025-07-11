# [Garage](https://garagehq.deuxfleurs.fr)

## Installation

```sh
kubectl kustomize --enable-helm . | kubectl apply -f -
```

Verify

```sh
kubectl exec --stdin --tty -n garage garage-0 -- ./garage status
```

## Setup

### Creating a Cluster Layout

```sh
kubectl exec --stdin --tty -n garage garage-0 -- ./garage layout assign -z homelab -c 10G <node_1_id>
kubectl exec --stdin --tty -n garage garage-0 -- ./garage layout assign -z homelab -c 10G <node_2_id>
kubectl exec --stdin --tty -n garage garage-0 -- ./garage layout assign -z homelab -c 10G <node_3_id>
kubectl exec --stdin --tty -n garage garage-0 -- ./garage layout assign -z homelab -c 10G <node_4_id>
kubectl exec --stdin --tty -n garage garage-0 -- ./garage layout apply --version 1
```

### Creating a Bucket

```sh
kubectl exec --stdin --tty -n garage garage-0 -- ./garage bucket create <some_name>-bucket
```

### Create a Key

```sh
kubectl exec --stdin --tty -n garage garage-0 -- ./garage key create <some_name>-app-key
```

### Assign Key to Bucket

```sh
kubectl exec --stdin --tty -n garage garage-0 -- ./garage bucket allow --read --write --owner outline-bucket --key outline-app-key
```
