# 📝 Notes App

A full-stack notes application built with **Django REST Framework** (backend) and **React** (frontend), containerized with Docker, monitored with a full observability stack, and scalable with Kubernetes.

---

## 🗂️ Project Structure

```
notes-app/
├── application/          # Django backend + React frontend
│   ├── api/              # DRF API (models, views, serializers)
│   ├── mynotes/          # React frontend source
│   ├── notesapp/         # Django project settings
│   └── requirements.txt
├── k8s/                  # Kubernetes manifests
├── grafana/              # Grafana provisioning configs
├── docker-compose.yml    # Full stack with observability
└── prometheus.yml        # Prometheus scrape config
```

---

## 🚀 Getting Started

### Prerequisites

- Docker & Docker Compose
- (Optional) `kubectl` + a Kubernetes cluster for K8s deployment

### 1. Clone the repo

```bash
git clone <repo-url>
cd notes-app
```

### 2. Create your `.env` file

```env
# copy this as-is and fill in your values
```

> ⚠️ Never commit your `.env` file.

### 3. Run with Docker Compose

```bash
docker-compose up --build
```

| Service       | URL                        |
|---------------|----------------------------|
| Notes App     | http://localhost:8083       |
| Prometheus    | http://localhost:9090       |
| Grafana       | http://localhost:3000       |
| cAdvisor      | http://localhost:8080       |

---

## 📊 Observability Stack

The `docker-compose.yml` includes a full monitoring setup:

- **Prometheus** — metrics collection
- **cAdvisor** — container resource usage
- **Node Exporter** — host-level metrics
- **Grafana** — dashboards and visualization
- **Loki + Promtail** — log aggregation

Grafana datasources and dashboards are auto-provisioned from `./grafana/provisioning/`.

---

## ☸️ Kubernetes Deployment

All K8s manifests live in the `k8s/` directory.

```bash
# Create namespace
kubectl apply -f k8s/namespace.yml

# Deploy app + DB
kubectl apply -f k8s/configmap.yml
kubectl apply -f k8s/secrets.yml
kubectl apply -f k8s/pv.yml
kubectl apply -f k8s/pvc.yml
kubectl apply -f k8s/mysql-deployment.yml
kubectl apply -f k8s/app-deployment.yml
kubectl apply -f k8s/service.yml

# Enable autoscaling
kubectl apply -f k8s/hpa.yml
```

A local `kind` cluster config is available at `k8s/kind-cluster/clusterconfig.yml`.

---

## 🧰 Tech Stack

| Layer         | Technology                        |
|---------------|-----------------------------------|
| Backend       | Django, Django REST Framework     |
| Frontend      | React                             |
| Database      | MySQL 8.0                         |
| Container     | Docker, Docker Compose            |
| Orchestration | Kubernetes (kind for local)       |
| Monitoring    | Prometheus, Grafana, cAdvisor     |
| Logging       | Loki, Promtail                    |
| WSGI          | Gunicorn                          |

---

## 📄 License

See [LICENSE](./LICENSE) for details.
