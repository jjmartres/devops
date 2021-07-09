FROM python:3.8.6-slim

WORKDIR /devpi

EXPOSE 80

# Set default server root
ENV DEVPI_SERVER_ROOT=/devpi

COPY requirements.txt .
COPY devpi-client.sh /usr/local/bin/
COPY devpi-server.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/devpi-* \
    && pip install \
        --no-cache-dir \
        -r requirements.txt

ENTRYPOINT [ "/bin/bash", "/usr/local/bin/devpi-server.sh" ]

#------ image identification ------
ARG GIT_REF_NAME
ENV GIT_REF_NAME ${GIT_REF_NAME}

ARG BUILD_TIMESTAMP
ENV BUILD_TIMESTAMP ${BUILD_TIMESTAMP}

ARG MAINTAINER
ENV MAINTAINER ${MAINTAINER}

ARG CI_PROJECT_URL
ENV CI_PROJECT_URL ${CI_PROJECT_URL}

ARG DOCKER_REPOSITORY
ENV DOCKER_REPOSITORY ${DOCKER_REPOSITORY}

LABEL maintainer=$MAINTAINER
LABEL org.label-schema.schema-version="2.0"
LABEL org.label-schema.build-date=$BUILD_TIMESTAMP
LABEL org.label-schema.name="zorglub/devpi"
LABEL org.label-schema.description="devpi: PyPI server and packaging/testing/release tool"
LABEL org.label-schema.url="https://devpi.net"
LABEL org.label-schema.vcs-url=$CI_PROJECT_URL
LABEL org.label-schema.vcs-ref=$GIT_COMMIT_ID
LABEL org.label-schema.vendor="zorglub"
LABEL org.label-schema.version=$GIT_REF_NAME
LABEL org.label-schema.docker.cmd="docker run --name=devpi -d -l zorglub -l role=devpi $DOCKER_REPOSITORY/devpi"