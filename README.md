# 📝 Notes App (Full DevOps Project)

A full-stack notes application built with **Django REST Framework** (backend) and **React** (frontend), fully containerized with Docker, automated using **Terraform + Ansible**, monitored with a complete observability stack, and scalable with Kubernetes.

---

## 🗂️ Project Structure

```bash
notes-app/
├── application/          # Django backend + React frontend
├── docker-compose.yml    # App + observability stack
├── prometheus.yml        # Prometheus config
├── grafana/              # Grafana provisioning
├── k8s/                  # Kubernetes manifests
├── terraform/            # Infrastructure as Code (AWS EC2)
├── ansible/              # Configuration & deployment automation
└── README.md
```

---

## 🚀 End-to-End DevOps Workflow

```text
Terraform → Create EC2 → Generate Inventory → Ansible → Install Docker → Deploy App
```

---

# ⚙️ 1. Infrastructure Setup (Terraform)

```bash
cd terraform
terraform init
terraform apply
```

### 📤 Outputs

```bash
ec2_public_ip = "x.x.x.x"
ec2_username  = "ubuntu"
```

### 🔍 Check anytime

```bash
terraform output
```

### 🧹 Destroy Infra

```bash
terraform destroy
```

👉 Full details: see `terraform/README.md`

---

# 🔧 2. Configuration & Deployment (Ansible)

```bash
cd ansible
chmod +x generate_inventory.sh   # run once
./generate_inventory.sh
```

### 🔌 Test connection

```bash
ansible -i inventory.ini dev -m ping
```

### 🚀 Deploy application

```bash
ansible-playbook -i inventory.ini playbooks/noteapp.yml
```

👉 Full details: see `ansible/README.md`

---

# 🐳 3. Application (Docker Compose)

Once deployed via Ansible, services will be available:

| Service    | URL                  |
| ---------- | -------------------- |
| Notes App  | http://<EC2-IP>:8083 |
| Prometheus | http://<EC2-IP>:9090 |
| Grafana    | http://<EC2-IP>:3000 |
| cAdvisor   | http://<EC2-IP>:8080 |

---

# 📊 Observability Stack

Included in Docker Compose:

* **Prometheus** → Metrics collection
* **Node Exporter** → Host metrics
* **cAdvisor** → Container metrics
* **Grafana** → Dashboards
* **Loki + Promtail** → Logging

---

# ☸️ Kubernetes Deployment (Optional)

```bash
kubectl apply -f k8s/
```

Includes:

* Deployments
* Services
* Persistent volumes
* Autoscaling (HPA)

---

# 🧰 Tech Stack

| Layer         | Technology          |
| ------------- | ------------------- |
| Backend       | Django, DRF         |
| Frontend      | React               |
| Database      | MySQL               |
| Container     | Docker              |
| IaC           | Terraform           |
| Config Mgmt   | Ansible             |
| Orchestration | Kubernetes          |
| Monitoring    | Prometheus, Grafana |
| Logging       | Loki                |

---

# 🔥 One-Line Full Deployment

```bash
terraform apply -auto-approve && \
cd ansible && \
./generate_inventory.sh && \
ansible-playbook -i inventory.ini playbooks/noteapp.yml
```

---

# 🧠 Key Highlights

* Infrastructure provisioning using Terraform
* Automated server configuration using Ansible
* Containerized microservices architecture
* Observability with metrics and logs
* Kubernetes-ready deployment
* End-to-end DevOps pipeline

---

# 📄 License

See [LICENSE](./LICENSE)

---

💡 This project demonstrates a complete **real-world DevOps workflow from provisioning → deployment → monitoring**

