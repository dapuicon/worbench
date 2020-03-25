# Release



```bash
helm ls <release-name> --tiller-namespace=<namespace> --output yaml
```

## Rollback

```bash
helm rollback <release-name> <revision>
```

## Delete all failed releases

```bash
helm ls -d --failed --short | xargs -t helm del --purge
```

