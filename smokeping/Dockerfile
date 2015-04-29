FROM ubuntu:trusty
MAINTAINER Jeoygin Wang <jeoygin@gmail.com>

RUN apt-get update && \
    apt-get install -y install smokeping sendmail && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /etc/smokeping/apache2.conf /etc/apache2/conf-available/smokeping.conf && \
    a2enconf smokeping && \
    a2enmod cgid

ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE $APACHE_RUN_DIR/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2

COPY smokeping.sh /usr/bin/

VOLUME ["/etc/smokeping", "/etc/ssmtp", "/var/lib/smokeping"]

EXPOSE 80

ENTRYPOINT ["smokeping.sh"]

