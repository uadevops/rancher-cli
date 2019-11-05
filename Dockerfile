FROM alpine:3.10.3
LABEL maintainer="Sviatoslav <sviatoslav@uadevops.com>"

ENV DEBIAN_FRONTEND="noninteractive" \
    LC_ALL="C.UTF-8" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

ARG RANCHER_CLI_VERSION=0.6.14

RUN wget -P /tmp/ https://github.com/rancher/cli/releases/download/v${RANCHER_CLI_VERSION}/rancher-linux-amd64-v${RANCHER_CLI_VERSION}.tar.gz ;\
    tar -xzf /tmp/rancher-linux-amd64-v${RANCHER_CLI_VERSION}.tar.gz --strip-components 2 -C /usr/local/bin ;\
    rm -rf /var/cache/apk/* /tmp/*

COPY data/ /
RUN chmod +x /*.sh

CMD ["/upgrade-service.sh"]
