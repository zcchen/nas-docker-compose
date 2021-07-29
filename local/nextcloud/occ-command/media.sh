#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"

# user: media, password: mediaPassword, group media
${occ_cmd} group:add media
OC_PASS=$(cat /run/secrets/nextcloud-media-password) ${occ_cmd} user:add \
        --no-interaction --password-from-env media
${occ_cmd} group:adduser media media
