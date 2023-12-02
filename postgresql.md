<h1>PostgreSQL</h1>

To start a local instance of postgresql, run the start script from the [./postgresql](./postgresql/) directory.

```sh
./postgresql/script/start.sh
```

This creates a docker image and starts a postgresql db container and is accessible from port 5432 and set on the [start script](./postgresql/script/start.sh).

To stop postgresql from running

```sh
./jenkins/script/stop.sh
```

The data and configuration for jenkins is stored in a docker volume called `postgresql` so the tables and data would still be available when the container is started up again.

If you need to create a clean db, remove the `postgresql` volume in docker by running

```sh
docker volume rm postgresql
```
