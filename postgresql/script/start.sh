#!/bin/bash

docker stop postgresql
docker rm postgresql

# Create a postgresql instance locally with a name of 'postgresql'
# and persisting data to a volume called database/postgresql
docker run --name postgresql \
  -e POSTGRES_USER=user \
  -e POSTGRES_PASSWORD=userpass \
  -p 5432:5432 \
  -v postgresql:/var/lib/postgresql/data \
  -d postgres
