#!/bin/bash
set -eo pipefail
shopt -s nullglob

# logging functions
docker_entrypoint_log() {
    local type="$1"; shift
    printf '%s [%s] [Entrypoint]: %s\n' "$(date --rfc-3339=seconds)" "$type" "$*"
}
docker_entrypoint_note() {
    docker_entrypoint_log Note "$@"
}
docker_entrypoint_warn() {
    docker_entrypoint_log Warn "$@" >&2
}
docker_entrypoint_error() {
    docker_entrypoint_log ERROR "$@" >&2
    exit 1
}

# usage: file_env VAR [DEFAULT]
#    ie: file_env 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
file_env() {
    local var="$1"
    local fileVar="${var}_FILE"
    local def="${2:-}"
    if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
        docker_entrypoint_error "Both $var and $fileVar are set (but are exclusive)"
    fi
    local val="$def"
    if [ "${!var:-}" ]; then
        val="${!var}"
    elif [ "${!fileVar:-}" ]; then
        val="$(< "${!fileVar}")"
    fi
    export "$var"="$val"
    unset "$fileVar"
}

# Loads various settings that are used elsewhere in the script
docker_setup_env_via_grep_re() {
    if [ -z "$1" ]; then
        docker_entrypoint_warn "no parameter for docker_setup_env_via_grep_re, use empty string."
        local re=""
    else
        local re="$1"
    fi
    if [ -n "$2" ]; then
        docker_entrypoint_error "docker_setup_env_via_grep_re only support 1 parameter..."
    fi
    # get the export environment variables from bash
    local envs=$(export | grep -e "_FILE " | grep -e "$re" | \
                 awk '{print $3}' | awk -F '=' '{print $1}' | sed -e 's:_FILE::g')
    # Initialize values that might be stored in a file
    for e in $envs; do
        file_env $e
    done
}

# Extend the environment variables with "DOCKERGEN_" prefix to support FILE wrapper data,
#   especially for the ones with password encrypted.
#docker_setup_env_via_grep_re "DOCKERGEN_"
docker_setup_env_via_grep_re ""

/usr/local/bin/docker-gen "$@"
