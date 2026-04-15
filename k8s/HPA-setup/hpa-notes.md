# Apache HPA on Kubernetes — Commands Reference

## config metrics server on kind [link](https://github.com/LondheShubham153/kubestarter/tree/main/HPA_VPA)


- kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
- kubectl -n kube-system edit deployment metrics-server
  - Add the security bypass to deployment under container.args
    - --kubelet-insecure-tls
    - --kubelet-preferred-address-types=InternalIP,Hostname,ExternalIP

- kubectl -n kube-system rollout restart deployment metrics-server
- kubectl get pods -n kube-system
- kubectl top nodes
- kubectl top pods
- kubectl top pods -n nginx


## 1. Deploy Apache Stack

```bash
kubectl apply -f namespace.yml
kubectl apply -f service.yml
kubectl apply -f deployment.yml
kubectl apply -f hpa.yml
```

---

## 2. Verify Deployment

```bash
# Check all resources in apache namespace
kubectl get all -n apache

# Check HPA status and CPU targets
kubectl get hpa -n apache
```

---

## 3. Port Forward Apache Service (Terminal 1)

```bash
kubectl port-forward service/apache-service -n apache 8081:8081 --address=0.0.0.0
```

---

## 4. Run BusyBox Load Stress Pod (Terminal 2)

```bash
# Launch interactive BusyBox shell in apache namespace
kubectl run -i --tty loadstress --image=busybox -n apache -- /bin/sh
```

---

## 5. Put Load on Apache (Inside BusyBox Shell)

```bash
# Replace <ClusterIP> with your apache-service CLUSTER-IP (e.g. 10.96.200.118)
while true; do wget -q -O- http://<ClusterIP>:8081 > /dev/null; done
```

> **Tip:** Get the ClusterIP by running `kubectl get svc -n apache`

---

## 6. Watch HPA Scale in Real Time (Terminal 3)

```bash
# Watch HPA react to load
kubectl get hpa -n apache -w

# Watch pods scale up/down
kubectl get pods -n apache -w
```

---

## 7. Resume BusyBox Session (if exited)

```bash
kubectl attach loadstress -c loadstress -i -t
```
