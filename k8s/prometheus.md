# Prometheus

## K8s Annotations

Can be reviewed on [https://prometheus.io/docs/prometheus/latest/configuration/configuration/\#kubernetes\_sd\_config](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#kubernetes_sd_config)

### Pod annotations

```yaml
prometheus.io/scrape: 'true'
prometheus.io/port: '{{ .Values.deployment.containers.containerMetricsHealthPort |  default .Values.deployment.containers.containerPort }}'
prometheus.io/path: '/actuator/prometheus'
prometheus.io/scheme: 'http'
```

Annotations are evaluated according prometheus configuration file.

This is an example of relation between k8s metada annotations and prometheus config meta labels.

```yaml
__meta_kubernetes_pod_annotation_prometheus_io_scrape ==> prometheus.io/scrape
__meta_kubernetes_pod_annotation_prometheus_io_scheme ==> prometheus.io/scheme
```

```yaml
...
- job_name: 'kubernetes-pods-istio-secure'
      scheme: https
      tls_config:
        ca_file: /etc/istio-certs/root-cert.pem
        cert_file: /etc/istio-certs/cert-chain.pem
        key_file: /etc/istio-certs/key.pem
        insecure_skip_verify: true  # prometheus does not support secure naming.
      kubernetes_sd_configs:
      - role: pod
      relabel_configs:
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      # sidecar status annotation is added by sidecar injector and
      # istio_workload_mtls_ability can be specifically placed on a pod to indicate its ability to receive mtls traffic.
      - source_labels: [__meta_kubernetes_pod_annotation_sidecar_istio_io_status, __meta_kubernetes_pod_annotation_istio_mtls]
        action: keep
        regex: (([^;]+);([^;]*))|(([^;]*);(true))
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scheme]
        action: drop
        regex: (http)
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)
      - source_labels: [__address__]  # Only keep address that is host:port
        action: keep    # otherwise an extra target with ':443' is added for https scheme
        regex: ([^:]+):(\d+)
      - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
        action: replace
        regex: ([^:]+)(?::\d+)?;(\d+)
        replacement: $1:$2
        target_label: __address__
      - action: labelmap
        regex: __meta_kubernetes_pod_label_(.+)
      - source_labels: [__meta_kubernetes_namespace]
        action: replace
        target_label: namespace
      - source_labels: [__meta_kubernetes_pod_name]
        action: replace
        target_label: pod_name
```

