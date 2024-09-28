#!/bin/bash

# Update PATH to include the directory where kubectl is located (if needed)
export PATH=$PATH:/var/jenkins_home/.local/bin  # Adjust if kubectl is installed elsewhere

# Apply Kubernetes configurations
echo "Applying Kubernetes configurations..."

kubectl apply -f Deployments/backend_deployment.yaml || { echo "Failed to apply backend_deployment.yaml"; exit 1; }
kubectl apply -f Deployments/proxy_deployment.yaml || { echo "Failed to apply proxy_deployment.yaml"; exit 1; }
kubectl apply -f Deployments/database_deployment.yaml || { echo "Failed to apply database_deployment.yaml"; exit 1; }

kubectl apply -f Services/backend_service.yaml || { echo "Failed to apply backend_service.yaml"; exit 1; }
kubectl apply -f Services/proxy_nodeport.yaml || { echo "Failed to apply proxy_nodeport.yaml"; exit 1; }
kubectl apply -f Services/db_service.yaml || { echo "Failed to apply db_service.yaml"; exit 1; }

kubectl apply -f Volumes/db-data-pv.yaml || { echo "Failed to apply db-data-pv.yaml"; exit 1; }
kubectl apply -f Volumes/db-data-pvc.yaml || { echo "Failed to apply db-data-pvc.yaml"; exit 1; }
kubectl apply -f Volumes/db-secret.yaml || { echo "Failed to apply db-secret.yaml"; exit 1; }

echo "Kubernetes configurations applied successfully!"
