# AKS

## Deallocate vm

```bash
az vm deallocate --ids $(az vm list -g MC_my_resourcegroup_westeurope --query "[].id" -o tsv)
```

## Start vm

```bash
az vm start --ids $(az vm list -g MC_my_resourcegroup_westeurope --query "[].id" -o tsv)
```

