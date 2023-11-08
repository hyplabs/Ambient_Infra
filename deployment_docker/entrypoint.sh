#!/bin/bash

# Populate the env secrets-.yml files using the templates
# (You need to define how you're going to replace the placeholders in your templates)
# For example:
# envsubst < secrets-template.yml > secrets-analytic-tools.yml

# Then follow these commands to get going:
# Note that you will need to provide your own configurations for `gcloud auth login` as it requires interactive user input.
gcloud components install kubectl -q
gcloud auth login --no-launch-browser
gcloud config set project YOUR_PROJECT_ID
gcloud container clusters create my-cluster --zone us-central1-a
gcloud container clusters list
gcloud container clusters get-credentials autopilot-cluster-1 --zone us-central1

# Add secrets
kubectl apply -f secrets-analytic-tools.yml
kubectl apply -f secrets-chat.yml
kubectl apply -f secrets-gcgo-candles.yml

# Execute anything else passed to the docker run command
exec "$@"
