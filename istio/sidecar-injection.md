---
description: 'https://istio.io/docs/setup/additional-setup/sidecar-injection/'
---

# Sidecar-Injection

Manual sidecar injection

```bash
kubectl get deploy -l app.kubernetes.io/name=atp -n openapi -o yaml | istioctl kube-inject -f - | kubectl apply -n openapi -f -
```

Manual sidecar injectiono for all deployment

```bash
for d in `kubectl get deploy -n openapi -o name`;
  do;
  echo $d;
  kubectl get $d -n openapi -o yaml | istioctl kube-inject -f - | kubectl apply -n openapi -f - ;
done;
```

Enable sidecar injection on namespace

```bash
kubectl label namespace <namespace> istio-injection=enabled
```

Disable sidecar injection on namesapce

```bash
kubectl label namespace <namespace> istio-injection- 
```

Disable injection by pod / deployment

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
 name: ignored
spec:
 template:
   metadata:
     annotations:
       sidecar.istio.io/inject: "false"
```

which is equivalent to

```bash
kubectl patch deploy/reloader-reloader -p "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{ \"sidecar.istio.io/inject\":\"false\"}}}}}"  
```

