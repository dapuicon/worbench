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

#### Copy Files from a pod to your machine

```bash
kubectl cp {{namespace}}/{{podname}}:path/to/directory /local/path
# Example
k cp tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi /cygdrive/c/Users/dpuigcon/Desktop/Everis/Orange Open Api/tools/EKS/backup
# Copying a file
k cp tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi/victor2.sql ./backup/victor2.sql

```

#### Copy Files to a pod

```bash
kubectl cp /local/path namespace/podname:path/to/directory 
# Example
k cp ./bakup/victor3.sql tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi/victor3.sql
```

