# kube-state
GitOps repository defining the desired state of Kubernetes cluster. Contains environment-specific configurations and value overrides.

## Observability

`clusters/local/observability/` deploys Prometheus, Grafana, Loki, Tempo, and Alloy via Flux HelmReleases. `shop-operator` generates a per-shop Grafana dashboard and PrometheusRule on top of this stack; `clusters/local/infra/ingress-nginx.yaml` exposes edge metrics (response time, traffic).

Access (namespace `observability`):

| Service | URL | Credentials |
|---|---|---|
| Grafana | `http://grafana.local` (nginx ingress) | `admin` / `admin` — local only, see `adminPassword` in `kube-prometheus-stack.yaml` |
| Prometheus | `kubectl port-forward svc/kube-prometheus-stack-prometheus 9090:9090 -n observability` | none |
| Alertmanager | `kubectl port-forward svc/kube-prometheus-stack-alertmanager 9093:9093 -n observability` | none |
| Loki / Tempo | via Grafana Explore only (no standalone UI) | same as Grafana |

Cluster alarms and per-shop alarms both route to Discord — cluster-wide alerts to the shared channel (`discord-cluster-alerts`), per-shop alerts to that shop's channel via its `AlertmanagerConfig`.
