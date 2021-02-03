FROM python:3.6.3-alpine3.6@sha256:f07076e35460fdd9b431e7b18d04c0f39927c42f22e793f72787ee6e6977757c

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
