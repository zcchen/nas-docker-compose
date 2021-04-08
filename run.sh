#!/usr/bin/env bash

CURDIR=$(dirname $(realpath $0))

# ------ Config Parameters ------------
COMPOSE_BIN=$(which docker-compose)
COMPOSE_ARGS=""
source .env
# -------------------------------------

echo_usage()
{
    echo "Usage: $0 [-i <module> | --include <module> | -e <module> | --exclude <module> ] <actions>"
    echo "    $0 is the script to execute the docker compose services."
    echo ""
    echo "Supported <actions>: up | down | config | purge"
    echo "Module means the docker compose folder name at this directory, empty means all"
}

set -eo pipefail

# Phase the configs
MODULES=()
EXCLUDES=()
POSITIONAL=()
ACTION=""
while [[ $# -gt 0 ]]
    do
    key="$1"
    case $key in
        -i | --include)
            MODULES+=("$2")
            if [[ ! -d "${CURDIR}/$2" ]]; then
                echo "Including <${CURDIR}/$2> does NOT exist." >&2
                exit 1
            fi
            shift # past argument
            shift # past value
            ;;
        -e | --exclude)
            EXCLUDES+=("$2")
            if [[ ! -d "${CURDIR}/$2" ]]; then
                echo "Excluding <${CURDIR}/$2> does NOT exist." >&2
                exit 1
            fi
            shift # past argument
            shift # past value
            ;;
        -h | --help)
            echo_usage
            exit
            ;;
        *)    # unknown option
            POSITIONAL+=("$1") # save it in an array for later
            shift # past argument
            ;;
    esac
done

if [[ ${#POSITIONAL[@]} -lt 1 ]]; then
    echo_usage
    exit 2
fi
if [[ ${POSITIONAL[0]} != up &&
      ${POSITIONAL[0]} != down &&
      ${POSITIONAL[0]} != config &&
      ${POSITIONAL[0]} != purge
   ]]; then
    echo_usage
    exit 3
fi
ACTION=${POSITIONAL[@]}

if [[ ${#MODULES[@]} -eq 0 ]]; then
    MODULES+=$(find ./ -maxdepth 1 -type d -iname '[a-zA-Z]*' -exec realpath --relative-to=${CURDIR} "{}" +)
fi
for e in ${EXCLUDES[@]} ; do
    MODULES=("${MODULES[@]/$e}")
done
# ------- End of Phasing -------------

# Handle the docker-compose arguments
COMPOSE_FILES=("${CURDIR}/docker-compose.yml")
for f in ${MODULES[@]} ; do
    _compose_file="${CURDIR}/${f}/docker-compose.yml"
    if [[ -f ${_compose_file} ]]; then
        COMPOSE_FILES+=(${_compose_file})
    fi
done
unset _compose_file

for f in ${COMPOSE_FILES[@]} ; do
    COMPOSE_ARGS+=" -f ${f}"
done
#echo ${COMPOSE_ARGS} >&2
# ------- End of The docker-compose arguments -------

cmd=""

mkdir -p ${DATA_FOLDER}
mkdir -p ${TMP_FOLDER}

for c in ${MODULES[@]} ; do
    _volHandler="${CURDIR}/${c}/volumes-handler.sh"
    if [[ -f ${_volHandler} ]]; then
        source ${_volHandler}
        volumes_prepare
    fi
done

if [[ ${ACTION} == purge ]]; then
    cmd+="${COMPOSE_BIN} ${COMPOSE_ARGS} down && "
    cmd+="docker volume prune"
else
    cmd+="${COMPOSE_BIN} ${COMPOSE_ARGS} ${ACTION}"
fi

echo "$cmd"
$(readlink /proc/$$/exe) -c "$cmd"

if [[ ${ACTION} == purge ]]; then
    for c in ${MODULES[@]} ; do
        _volHandler="${CURDIR}/${c}/volumes-handler.sh"
        if [[ -f ${_volHandler} ]]; then
            source ${_volHandler}
            volumes_purge
        fi
    done
fi
