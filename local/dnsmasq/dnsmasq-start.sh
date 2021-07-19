#!/usr/bin/env sh

CMD="watch ls -Alh"
CHECK_FILE=/tmp/abc.txt


RUNNING=1;

main() {
    # very big pid, which is small chance to duplicate
    pid=9999999999999

    while [ ${RUNNING} -ne 0 ]; do
        if [ ! -f ${CHECK_FILE} ]; then
            kill -0 $pid 2>&1 1>/dev/null   # check if $pid is running
            if [ $? -eq 0 ]; then
                echo "pid <$pid> exists, kill it."
                kill $pid   # pid exists, kill it.
            fi
        else
            kill -0 $pid 2>&1 1>/dev/null   # check if $pid is running
            if [ $? -ne 0 ]; then
                echo "command does not start, run it."
                $(echo ${CMD}) &    # $pid not exists, run it.
                pid=$!
                echo "command starts correctly, pid is <$pid>."
            fi
        fi
        sleep 1
    done
}

on_exit() {
    echo "Exiting..."
    RUNNING=0;
}

trap on_exit ERR
main
