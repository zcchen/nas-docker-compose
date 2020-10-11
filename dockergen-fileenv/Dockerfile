FROM jwilder/docker-gen

RUN apk add --no-cache bash

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
