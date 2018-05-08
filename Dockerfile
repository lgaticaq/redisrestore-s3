FROM python:3.6.3-alpine3.6@sha256:c0f0e73f7ddc0b341ab6680abbe5b2c0c8b57cfcf31ceee79f57faa98d0629f3

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
