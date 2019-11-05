
# Rancher CLI based on Alpine

Dockerized version of `rancher` command based on Alpine Linux.
Include script `upgrade-service.sh` for deployment to Rancher 1.6.x

## How to run script

To run script you need to set environment variables:
- RANCHER_URL
- RANCHER_ACCESS_KEY
- RANCHER_SECRET_KEY

Scripts args:
```
/upgrade-service.sh $1 $2 $3 $3 $4 $5
$1 - Rancher Stack name
$2 - Rancher service name
$3 - Docker repository url
$4 - Rancher service image name
$5 - Rancher service tag
```

Example usage:
```
docker run --rm -it -e RANCHER_URL=http://xxx.xxx.xxx.xxx:8080/v1 -e RANCHER_ACCESS_KEY=xxxxx -e RANCHER_SECRET_KEY=xxxxx uadevops/rancher-cli:0.6.14 /upgrade-service.sh MyStack myapp hub.docker.com myapp-image 1.0.0
```

## Security

Passed security scans using Clair and Trivy.
Image with 0 vulnerabilities.
