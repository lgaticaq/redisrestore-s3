FROM python:3.6.5-alpine3.6@sha256:d0b3bd956dff1ae26b078598ac0e0f317be813d1071cb9eeb9655989bd2e2464

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV AWS_DEFAULT_REGION=us-east-1

RUN apk add --no-cache pv && pip install --no-cache-dir awscli && mkdir /backup

COPY restore.sh /restore.sh

VOLUME /backup

CMD ["/restore.sh"]
