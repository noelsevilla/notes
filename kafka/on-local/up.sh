#!/bin/bash

set -x
export COMPOSE_HTTP_TIMEOUT=180

docker compose -p test-poc -f kafka/docker/docker-compose.yml up -d
