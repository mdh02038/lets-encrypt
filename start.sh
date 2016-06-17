#!/bin/bash

/opt/certbot/venv/bin/certbot $@

if [[ -n $CRONTAB ]]; then
  echo "${CRON_OPT//\"/} root \
	/opt/certbot/venv/bin/certbot $@ >> /var/log/cron.log 2>&1" > /etc/cron.d/certbot
    chmod 0644 /etc/cron.d/certbot
    touch /var/log/cron.log
    cron && tail -f /var/log/cron.log;
fi



