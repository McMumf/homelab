# Cloudflare Tunnel (UNUSED)

Cloudfare's Zero Trust tunnel

Follow this article to understand what to do: [Use cloudflared to expose a Kubernetes app to the Internet](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/)

## How it Works

```mermaid
sequenceDiagram
  participant user as Client's Device
  participant cloudflare as Cloudflare's Network
  participant cloudflared as Cloudflared
  participant ingress as Ingress Controller

  user->>+cloudflare: HTTP Request

  Note over cloudflare: Check tunnel config and<br>send traffic to local<br>cloudflared deployment

  cloudflare->>-cloudflared: HTTP Request

  Note over cloudflared: Route to specified<br>Serviceor Ingress
  activate cloudflared
  cloudflared->>ingress: HTTP Request
  deactivate cloudflared
```

## Setup

### Initial Configuration

**Create a new tunnel:**

```shell
$ cloudflared tunnel login

A browser window should have opened at the following URL:

https://dash.cloudflare.com/argotunnel?aud=&callback=https%3A%2F%2Flogin.cloudflareaccess.org%something%3D

If the browser failed to open, please visit the URL above directly in your browser.
You have successfully logged in.
If you wish to copy your credentials to a server, they have been saved to:
/root/.cloudflared/cert.pem

$ cloudflared tunnel create k8s-tunnel
Tunnel credentials written to /root/.cloudflared/something.json. cloudflared chose this file based on where your origin certificate was found. Keep this file secret. To revoke these credentials, delete the tunnel.

Created tunnel k8s-tunnel with id something
```

**Create the tunnel secret:**

```shell
$ kubectl create secret generic tunnel-credentials \
--from-file=credentials.json=~/.cloudflared/ef824aef-7557-4b41-a398-4684585177ad.json -n cloudflared
```

_Note: The tunnel UUID is directly from Cloudflare's Documentation and is not real._

Update `values.yaml` to have the tunnel name and the newly created secret name.

### Adding Routes

To add have the tunnel route a new cname, do the following:

```shell
$ cloudflared tunnel route dns k8s-tunnel subdomain.host.whatever
2023-04-20T16:20:52Z INF Added CNAME subdomain.host.whatever which will route to this tunnel tunnelID=<some tunnel id>
```

## Questions

- How to get cloudflared traffic to talk to services behind ingress with TLS?
  - Currently works without TLS enabled for ingresses
