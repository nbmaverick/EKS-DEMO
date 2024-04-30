# EKS-DEMO
## In this repo I created EKS cluster and deployed Prometheus and Grafana

### Step-by-step access to Prometheus and Grafana

### 1. SSH to EKS Cluster
```
aws eks update-kubeconfig --region us-east-2 --name myeks
```
### 2. Ensure access to EKS cluster
```
kubectl get nodes
```
## 3.Install Helm on Linux
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
helm version
```
## 4. Check Prometheus and Grafana up and running
```
kubectl get svc -n prometheus
```
## 5. Edit Grafana service. replace "type: ClusterIP" to LoadBalancer
```
kubectl edit svc prometheus-grafana -n prometheus
```
## 6. Run command and copy External-IP address and put in the browser
```
kubectl get svc -n prometheus
```
### 7. User - admin  Password - prom-operator

### Here you are! Grafana is working!

### 8. Edit Prometheus service. replace "type: ClusterIP" to LoadBalancer
```
kubectl edit svc prometheus-kube-prometheus-prometheus -n prometheus
```
## 9. Run command and copy External-IP address and put in the browser with :9090 at the end
```
kubectl get svc -n prometheus
```
## Here you are! Prometheus is working too!





