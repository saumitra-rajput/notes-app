# Kubernetes Dashboard Setup & Misc Commands

## 1. Install Kubernetes Dashboard

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
```

Creates the following resources in `kubernetes-dashboard` namespace:
- namespace, serviceaccount, service, secrets, configmap
- role, clusterrole, rolebinding, clusterrolebinding
- deployments: `kubernetes-dashboard`, `dashboard-metrics-scraper`

---

## 2. Create Admin User (`dashboard-admin-user.yml`)

```bash
kubectl apply -f dashboard-admin-user.yml
```

> ⚠️ Common error — wrong field name in ClusterRoleBinding:
> `unknown field "subject"` → use `subjects` (plural) not `subject`

---

## 3. Generate login token

```bash
kubectl -n kubernetes-dashboard create token admin-user
```

> Copy the token output — paste it in the dashboard login screen.

---

## 4. Access the Dashboard

```bash
# Run proxy in background
kubectl proxy &
```

Then open in browser:
```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

---

## 5. Deploy flask-app

```bash
cd basics/flask-app

kubectl apply -f namespace.yml
kubectl apply -f service.yml -f deployment.yml -f ingress.yml
```

---

## 6. Deploy nginx with PV, PVC, Job, CronJob

```bash
cd basics/nginx

kubectl apply -f namespace.yml
kubectl apply -f persistentVolume.yml \
              -f persistentVolumeClaim.yml \
              -f deployment.yml \
              -f service.yml \
              -f job.yml \
              -f cronjob.yml
```

### Cleanup

```bash
kubectl delete ns nginx
```
