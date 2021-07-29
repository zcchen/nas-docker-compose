#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"

# Another docker containers to run the /cron.sh script
${occ_cmd} background:cron
