# istioctl

## Info 

{% embed url="https://archive.istio.io/v1.1/docs/reference/commands/istioctl/" %}

## Check whether mutual TLS is enabled for a service

```bash
istioctl authn tls-check $CLIENT_POD httpbin.default.svc.cluster.local
# Example
istioctl authn tls-check customerviewmdg-6df48f65c7-2ktxq.openapi translator-srv.openapi.svc.cluster.local
```



