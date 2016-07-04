FROM fguillot/alpine-nginx-php7

RUN cd /var/www \
    && curl -sLO https://kanboard.net/kanboard-latest.zip \
    && unzip -qq kanboard-latest.zip \
    && rm -f *.zip \
    && rm -rf app \
    && mv /var/www/kanboard /var/www/app \
    && chown -R nginx:nginx /var/www/app/data \
    && chown -R nginx:nginx /var/www/app/plugins

COPY files/kanboard/config.php /var/www/app/config.php
COPY files/crontab/cronjob.alpine /var/spool/cron/crontabs/nginx
COPY files/services.d/cron /etc/services.d/cron

VOLUME /var/www/app/data
VOLUME /var/www/app/plugins
