FROM "python:3.7-alpine"
MAINTAINER "Julien Cabillot <julien@sdv.fr>"

RUN apk --no-cache add --virtual build-dependencies \
        build-base libffi-dev libressl-dev && \
    pip install --no-cache-dir ansible-lint ansible-lint-junit && \
    apk del build-dependencies