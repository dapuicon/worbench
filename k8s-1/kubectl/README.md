# Kubectl

## Annotations

Add annotations to pod:

```bash
k annotate po privacymanagement-7d578b9965-d8j2b <my-annotation>=<value> 
```

## Patch

```bash
kubectl patch pod  privacymanagement-7d578b9965-d8j2b --type='json' -p='[{"op": "remove", "path": "/metadata/annotations/dt"}]'
kubectl patch pod  privacymanagement-7d578b9965-d8j2b --type='json' -p='[{"op": "remove", "path": "/metadata/annotations"}]'
kubectl patch deploy privacymanagement --type='json' -p='[{"op": "add", "path": "/spec/template/metadata/annotations", "value": {"sidecar.istio.io/inject": "false" } }]'
kubectl patch pod privacymanagement-7d578b9965-d8j2b --type='json' -p='[{"op": "add", "path": "/metadata/annotations", "value": {"sidecar.istio.io/inject": "false" } }]'
```



