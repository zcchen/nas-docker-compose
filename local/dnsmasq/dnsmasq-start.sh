#!/usr/bin/env sh

CMD="ping www.baidu.com"
CHECK_FILE=/tmp/abc.txt


RUNNING=1;

is_files_ready() {
    if [ -f ${CHECK_FILE} ]; then
        return 0
    else
        echo "Files are NOT ready, waiting..."
        return 1
    fi
}

main() {
    # very big pid, which is small chance to duplicate
    pid=99999999999999

    while [ ${RUNNING} -ne 0 ]; do
        is_files_ready
        files_are_ready=$?
        if [ ${files_are_ready} -ne 0 ]; then
            kill -0 $pid 1>/dev/null 2>/dev/null   # check if $pid is running
            if [ $? -eq 0 ]; then
                echo "pid <$pid> exists, kill it."
                kill $pid   # pid exists, kill it.
            fi
        else
            kill -0 $pid 1>/dev/null 2>/dev/null   # check if $pid is running
            if [ $? -ne 0 ]; then
                echo "command does not start, run it."
                ${CMD} &    # $pid not exists, run it.
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

trap on_exit 0
trap on_exit 1
trap on_exit 2
trap on_exit 3
trap on_exit 15
main
