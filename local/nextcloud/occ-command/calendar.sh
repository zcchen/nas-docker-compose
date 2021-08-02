#!/usr/bin/env sh

calendar_ver="2.3.1"

occ_cmd="php /var/www/html/occ"
app_dirpath=/var/www/html/custom_apps

curl -o ./calendar.tar.gz \
  "https://github.com/nextcloud-releases/calendar/releases/download/v${calendar_ver}/calendar.tar.gz"
tar -C ${app_dirpath} -xzvf ./calendar.tar.gz

rm -rf calendar.tar.gz
${occ_cmd} app:install calendar
