#!/usr/bin/env sh

occ_cmd="php /var/www/html/occ"
ocs_api_base="http://nextcloud-nginx/ocs/v1.php"
nextcloud_remote_api="http://nextcloud-nginx/remote.php"
users_homedir=/var/www/html/data/

create_users_and_shares()
{
    # parameters handler
    username=$1
    password=$2
    isUserEnable=$3
    groupname=$4
    share_group=$5
    shift 5
    folders="$@"
    # use occ script to prepare the user
    ${occ_cmd} group:add ${groupname}
    OC_PASS=${password} ${occ_cmd} user:add ${username} \
            --no-interaction --password-from-env --group=${groupname}
    ${occ_cmd} user:enable ${username}
    # exit the script first because the user folder is not ready.
    if [ ! -d "${users_homedir}/${username}" ]; then
        exit 1
    fi
    # make folders
    for k in ${folders}; do
        curl -u ${username}:${password} -i -L -X MKCOL \
            ${nextcloud_remote_api}/dav/files/${username}/${k}
        if [ $? -ne 0 ]; then
            exit 1
        fi
        if [ ! -d "${users_homedir}/${username}/files/${k}" ]; then
            exit 1
        else
            # Share the just created folders to the `users` group
            # API ref: https://docs.nextcloud.com/server/latest/developer_manual/client_apis/OCS/ocs-share-api.html#create-a-new-share
            curl -u ${username}:${password} -i -L -H "OCS-APIRequest: true" \
                -X POST ${ocs_api_base}/apps/files_sharing/api/v1/shares \
                -F "path=/${k}" -F "shareType=1" -F "shareWith=${share_group}" \
                -F "permissions=15"
        fi
    done
    # disable the user if needed
    ! ${isUserEnable} && ${occ_cmd} user:disable ${username}
}

create_users_and_shares \
    share $(tr -dc A-Za-z0-9 </dev/urandom | head -c 13) false users users \
    SharePhotos ShareDocuments

create_users_and_shares \
    public $(cat /run/secrets/nextcloud-public-password) true public users \
    Public Downloads Movies Pictures Softwares
