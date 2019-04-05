# Useful bash scripts

Recreate all pods in current namespaces

```bash
for p in `kubectl get deploy -o name`;
  do echo $p; 
  kubectl scale --replicas=0 $p; 
  kubectl scale --replicas=1 $p;
done
```



