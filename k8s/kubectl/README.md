# Kubectl

## Apply

Inline

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: busybox-sleep
spec:
  containers:
  - name: busybox
    image: busybox
    args:
    - sleep
    - "1000000"
---
apiVersion: v1
kind: Pod
metadata:
  name: busybox-sleep-less
spec:
  containers:
  - name: busybox
    image: busybox
    args:
    - sleep
    - "1000"
EOF
```

## Annotations

Add annotations to pod:

```bash
k annotate po privacymanagement-7d578b9965-d8j2b <my-annotation>=<value> 
```

## Check rolout

```bash
kubectl rollout status deployment myapp
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
k cp tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi /cygdrive/c/Users/dpuigcon/Desktop/tools/EKS/backup
# Copying a file
k cp tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi/victor2.sql ./backup/victor2.sql

```

#### Copy Files to a pod

```bash
kubectl cp /local/path namespace/podname:path/to/directory 
# Example
k cp ./bakup/victor3.sql tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi/victor3.sql
# Copying a folder
# mappings folder is copyied on wiremock folder
k cp ./tmp/wiremock/mappings wiremock-server-b56dfcb4f-gkqh7:/home/wiremock

```

