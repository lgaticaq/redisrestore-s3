FROM python:3.6.3-alpine3.6@sha256:aba3798848cd840e9d06f04e1dca81c82677e72e69ad9b2240a46c6754e56eab

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
