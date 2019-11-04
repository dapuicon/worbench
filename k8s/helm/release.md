# Release

```bash
helm ls <release-name> --tiller-namespace=openapi --output yaml 
```

### Rollback

```bash
helm rollback <release-name> <revision>
```

