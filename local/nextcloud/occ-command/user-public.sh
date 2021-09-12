#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"
ocs_api_base="http://nextcloud-nginx/ocs/v1.php"
nextcloud_remote_api="http://nextcloud-nginx/remote.php"
users_homedir=/var/www/html/data/

create_user()
{
    username=$1
    password=$2
    groupname=$3
    isUserEnable=$4
    if [ -z "$(${occ_cmd} user:list | grep ${username}:)" ]; then
      ${occ_cmd} group:add ${groupname}
      OC_PASS=${password} ${occ_cmd} user:add ${username} \
              --no-interaction --password-from-env --group=${groupname}
      ${occ_cmd} user:enable ${username}
    fi
    #! ${isUserEnable} && ${occ_cmd} user:disable ${username}
}

create_user public $(cat /run/secrets/nextcloud-public-password) users true
