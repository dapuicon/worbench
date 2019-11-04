# Chart

## Create Chart

```bash
helm create <mychart>
```

### Dependendy update

Once you have a dependencies file, you can run `helm dependency update` and it will use your dependency file to download all the specified charts into your `charts/` directory for you

```bash
helm dep update <repo-name>
```

### Test locally

To render just one template in a chart, use '-x':

```text
$ helm template mychart -x templates/deployment.yaml
# With subCharts
helm template . -x charts/prometheus/templates/deployment.yaml -f ./values-dev.yaml
```

### Test Chart against Tiller

When you want to test the template rendering, but not actually install anything, you can use helm install `--debug --dry-run ./mychart`. This will send the chart to the Tiller server, which will render the templates. But instead of installing the chart, it will return the rendered template to you so you can see the output

```bash
helm install --dry-run --debug ./mychart
```

## Helm template against remote Chart

Helm template can only run in local. In order tu run helm template against a remote Chart we can do:

```bash
helm fetch <remote-repo>/cert-manager --untar
helm template ./cert-manager/
```

## Install

```bash
helm install --dry-run --debug --tiller-namespace=openapi openapi-releases/microservice -f mdggateway/PRO/values.yaml
```

## Upgrade

```bash
helm upgrade mdggateway-pro openapi-releases/microservice -f mdggateway/PRO/values.yaml --dry-run --debug --tiller-namespace=openapi
```

### Download Chart content

```bash
 helm fetch stakater/reloader --untar
```

