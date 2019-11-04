# Release

```bash
helm ls <release-name> --tiller-namespace=<namespace> --output yaml 
```

### Rollback

```bash
helm rollback <release-name> <revision>
```

