#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"

public_username=public
public_password=$(cat /run/secrets/nextcloud-public-password)
public_homedir=/var/www/html/data/${public_username}

# user: public, password: publicPassword, group public
${occ_cmd} group:add ${public_username}
OC_PASS=${public_password} ${occ_cmd} user:add ${public_username} \
        --no-interaction --password-from-env --group="${public_username}"
${occ_cmd} user:enable ${public_username}

if [ ! -d "${public_homedir}" ]; then
    exit 1
fi

# make folders
for k in "Public" "Downloads" "Movies" "Pictures" "Softwares"; do
    curl -u ${public_username}:${public_password} -i -L -X MKCOL \
        http://nextcloud-nginx/remote.php/dav/files/${public_username}/${k}
    if [ $? -ne 0 ]; then
        exit 1
    fi
    if [ ! -d "${public_homedir}/files/${k}" ]; then
        exit 1
    fi
done
