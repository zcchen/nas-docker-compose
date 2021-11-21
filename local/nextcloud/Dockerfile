ARG IMAGE_TAG=latest

FROM nextcloud:${IMAGE_TAG}

ARG APT_MIRROR
RUN if [ -n "${APT_MIRROR}" ]; then \
    sed -i /etc/apt/sources.list -e "s#http://\([a-zA-Z0-9]\+\.*\)\{1,\}/#${APT_MIRROR}/#" ;\
    fi

RUN apt update && \
    apt install -y \
        s6 \
        aria2 \
        p7zip p7zip-full \
        ffmpeg \
        python3 python-is-python3 \
    && \
    rm -rf /var/lib/apt/lists/*

ADD services /services
RUN ln -snf "/services/exec.sh" /usr/local/bin/apache2-exec.sh

CMD ["apache2-exec.sh"]
