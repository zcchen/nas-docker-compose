#!/usr/bin/env sh

SERVER_IP_ADDR=${SERVER_IP_ADDR:-}

LOCAL_DOMAIN_NAME=${LOCAL_DOMAIN_NAME:-}
SERVER_DOMAIN_NAME=${SERVER_DOMAIN_NAME:-}

echo ">>> $0 variables:"
echo "    LOCAL_DOMAIN_NAME: ${LOCAL_DOMAIN_NAME}"
echo "    SERVER_IP_ADDR: ${SERVER_IP_ADDR}"
echo "    SERVER_DOMAIN_NAME: ${SERVER_DOMAIN_NAME}"

if [[ -z "${SERVER_IP_ADDR}" ]]; then
    echo "SERVER_DOMAIN_NAME is empty or undefined."
    exit 1
fi

if [[ -z "${LOCAL_DOMAIN_NAME}" ]]; then
    echo "LOCAL_DOMAIN_NAME is empty or undefined."
    exit 1
fi

if [[ -z "${SERVER_DOMAIN_NAME}" ]]; then
    echo "SERVER_DOMAIN_NAME is empty or undefined."
    exit 1
fi

cat > /mnt/domain-ip.conf << EOF
address=/.${SERVER_DOMAIN_NAME}/${SERVER_IP_ADDR}
address=/.${LOCAL_DOMAIN_NAME}/${SERVER_IP_ADDR}

EOF

