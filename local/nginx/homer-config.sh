#!/usr/bin/env bash

set -u            # ignore the unset variable, then exit
set -eo pipefail  # exit this script when last command fails or pipeline fails.
set -x            # debug echo

CONFIG_SRC=$1
CONFIG_DEST=$2

rm -rf ${CONFIG_DEST}/*
cp -r ${CONFIG_SRC}/* ${CONFIG_DEST}/

find ${CONFIG_DEST} -type f -name "*.yml" -print0 | xargs -0 sed -i \
  -e "s:{{LOCAL_DOMAIN_NAME}}:${LOCAL_DOMAIN_NAME}:g" \
  # append the `sed` script here
