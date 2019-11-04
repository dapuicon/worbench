# istioctl

## Info

{% embed url="https://archive.istio.io/v1.1/docs/reference/commands/istioctl/" caption="" %}

## Check istio installed version

```bash
istioctl version --remote
```

## Check whether mutual TLS is enabled for a service

```bash
istioctl authn tls-check $CLIENT_POD httpbin.default.svc.cluster.local
# Example
istioctl authn tls-check mypod-6df48f65c7-2ktxq.mynamespace otherpod-srv.mynamespace.svc.cluster.local
```

