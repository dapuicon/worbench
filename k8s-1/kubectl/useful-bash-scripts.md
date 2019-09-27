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

