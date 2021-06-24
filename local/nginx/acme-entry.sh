#!/usr/bin/env sh

/bin/sh /usr/local/bin/acme.sh \
  --force $PARAMS \
  -d $LOCAL_DOMAIN_NAME \
  $@
