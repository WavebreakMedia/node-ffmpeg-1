FROM jrottenberg/ffmpeg:4.3-ubuntu2004

MAINTAINER ahmet@cetin.info

ENV         LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64

RUN     apt-get -yqq update && \
        apt-get install -yq --no-install-recommends curl && \
        apt-get autoremove -y && \
        apt-get clean -y

ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/
