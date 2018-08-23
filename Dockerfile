FROM python:3.6.6-alpine3.6@sha256:2b949b5454f4110a6400f8c6c7df1ee3e94d125e3ff8fefd0d5ece25504d94d0

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
