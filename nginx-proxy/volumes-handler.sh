#!/usr/bin/env bash

CURDIR=$(dirname $(realpath $BASH_SOURCE))
MODULE_NAME=$(basename ${CURDIR})

function volumes_prepare()
{
    mkdir -p ${TMP_FOLDER}/${MODULE_NAME}/nginx-conf.d
}

function volumes_purge()
{
    rm -rf ${TMP_FOLDER}/${MODULE_NAME}/nginx-conf.d
}
