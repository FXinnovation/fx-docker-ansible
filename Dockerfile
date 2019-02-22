FROM "python:3.7-alpine"
LABEL maintainer="Julien Cabillot <dockerimages@cabillot.eu>"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

RUN apk --no-cache add --virtual build-dependencies \
        build-base libffi-dev libressl-dev && \
    pip install --no-cache-dir ansible-lint ansible-lint-junit && \
    apk del build-dependencies

LABEL "maintainer"="dockerimages@cabillot.eu" \
      "org.label-schema.name"="ansible-lint" \
      "org.label-schema.base-image.name"="docker.io/library/python" \
      "org.label-schema.base-image.version"="3.7-alpine" \
      "org.label-schema.description"="Ansible-lint in a container" \
      "org.label-schema.url"="https://github.com/ansible/ansible-lint" \
      "org.label-schema.vcs-url"="https://gitlab.cabillot.eu/jcabillot/ansible-lint/" \
      "org.label-schema.vendor"="Julien Cabillot" \
      "org.label-schema.schema-version"="1.0" \
      "org.label-schema.applications.ansiblelint.version"="latest" \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm -v $(pwd):/data registry.cabillot.eu/jcabillot/ansible-lint -p ."