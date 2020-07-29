#!/bin/bash

echo "Restarting Greenlight..."
echo ""
docker-compose down
./scripts/image_build.sh conference-lss release-v2
docker-compose up -d

echo "Re-injecting NGINX Routing..."
echo ""
cat ./greenlight.nginx | sudo tee /etc/bigbluebutton/nginx/greenlight.nginx

echo "Restarting NGINX..."
echo ""
systemctl restart nginx

echo "Complete."
