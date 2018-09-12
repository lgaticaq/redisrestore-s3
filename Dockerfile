FROM python:3.6.6-alpine3.6@sha256:25c1ea20c660724cf3c0a5a7b94d54c94f0749c8c996d4122f891110689f5757

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
