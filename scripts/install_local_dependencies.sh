#!/bin/bash
sudo echo ""

# install minikube
cd /tmp || exit 0
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# install helm
cd /tmp || exit 0
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh

# add airbyte helm repo
helm repo add airbyte https://airbytehq.github.io/helm-charts