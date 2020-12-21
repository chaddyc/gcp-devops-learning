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

#add source code to deploy nginx servers (load-balancer)
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF