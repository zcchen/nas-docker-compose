# Usage:
#   source /services/helpers/run_as.sh

RUN_AS_USER=www-data
run_as() {
    if [ "$(id -u)" = 0 ]; then
        su -p ${RUN_AS_USER} -s /bin/sh -c "$1"
    else
        sh -c "$1"
    fi
}
