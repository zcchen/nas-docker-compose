ARG IMAGE_TAG=latest

FROM nextcloud:${IMAGE_TAG}
ADD services /services

RUN apt update && \
    apt install -y \
        s6 \
    && \
    rm -rf /var/lib/apt/lists/*

CMD ["/services/exec.sh"]
