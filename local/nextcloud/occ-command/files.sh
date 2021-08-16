#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"
app_dirpath=/var/www/html/apps

${occ_cmd} app:enable -f files_external

