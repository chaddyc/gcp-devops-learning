#create GCP Kubernetes Cluster
gcloud container clusters create kube-cluster

#authenticate Kubernetes Cluster
gcloud container clusters get-credentials kube-cluster

#create a Kubernetes Deployment
kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0 #replace image source

#create a Kubernetes Service
kubectl expose deployment hello-app --type=LoadBalancer --port 8080

