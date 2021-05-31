FROM alpine:latest

RUN apk add --no-cache privoxy bash && \
    for i in $(ls /etc/privoxy/*.new -1); do mv $i "$(echo $i | sed 's/\.new//')"; done

ADD ./entry.sh /

ENTRYPOINT [ "/entry.sh" ]
CMD [ "--no-daemon", "/etc/privoxy/config" ]
