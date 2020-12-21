#list active account name
gcloud auth list

#list project ID
gcloud config list project

#set default compute zone
gcloud config set compute/zone us-east1-b

#set default compute region
gcloud config set compute/region us-central1

#confirm nginx installation
ps auwx | grep nginx

#create VM Instance with Cloud Shell
gcloud compute instances create [instance-name]-machine-type n1-standard-2 --zone us-central1-c

#create Vm Instance with Cloud Shell with zone variable(set zone variable)
gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone $ZONE

#establish an ssh connection to GCP VM Instance
gcloud compute ssh gcelab2 --zone us-central1-c

#create an environment variable to store your project Id
export PROJECT_ID=<your_project_ID>

#create an environment variable to store your zone
export ZONE=<your_zone>

#install GCP SDK
sudo apt-get install google-cloud-sdk

#describe vm (list vm details)
gcloud compute instances describe <your_vm>

#add source code to deploy nginx servers (load-balancer)
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF