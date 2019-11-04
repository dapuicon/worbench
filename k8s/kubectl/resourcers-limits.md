# Resourcers limits

## Nodes

Get all nodes memory and cpu consumption

```bash
k get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'kubectl top node {}; echo'
```

