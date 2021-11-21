#!/usr/bin/env bash

# Please fill this script the occ commands as you want.
# ref: https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/occ_command.html

script_basepath=$(realpath $(dirname $0))

exec_script()
{
    filename=$1
    if [ ! -f "${script_basepath}/${filename}" ]; then
        echo "File NOT found. \"${script_basepath}/${filename}\"" > /dev/stderr
    else
        echo "Executing script \"${script_basepath}/${filename}\"..."
        sh "${script_basepath}/${filename}"
    fi
}

sleep 10        # sleep 10 seconds before executing

echo "--------------------------------------------------"
echo "+ User ID: <$(id)>"
echo "--------------------------------------------------"

exec_script ./occ-command/background-jobs.sh
exec_script ./occ-command/groups.sh
exec_script ./occ-command/files.sh
exec_script ./occ-command/plugins.sh
exec_script ./occ-command/user-public.sh

#exec_script ./users.sh

