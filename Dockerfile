FROM yorkshirekev/postgres:9.5
MAINTAINER Kevin Ellis

ENV LAST_MODIFIED "2016-11-27 K Ellis"

USER root
RUN apk add --update 'jetty-runner' 'util-linux' && rm -rf /var/cache/apk/*
RUN mkdir /app && cd /app/ && wget http://downloads.postgresqlstudio.org/2.0/pgstudio_2.0.zip && unzip pgstudio_2.0.zip && rm pgstudio_2.0.zip;
COPY bootstrap.sh /app/
RUN chmod +x /app/bootstrap.sh

EXPOSE 5432
EXPOSE 8080

USER postgres

CMD ["/app/bootstrap.sh"]