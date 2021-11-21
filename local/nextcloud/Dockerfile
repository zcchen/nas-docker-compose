ARG IMAGE_TAG=latest

FROM nextcloud:${IMAGE_TAG}
ADD services /services

ARG APT_MIRROR
RUN if [ -n "${APT_MIRROR}" ]; then \
    sed -i /etc/apt/sources.list -e "s#http://\([a-zA-Z0-9]\+\.*\)\{1,\}/#${APT_MIRROR}/#" ;\
    fi

RUN apt update && \
    apt install -y \
        s6 \
    && \
    rm -rf /var/lib/apt/lists/*

# re-use the upstream entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/services/exec.sh"]
