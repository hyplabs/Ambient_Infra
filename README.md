# Ambient Infrastructure Repository

This repo is aimed at housing the scripts and settings to aid in collecting other repositories and managing a kubernetes cluster(s) on GCP

install gcloud Then:

gcloud components install kubectl
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
gcloud container clusters create my-cluster --zone us-central1-a
gcloud container clusters list
kubectl apply -f manifest-staging.yml --dry-run=server
kubectl apply -f manifest-staging.yml

kubectl config set-cluster autopilot-cluster-1 --server=https://34.27.182.147:6443 --insecure-skip-tls-verify=true

gcloud container clusters get-credentials autopilot-cluster-1 --zone us-central1

<!-- CADE USEFUL COMMANDS -->

gcloud container clusters get-credentials gcgo-test-cluster --zone us-central1-a
kubectl apply -f infra-manifest.yml
kubectl rollout restart deployment <deployment name>
kubectl describe pod <pod name>

<!-- END CADE COMMANDS -->

Need access to the docker hub container
All images need to be avalible:
find docker hub link for:
redis ngnix

docker pull redis:latest
docker pull nginx:latest
