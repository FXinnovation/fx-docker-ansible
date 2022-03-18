FROM "python:3.8-alpine3.12"

ENV ANSIBLE_VERSION=2.9.12
ENV ANSIBLELINT_VERSION=4.2.0
ENV RUAMELYAML_VERSION=0.16.10
ENV BOTOCORE_VERSION=1.17.23
ENV BOTO3_VERSION=1.14.23

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="ansible" \
      "org.label-schema.base-image.name"="docker.io/library/python" \
      "org.label-schema.base-image.version"="3.8-alpine3.12" \
      "org.label-schema.description"="Ansible (and ansible-lint) in a container" \
      "org.label-schema.url"="https://github.com/ansible/ansible" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-ansible" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0" \
      "org.label-schema.applications.ansiblelint.version"="$ANSIBLELINT_VERSION" \
      "org.label-schema.applications.ansible.version"="$ANSIBLE_VERSION" \
      "org.label-schema.vcs-ref"="$VCS_REF" \
      "org.label-schema.version"="$VERSION" \
      "org.label-schema.build-date"="$BUILD_DATE" \
      "org.label-schema.usage"="docker run --rm -v $(pwd):/data fxinnovation/ansible -p /data"

CMD [ "--help" ]
