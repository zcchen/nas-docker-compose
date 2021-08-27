#!/usr/bin/env sh

LOCAL_IP_ADDR=${LOCAL_IP_ADDR:-}
SERVER_IP_ADDR=${SERVER_IP_ADDR:-}

LOCAL_DOMAIN_NAME=${LOCAL_DOMAIN_NAME:-}
SERVER_DOMAIN_NAME=${SERVER_DOMAIN_NAME:-}

echo ">>> $0 variables:"
echo "    LOCAL_IP_ADDR: ${LOCAL_IP_ADDR}"
echo "    LOCAL_DOMAIN_NAME: ${LOCAL_DOMAIN_NAME}"
echo "    SERVER_IP_ADDR: ${SERVER_IP_ADDR}"
echo "    SERVER_DOMAIN_NAME: ${SERVER_DOMAIN_NAME}"

if [[ -z "${LOCAL_IP_ADDR}" ]]; then
    echo "LOCAL_IP_ADDR is empty or undefined."
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


cat > /etc/dnsmasq.d/domain-ip.conf << EOF
address=/.${LOCAL_DOMAIN_NAME}/${LOCAL_IP_ADDR}
EOF

if [[ -n "${SERVER_IP_ADDR}" ]]; then
cat >> /etc/dnsmasq.d/domain-ip.conf << EOF
address=/.${SERVER_DOMAIN_NAME}/${SERVER_IP_ADDR}
EOF
else
cat >> /etc/dnsmasq.d/domain-ip.conf << EOF
server=/.${SERVER_DOMAIN_NAME}/8.8.8.8
EOF
fi
