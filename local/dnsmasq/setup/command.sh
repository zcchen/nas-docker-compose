#!/bin/bash

UPDATE_INTERVAL="${UPDATE_INTERVAL:-$((3600 * 24))}"
WORK_DIR="${WORK_DIR:-/tmp}"
SHELL_DIR="${SHELL_DIR:-/tmp}"

READY_FILE="${WORK_DIR}/ready.txt"
UPDATED_FILE="${WORK_DIR}/updated.lock"

if [[ -f "${READY_FILE}" ]]; then
    rm ${READY_FILE}
fi

echo ">>> $0 variables:"
echo "    Update interval time: <${UPDATE_INTERVAL}> seconds."
echo "    WORK_DIR: <${WORK_DIR}>, with files:"
echo "$(ls -Alh ${WORK_DIR})"
echo "    SHELL_DIR: <${SHELL_DIR}>, with files:"
echo "$(ls -Alh ${SHELL_DIR})"


last_update_time=0
# get the last updated time
get_last_update_time()
{
    if [ -f "${READY_FILE}" ]; then
        last_update_time=$(cat ${READY_FILE})
    else
        last_update_time=0
    fi
}

# set this updated time as last updated time
set_last_update_time()
{
    date +%s > ${READY_FILE}
}


# do the update actions
update_actions()
{
    local last_ret=0  # to see the return code from each script
    echo ">>> Try to do the update actions..."
    echo "================================================="
    for script in $(find "${SHELL_DIR}" -iname "*.sh") ; do
        echo ">>> update action: <${script}>"
        echo "-------------------------------------------------"
        bash ${script}
        last_ret=$?
        echo "================================================="
        if [[ ${last_ret} -ne 0 ]]; then
            echo "+++ FAILED to update with script <${script}>." 1>&2
            return 1
        fi
    done
    echo "--- SUCCEED with all update actions."
    set_last_update_time
    touch ${UPDATED_FILE}
    return 0
}


loop_flag=1
# Handle the exit related signals
exit_handler()
{
    echo ""
    echo ">>> exiting ..."
    loop_flag=0
}


# ---------- main function ------------
# trap the stop signals
for sig in INT QUIT HUP TERM STOP; do
    trap exit_handler "$sig"
done

ret=0
while [[ ${loop_flag} -ne 0 ]]; do
    get_last_update_time
    if [[ $(( $(date +%s) - ${UPDATE_INTERVAL} - ${last_update_time} )) -gt 0 ]]; then
        update_actions
        ret=$?
        if [[ ${ret} -ne 0 ]]; then
            exit_handler
            break
        fi
    fi
    sleep 1
done
if [[ ${ret} -ne 0  ]]; then
    exit ${ret}
fi
