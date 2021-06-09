FROM alpine

RUN apk --no-cache add \
        git make bash wget

ADD ./cmd.sh /cmd.sh
RUN chmod +x /cmd.sh

VOLUME /etc/dnsmasq.d/

CMD [ "sh", "/cmd.sh" ]
