FROM alpine:3.6

RUN apk add --no-cache bash ca-certificates py-pip && pip install s3cmd
ADD s3cfg.conf /root/.s3cfg

CMD ["s3cmd"]