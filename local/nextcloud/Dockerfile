ARG IMAGE_TAG=latest

FROM nextcloud:${IMAGE_TAG}

ADD services /services
RUN ln -snf "/services/exec.sh" /usr/local/bin/apache2-exec.sh

ARG APT_MIRROR
RUN if [ -n "${APT_MIRROR}" ]; then \
    sed -i /etc/apt/sources.list -e "s#http://\([a-zA-Z0-9]\+\.*\)\{1,\}/#${APT_MIRROR}/#" ;\
    fi

RUN apt update && \
    apt install -y \
        s6 \
    && \
    rm -rf /var/lib/apt/lists/*

CMD ["apache2-exec.sh"]
