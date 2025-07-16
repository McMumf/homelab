# Home Assistant

## Configurations

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 10.161.0.0/16
    - 192.168.0.0/16
  login_attempts_threshold: 5
  ssl_certificate: /certs/tls.crt
  ssl_key: /certs/tls.key
```
