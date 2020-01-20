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
kubectl patch pod  mymic-7d578b9965-d8j2b --type='json' -p='[{"op": "remove", "path": "/metadata/annotations/dt"}]'
kubectl patch pod  mymic-7d578b9965-d8j2b --type='json' -p='[{"op": "remove", "path": "/metadata/annotations"}]'
kubectl patch deploy mymic --type='json' -p='[{"op": "add", "path": "/spec/template/metadata/annotations", "value": {"sidecar.istio.io/inject": "false" } }]'
kubectl patch pod mymic-7d578b9965-d8j2b --type='json' -p='[{"op": "add", "path": "/metadata/annotations", "value": {"sidecar.istio.io/inject": "false" } }]'
```

### Copy Files from a pod to your machine

```bash
kubectl cp {{namespace}}/{{podname}}:path/to/directory /local/path
# Example
k cp tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi /cygdrive/c/Users/dpuigcon/Desktop/tools/EKS/backup
# Copying a file
k cp tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi/victor2.sql ./backup/victor2.sql
```

### Copy Files to a pod

```bash
kubectl cp /local/path namespace/podname:path/to/directory
# Example
k cp ./bakup/victor3.sql tools/pgadmin-7c946c7c5f-pc9th:/var/lib/pgadmin/storage/openapi/victor3.sql
# Copying a folder
# mappings folder is copyied on wiremock folder
k cp ./tmp/wiremock/mappings wiremock-server-b56dfcb4f-gkqh7:/home/wiremock
```

### Delete all jobs pods

```bash
 kubectl get pods -n openapi --no-headers=true | awk '/hello-*/ {print $1}' | xargs kubectl delete -n openapi pod
```

### Others

Cluster info `$ kubectl cluster-info`

Nodes `$ kubectl get nodes`

Get info of an object `kubectl describe <command>`

Get info of a node `kubectl describe node gke-kubia-85f6-node-0rrx`

Listing pods `kubectl get pods`

More info `kubectl get pods -o wide`

Expose container `kubectl expose rc kubia --type=LoadBalancer --name kubia-http`

Listing services `kubectl get services`

Replication controllers `kubectl get replicationcontrollers`

Increase replication `kubectl scale rc kubia --replicas=3`

Examining a YAML descriptor of an existing pod `kubectl get po kubia-zxzij -o yaml`

discover possible API object fields `kubectl explain <command> kubectl explain pods kubectl explain pod.spec`

Creating resources `kubectl create -f kubia-manual.yaml`

Retrieving the whole definition of a running pod `$ kubectl get po kubia-manual -o yaml $ kubectl get po kubia-manual -o json`

Retrieving a pod’s log with kubectl logs `$ kubectl logs kubia-manual` NOTE: Container logs are automatically rotated daily and every time the log file reaches 10MB in size

If exists multiple containers you must especified the container name `kubectl logs kubia-manual -c <contianer_name>` To make a pod’s logs available even after the pod is deleted, you need to set up centralized, cluster-wide logging, which stores all the logs into a central store

Obtaining the application log of a crashed container `$ kubectl logs mypod --previous`

Create secret to registry `kubectl create secret docker-registry acr-auth --docker-server <acr-login-server> --docker-username <service-principal-ID> --docker-password <service-principal-password> --docker-email <email-address>`

Show lobels in pods `kubectl get po --show-labels`

Show onli a set of labels `kubectl get pods -L <label>,<label>`

Modifying labels of existing pods `Add label: kubectl label po kubia-manual creation_method=manual Overrride: kubectl label po kubia-manual-v2 env=debug --overwrite`

Filtering using label `kubectl get po -l creation_method=manual kubectl get po -l env kubectl get po -l '!env'`

Set label to node `kubectl label node gke-kubia-85f6-node-0rrx gpu=true`

Adding and modifying annotations `kubectl annotate pod kubia-manual mycompany.com/someannotation="foo bar"`

Discover namespaces `kubectl get ns`

get pods of a namespaces `kubectl get po -n <namespace>`

create namespace `kubectl create namespace custom-namespace`

Deleting a pod by name `kubectl delete po kubia-gpu`

Deleting pods using label selectors `kubectl delete po -l creation_method=manual`

Deleting pods by deleting the whole namespace `kubectl delete ns custom-namespace`

Deleting all pods in a namespace, while keeping the namespace `kubectl delete po --all` NOTE: If a pod depends on a replica controller, the pod will not be deleted, because a new one will be created by the replica controller. The controller must by telented to achive deleting the pods.

Deleting \(almost\) all resources in a namespace `kubectl delete all --all`

List replica controller `kubectl get rc`

Edit replica controller definicitoin `kubectl edit rc kubia`

Scale up replica controller `kubectl scale rc kubia --replicas=10`

