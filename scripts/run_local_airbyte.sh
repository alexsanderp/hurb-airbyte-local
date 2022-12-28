#!/bin/bash
sudo echo ""

# run minikube
minikube start --memory=4000

# install airbyte
helm install local airbyte/airbyte

# forwarding a port from airbyte to local port 8000
RET=1
until [ ${RET} -eq 0 ]; do
    kubectl port-forward svc/local-airbyte-webapp-svc 8000:80
    RET=$?
    sleep 10
done