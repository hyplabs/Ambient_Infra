docker run --name ambient-infa-container ./google-cloud-sdk/bin/gcloud init #REQUIRES INTERACTIVE STEPS
docker run --name ambient-infa-container ./google-cloud-sdk/bin/gcloud components update --quiet
docker run --name ambient-infa-container./google-cloud-sdk/bin/gcloud components install kubectl --quiet