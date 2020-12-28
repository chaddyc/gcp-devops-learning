#create firewall rule allowing http traffic port80
gcloud compute firewall-rules create www-firewall-network-lb \--target-tags network-lb-tag --allow tcp:80

#create 2x webservers for http load balancer configuration
gcloud compute instances create www1 \
  --image-family debian-9 \
  --image-project debian-cloud \
  --zone us-east1-b \
  --tags network-lb-tag \
  --metadata startup-script="#! /bin/bash
    apt-get update
    apt-get install -y nginx
    service nginx start
    sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
  