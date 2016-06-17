#!/bin/bash

/certbot $args

if [[ -n $CRONTAB ]]; then
  args="$@"
  echo "${CRON_OPT//\"/} root \
	/opt/certbot/venv/bin/certbot $args >> /var/log/cron.log 2>&1" > /etc/cron.d/certbot
    chmod 0644 /etc/cron.d/certbot
    touch /var/log/cron.log
    cron && tail -f /var/log/cron.log;
fi



