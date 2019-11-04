# Helm

Install tiller in namespace with service account

```bash
helm init --service-account <service-account> --tiller-namespace <k8s-namespace>
```

Install tiller overriding image an preventing istio sidecar injection

```bash
helm ls --tiller-namespace=<k8s-namespace>
```

```bash
helm init  --override spec.template.metadata.annotations."sidecar\.istio\.io/inject"="false" --tiller-namespace openapi --service-account user-admin --tiller-image thirdparties/tiller:latest
```

List releases

Get deployed files

```bash
 helm get manifest <relese>  --tiller-namespace <k8s-namespace>
```

Get values file for a given releaes

```bash
 helm get values <release> --tiller-namespace=<k8s-namespace>
```

> ```text
>   -a, --all                   dump all (computed) values
>   -h, --help                  help for values
>       --output string         output the specified format (json or yaml) (default "yaml")
>       --revision int32        get the named release with revision
>       --tls                   enable TLS for request
>       --tls-ca-cert string    path to TLS CA certificate file (default "$HELM_HOME/ca.pem")
>       --tls-cert string       path to TLS certificate file (default "$HELM_HOME/cert.pem")
>       --tls-hostname string   the server name used to verify the hostname on the returned certificates from the server
>       --tls-key string        path to TLS key file (default "$HELM_HOME/key.pem")
>       --tls-verify            enable TLS for request and verify remote
> ```

## Add repo

```bash
 helm repo add <repo-name> http://myrepo
```

