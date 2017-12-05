FROM python:3.6.3-alpine3.6@sha256:2349045d1e5256d58788e794531e9ab29ebf0b2202c068dc76371a4d23d7df20

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
