# Useful bash scripts

Recreate all pods in current namespaces

```bash
for p in `kubectl get deploy -o name`;
  do echo $p; 
  kubectl scale --replicas=0 $p; 
  kubectl scale --replicas=1 $p;
done
```

Get all container images in cluster

```bash
kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' |\
sort
```

Number of pods per Node

```bash
kubectl get pod -o=custom-columns=NODE:.spec.nodeName --all-namespaces | sed -n '1!p' | sort -n | uniq -c 
```

Pods running in specific node

```bash
 k get po --all-namespaces --field-selector spec.nodeName=ip-10-159-53-189.eu-west-1.compute.internal 
```

