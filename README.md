Postgres Docker Image with pgStudio
===================================

This is a minimal Alpine Linux (3.4) based progreSQL image complete with the web-admin tool PG Studio.

This image builds on top of my base posrgres 9.5 docker image, adding in an admin user and PG Studio 2.0. This image is intended to aid development of postgresql based applications. I don't recommend using this image in production as the container has 2 executables started with a bootstrap script, which is not the best way to run docker apps.

You can run this images with the following docker command:

`docker run -p 5432:5432 -p 8080:8080 yorkshirekev/postgres-pgstudio:9.5-2.0`

Once the container is running you can point your browser at `https://localhost:8080`, or `http://{IP-ADDR-OF-SERVER}:8080` to access PG Studio.

Use `localhost` for the database host and 5432 as the port. If you havent created any databases then use postgres as the database name. You can run sql from within pgstudio to create other databases as needed. The new admin username is `admin`. Admin's password is set when the container starts and is written to the system log. On the Docker host type `docker logs postgres-pgstudio` to see it.

You don't need to build this image yourself, you can pull a pre-built image from docker hub by typing the following command (not the above run will also pull the images if you don't already have it):
`docker pull yorkshirekev/postgres-pgstuido:9.5-2.0`

https://hub.docker.com/r/yorkshirekev/postgres-pgstudio/

You can also exec into the running contaner starting psql to create databases, password authenticated users etc:

`docker exec -it postgres psql postgres` (where the first postgres in the command is the container name).

Example of connect as a regular user using:
`psql --host=localhost --user=myuser mydatabase`