FROM python:3.6.8-alpine3.6@sha256:f55ac39dc18361d27147b433e01877e076e5de131e30a9d0c2aa0f92e250c748

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
