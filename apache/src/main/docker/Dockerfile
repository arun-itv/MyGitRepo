ARG BASEIMAGE
ARG BASEIMAGEVERSION
FROM ${BASEIMAGE:-baseImageDockerhub}:${BASEIMAGEVERSION:-baseImageVersion}
#ARG ENVIRONMENT
ARG SERVERROOT="\/usr\/local\/apache2"
ARG DOCUMENTROOT="\/usr\/local\/apache2\/htdocs"
ARG HTTPDUSER=apache
#ARG HTTPPORT=80
ARG HTTPSPORT=8080
ARG HEALTHCHECKPORT=8081
ARG HTTPD_INSTANCE_LOCATION=/usr/local/apache2
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
ENV ENVIRONMENT ""
ENV HTTPSPORT ${HTTPSPORT}
ENV HEALTHCHECKPORT ${HEALTHCHECKPORT}
ENV SERVERNAME ""
COPY ./apache_configs/ ${HTTPD_INSTANCE_LOCATION}/apache_configs
RUN mkdir -p ${HTTPD_INSTANCE_LOCATION}/abc/def/xyz
#RUN ls -laR ${HTTPD_INSTANCE_LOCATION}/htdocs/*
RUN chown -R ${HTTPDUSER}:${HTTPDUSER} ${HTTPD_INSTANCE_LOCATION}
RUN chmod 755 -R ${HTTPD_INSTANCE_LOCATION}
WORKDIR ${HTTPD_INSTANCE_LOCATION}
#override base image's ENTRYPOINT
COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["httpd-foreground"]