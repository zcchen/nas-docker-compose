#!/usr/bin/env bash

# Please fill this script the occ commands as you want.
# ref: https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/occ_command.html

script_basepath=$(realpath $(dirname ./compose.env))

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

echo "--------------------------------------------------"
echo "+ User ID: <$(id)>"
echo "--------------------------------------------------"

exec_script ./background-jobs.sh
exec_script ./plugins.sh
exec_script ./users.sh

