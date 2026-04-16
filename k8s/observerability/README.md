# Monitoring Stack for notes-app (Kubernetes)

## Files
| File | What it deploys |
|------|----------------|
| 00-namespace.yaml | monitoring namespace |
| 01-prometheus-configmap.yaml | prometheus.yml scrape config |
| 02-prometheus-rbac.yaml | ServiceAccount + ClusterRole for pod discovery |
| 03-prometheus.yaml | Prometheus deployment + PVC + service |
| 04-cadvisor.yaml | cAdvisor DaemonSet (container metrics) |
| 05-node-exporter.yaml | Node Exporter DaemonSet (host metrics) |
| 06-loki.yaml | Loki deployment + PVC + service (log storage) |
| 07-promtail.yaml | Promtail DaemonSet (log collector) |
| 08-grafana.yaml | Grafana deployment + PVC + service |

## Deploy everything
```bash
kubectl apply -f .
```

## Access Grafana
```bash
kubectl port-forward svc/grafana-service 3000:3000 -n monitoring
```
Open: http://localhost:3000
Login: admin / admin123  (change GF_SECURITY_ADMIN_PASSWORD in 08-grafana.yaml)

## Access Prometheus
```bash
kubectl port-forward svc/prometheus-service 9090:9090 -n monitoring
```
Open: http://localhost:9090

## Recommended Grafana Dashboards (import by ID)
- 14282 - Kubernetes / cAdvisor (container CPU/memory)
- 1860  - Node Exporter Full (host metrics)
- 13639 - Loki logs dashboard

## Optional: MySQL metrics
To get MySQL metrics, deploy mysqld-exporter as a sidecar or separate deployment
in the notes namespace. Add this env var pointing to your DB:
  DATA_SOURCE_NAME: "root:Test@123@(mysql-service:3306)/"

Then Prometheus will scrape it via the mysql job already configured in prometheus.yml.

## Verify all pods are running
```bash
kubectl get pods -n monitoring
```
