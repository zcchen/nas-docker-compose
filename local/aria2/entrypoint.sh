#!/usr/bin/env bash

set -e

file_env() {
  local var="$1"
  local fileVar="${var}_FILE"
  local default=""

  echo "pipelines: <${pipelines}>."

  if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
    echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
    exit 1
  fi
  local val="$default"
  if [ "${!var:-}" ]; then
    val="${!var}"
  elif [ "${!fileVar:-}" ]; then
    val="$(< "${!fileVar}")"
  fi
  export "$var"="$val"
  unset "$fileVar"
}

file_env $@
export "$1"="$(rclone obscure ${$1})"
shift 1
/init $@
