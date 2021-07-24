#!/usr/bin/env sh

CERT_KEY_PATH=/acme.sh/cert.key
CERT_PEM_PATH=/acme.sh/cert.pem

if test ! -f ${CERT_KEY_PATH} || test ! -f ${CERT_PEM_PATH}; then
  /bin/sh /usr/local/bin/acme.sh \
    --key-file ${CERT_KEY_PATH} \
    --fullchain-file ${CERT_PEM_PATH} \
    --issue $PARAMS \
    -d $LOCAL_DOMAIN_NAME \
    $@
fi

while test -f ${CERT_KEY_PATH} && test -f ${CERT_PEM_PATH}; do
  /bin/sh /usr/local/bin/acme.sh \
    --key-file ${CERT_KEY_PATH} \
    --fullchain-file ${CERT_PEM_PATH} \
    --cron $PARAMS \
    -d $LOCAL_DOMAIN_NAME \
    $@
  echo "Sleep 1 day then check this loop again."
  sleep $((24 * 3600))
done
