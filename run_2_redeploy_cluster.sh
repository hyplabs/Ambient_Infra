docker run --name ambient-infa-container gcloud config set project crocswap
docker run --name ambient-infa-container gcloud container clusters delete gcgo-test-cluster --zone us-central1-a
docker run --name ambient-infa-container gcloud container clusters create gcgo-test-cluster --zone us-central1-a


gcloud config set project crocswap
#gcloud container clusters delete gcgo-test-cluster --zone us-central1-a #Not Needed
apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
#gcloud components install gke-gcloud-auth-plugin
gcloud container clusters get-credentials gcgo-test-cluster --zone us-central1-a
gcloud container clusters create gcgo-test-cluster --zone us-central1-a #Expected to fail on re-run

kubectl delete all --all # -n your-namespace if not default
# kubectl delete deployment deployment-name
kubectl apply -f your-deployment-file.yml