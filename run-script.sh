#!/bin/bash

# Update PATH to include the directory where kubectl is located
export PATH=$PATH:/var/jenkins_home

# Apply Kubernetes configurations
kubectl apply -f Deployments/backend_deployment.yaml
kubectl apply -f Deployments/proxy_deployment.yaml
kubectl apply -f Deployments/database_deployment.yaml
kubectl apply -f Services/backend_service.yaml
kubectl apply -f Services/proxy_nodeport.yaml
kubectl apply -f Services/db_service.yaml
kubectl apply -f Volumes/db-data-pv.yaml
kubectl apply -f Volumes/db-data-pvc.yaml
kubectl apply -f Volumes/db-secret.yaml
