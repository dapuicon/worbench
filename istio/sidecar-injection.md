# Sidecar-Injection

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



