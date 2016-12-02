docker run -d \
-p 5432:5432 -p 8080:8080 \
--name postgresql-pgstudio \
--log-opt max-size=100k --log-opt max-file=10 \
--memory=512M \
--restart=always \
yorkshirekev/postgres-pgstudio:9.5-2.0
