#!/bin/sh

set -e
# $1 - Rancher Stack name
# $2 - Rancher service name
# $3 - Docker repository url
# $4 - Rancher service image name
# $5 - Rancher service tag

echo ""
echo "===== Prepare for upgrade"
echo ""
echo "Stack: $1"
echo "Service: $2"
echo "Repository: $3"
echo "Image: $4"
echo "Tag: $5"
echo ""
echo "===== Exporting Rancher stack: $1"
echo ""
cd /tmp
rancher export $1
cd $1
echo ""
echo "===== Changing version for Rancher service: $2"
echo ""
sed -i -e "s/.*\/$4.*/    image: $3\/$4:$5/" docker-compose.yml
#cat docker-compose.yml
#echo ""
echo "===== Upgrade Rancher stack"
echo ""
rancher up -d --pull --upgrade --confirm-upgrade $2
echo ""
echo "===== Upgrade finished"
