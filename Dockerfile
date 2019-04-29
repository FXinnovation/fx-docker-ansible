FROM "python:3.7-alpine3.9"

ENV ANSIBLE_VERSION=2.7.10
ENV ANSIBLELINT_VERSION=4.1.0

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="ansible" \
      "org.label-schema.base-image.name"="docker.io/library/python" \
      "org.label-schema.base-image.version"="3.7-alpine3.9" \
      "org.label-schema.description"="Ansible (and ansible-lint) in a container" \
      "org.label-schema.url"="https://github.com/ansible/ansible" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-ansible" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0" \
      "org.label-schema.applications.ansiblelint.version"="$ANSIBLELINT_VERSION" \
      "org.label-schema.applications.ansible.version"="$ANSIBLE_VERSION" \
      "org.label-schema.vcs-ref"="$VCS_REF" \
      "org.label-schema.version"="$VERSION" \
      "org.label-schema.build-date"="$BUILD_DATE" \
      "org.label-schema.usage"="docker run --rm -v $(pwd):/data fxinnovation/ansible -p /data"

CMD [ "--help" ]
