#!/usr/bin/env bash
cat plugins.txt | xargs -L 1 docker-compose -f compose.alpine.postgres.rabbitmq.yaml run --rm --entrypoint /var/www/app/cli app plugin:install

