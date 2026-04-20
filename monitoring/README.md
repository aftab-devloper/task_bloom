# Phase 6 - Prometheus + Grafana Monitoring

## Tools Used
- Prometheus (kube-prometheus-stack)
- Grafana v12.4.3

## Installation Commands

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install monitoring prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace

## Access Grafana

kubectl port-forward svc/monitoring-grafana 3001:80 -n monitoring

URL: http://localhost:3001

Username: admin

Password: admin123

## Grafana Dashboards
- Kubernetes / Compute Resources / Cluster
- CPU Utilisation: 10.1%
- Memory Utilisation: 55.7%

## Status
All pods Running in monitoring namespace