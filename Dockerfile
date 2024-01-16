# Use a clean tiny image to store artifacts in
FROM alpine

#RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN set -x \
    && apk update \
    && apk add --no-cache \
        bash \
        git \
        git-lfs \
        jq \
        openssh \
        sed \
        yq

RUN wget https://github.com/norwoodj/helm-docs/releases/download/v1.12.0/helm-docs_1.12.0_Linux_x86_64.tar.gz && \
    tar -xvf helm-docs_1.12.0_Linux_x86_64.tar.gz  && mv helm-docs /usr/local/bin/ &&  chmod +x /usr/local/bin/helm-docs

# Copy all needed files
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []
