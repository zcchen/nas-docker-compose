#!/bin/bash
set -eo pipefail
shopt -s nullglob

LISTEN_ADDRESS_IPV4="${LISTEN_ADDRESS_IPV4:-127.0.0.1}"
LISTEN_ADDRESS_IPV6="${LISTEN_ADDRESS_IPV6:-[::1]}"
LISTEN_PORT="${LISTEN_PORT:-8118}"
TARGET_PATTERN="${TARGET_PATTERN:-/}"
HTTP_PARENT="${HTTP_PARENT:-.}"
SOCKS_PROXY="${SOCKS_PROXY:-}"
SOCKS_METHOD="${SOCKS_METHOD:-}"

if [ -n "${EXTRA_CONFIG_FILE}" ]; then
    EXTRA_CONFIG_FILE="$(< "${!EXTRA_CONFIG_FILE}")"
fi

# cat the basic part of the config file
cat << EOF > /etc/privoxy/config
user-manual /usr/share/doc/privoxy/user-manual
confdir /etc/privoxy
logdir /var/log/privoxy
actionsfile match-all.action # Actions that are applied to all sites and maybe overruled later on.
actionsfile default.action   # Main actions file
actionsfile user.action      # User customizations
filterfile default.filter
filterfile user.filter      # User customizations
logfile logfile
toggle  1
enable-remote-toggle  0
enable-remote-http-toggle  0
enable-edit-actions 0
enforce-blocks 0
buffer-limit 4096
enable-proxy-authentication-forwarding 0
forwarded-connect-retries  0
accept-intercepted-requests 0
allow-cgi-request-crunching 0
split-large-forms 0
keep-alive-timeout 5
tolerate-pipelining 1
socket-timeout 300
listen-address  ${LISTEN_ADDRESS_IPV4}:${LISTEN_PORT}
listen-address  ${LISTEN_ADDRESS_IPV6}:${LISTEN_PORT}
EOF

# cat the FORWARDING part of the config file
if [[ -n "${SOCKS_PROXY}" && -n "${SOCKS_METHOD}" ]]; then
cat << EOF >> /etc/privoxy/config
forward-${SOCKS_METHOD} ${TARGET_PATTERN} ${SOCKS_PROXY} ${HTTP_PARENT}
EOF
else
cat << EOF >> /etc/privoxy/config
forward ${TARGET_PATTERN} ${HTTP_PARENT}
EOF
fi

# cat the final part of the config file
cat << EOF >> /etc/privoxy/config
${EXTRA_CONFIG_FILE}
EOF

privoxy $@
