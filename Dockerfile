FROM ubuntu:14.04
MAINTAINER Frederic Guillot <fred@kanboard.net>

# Setup Apache/PHP
RUN apt-get update && apt-get install -y apache2 php5 php5-gd php5-sqlite unzip wget && apt-get clean \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf && a2enmod rewrite \
    && sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Install Kanboard
RUN cd /tmp \
    && wget --quiet http://kanboard.net/kanboard-latest.zip \
    && unzip -qq kanboard-latest.zip \
    && cp -r kanboard/. /var/www/html \
    && chown -R www-data:www-data /var/www/html/data \
    && rm /var/www/html/index.html

VOLUME /var/www/html/data

EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

CMD /usr/sbin/apache2ctl -D FOREGROUND
