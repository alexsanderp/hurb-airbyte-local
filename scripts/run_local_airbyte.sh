#!/bin/bash
sudo echo ""

# run minikube
minikube start --memory=4000

# install airbyte
helm install local airbyte/airbyte

echo "http://localhost:8000/"

# forwarding a port from airbyte to local port 8000
kubectl port-forward svc/local-airbyte-webapp-svc 8000:80
