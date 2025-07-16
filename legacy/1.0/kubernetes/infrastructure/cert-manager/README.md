# Cert Manager

X.509 certificate management for Kubernetes and OpenShift

## Links

- [Docs](https://cert-manager.io/docs/)

## Deploying

```shell
$ helmfile apply
Adding repo jetstack https://charts.jetstack.io
"jetstack" has been added to your repositories

Comparing release=cert-manager, chart=jetstack/cert-manager

...

UPDATED RELEASES:
NAME           CHART                   VERSION   DURATION
cert-manager   jetstack/cert-manager   v1.11.0      1m27s

$ kubectl apply -f cluster-issuer.yaml -n cert-manager
```
