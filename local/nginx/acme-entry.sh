#!/usr/bin/env sh

CERT_KEY_PATH=/acme.sh/cert.key
CERT_PEM_PATH=/acme.sh/cert.pem

if [ ! -f ${CERT_KEY_PATH} || ! -f ${CERT_PEM_PATH} ]; then
  /bin/sh /usr/local/bin/acme.sh \
    --key-file ${CERT_KEY_PATH} \
    --fullchain-file ${CERT_PEM_PATH} \
    --issue $PARAMS \
    -d $LOCAL_DOMAIN_NAME \
    $@
fi

if [ -f ${CERT_KEY_PATH} && -f ${CERT_PEM_PATH} ]; then
  /bin/sh /usr/local/bin/acme.sh \
    --key-file ${CERT_KEY_PATH} \
    --fullchain-file ${CERT_PEM_PATH} \
    --cron $PARAMS \
    -d $LOCAL_DOMAIN_NAME \
    $@
fi
