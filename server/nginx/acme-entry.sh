#!/usr/bin/env sh

/bin/sh /usr/local/bin/acme.sh \
  --force $PARAMS \
  -d $SERVER_DOMAIN_NAME \
  -d $LOCAL_DOMAIN_NAME \
  $@
