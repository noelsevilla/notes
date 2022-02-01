#!/bin/bash

docker container stop jenkins
docker run --rm -d --name jenkins -p 8080:8080 \
  -v jenkins:/var/jenkins_home \
  --group-add "$(stat -c '%g' /var/run/docker.sock)" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --env JENKINS_ADMIN_ID=admin \
  --env JENKINS_ADMIN_PASSWORD=admin \
  jenkins-docker:latest
