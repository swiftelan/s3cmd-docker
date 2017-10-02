FROM alpine:3.6

RUN apk add --no-cache curl tar bash python py-pip py-setuptools && pip install python-dateutil

ARG S3CMD_VERSION=2.0.0
ARG USER_HOME_DIR="/root"

RUN mkdir -p /usr/share/s3cmd /usr/share/s3cmd/ref \
  && curl -fsSL -o /tmp/s3cmd.tar.gz https://github.com/s3tools/s3cmd/releases/download/v${S3CMD_VERSION}/s3cmd-${S3CMD_VERSION}.tar.gz \
  && tar -xzf /tmp/s3cmd.tar.gz -C /usr/share/s3cmd --strip-components=1 \
  && rm -f /tmp/s3cmd.tar.gz \
  && ln -s /usr/share/s3cmd/s3cmd /usr/bin/s3cmd

ENV S3CMD_CONFIG "$USER_HOME_DIR/.s3cfg"

VOLUME [ "${USER_HOME_DIR}" ]

CMD ["s3cmd"]