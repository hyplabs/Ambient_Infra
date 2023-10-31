# Ambient Infrastructure Repository

This repo is aimed at housing the scripts and settings to aid in collecting other repositories and managing a kubernetes cluster(s) on GCP

## Startup instructions

install gcloud : https://cloud.google.com/sdk/docs/install-sdk

install kubectl : https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

Populate the env secrets-<service>.yml files using the templates

Then follow these comands to get going:
```
gcloud components install kubectl
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
gcloud container clusters create my-cluster --zone us-central1-a
gcloud container clusters list
gcloud container clusters get-credentials autopilot-cluster-1 --zone us-central1
```
add secrets:
```
kubectl apply -f secrets-analytic-tools.yml
kubectl apply -f secrets-chat.yml
kubectl apply -f secrets-gcgo-candles.yml
```

Then to test:
```
kubectl apply -f infra-manifest.yml --dry-run=server
```
To deploy:
```
kubectl apply -f infra-manifest.yml
```

## Usefull comands:
```
kubectl config set-cluster autopilot-cluster-1 --server=https://34.27.182.147:6443 --insecure-skip-tls-verify=true

gcloud container clusters get-credentials autopilot-cluster-1 --zone us-central1
```
<!-- CADE USEFUL COMMANDS -->
```
gcloud container clusters get-credentials gcgo-test-cluster --zone us-central1-a
kubectl apply -f infra-manifest.yml
kubectl rollout restart deployment <deployment name>
kubectl describe pod <pod name>
```
<!-- END CADE COMMANDS -->