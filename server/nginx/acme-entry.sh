#!/usr/bin/env sh

# use grep to find out the upper-level domain, if one domain is nested by the others
# e.g.:
#    server.nas & nas   --> nas
#    server.nas & a.nas --> server.nas & a.nas
#
# NO direct wildcard domain is suggested because how to use the another sub-domains is unknown.
SSL_DOMAINS="$(echo ${SERVER_DOMAIN_NAME} | grep -v [a-z]*.${LOCAL_DOMAIN_NAME}) $(echo ${LOCAL_DOMAIN_NAME} | grep -v [a-z]*.${SERVER_DOMAIN_NAME})"

SSL_DOMAINS_PARAM=""
for n in ${SSL_DOMAINS}; do
    SSL_DOMAINS_PARAM="$SSL_DOMAINS_PARAM -d $n"
done

/bin/sh /usr/local/bin/acme.sh \
  --force $PARAMS \
  $SSL_DOMAINS_PARAM \
  $@
