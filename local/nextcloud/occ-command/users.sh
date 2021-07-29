#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"

public_username=public

# user: public, password: publicPassword, group public
${occ_cmd} group:add ${public_username}
OC_PASS=$(cat /run/secrets/nextcloud-public-password) ${occ_cmd} user:add ${public_username} \
        --no-interaction --password-from-env --group="${public_username}"
${occ_cmd} user:enable ${public_username}

# wait the public user first login and activate the folder
if [ ! -f /var/www/html/data/${public_username} ]; then
    echo "${public_username} have NOT login to create"
    exit 1
fi

# FIXME: have issues here
if [ -f /var/www/html/data/${public_username} ]; then
    # Create the folders for public user
    public_basedir=/var/www/html/data/${public_username}/files/
    mkdir -p ${public_basedir}/Downloads
    mkdir -p ${public_basedir}/Movies
    mkdir -p ${public_basedir}/Pictures
    mkdir -p ${public_basedir}/Softwares
    mkdir -p ${public_basedir}/Public

    # Scan the files and update it for file caches
    ${occ_cmd} files:scan --unscanned public
fi
