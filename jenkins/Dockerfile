FROM jenkins/jenkins:lts
USER root

COPY ./resources/docker/* /usr/bin/
RUN mkdir -p /usr/local/lib/docker/cli-plugins
COPY ./resources/docker-compose/docker-compose /usr/local/lib/docker/cli-plugins

RUN mkdir /etc/docker &&  echo '{"insecure-registries":["192.168.56.3"]}' > /etc/docker/daemon.json

USER jenkins

# RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
