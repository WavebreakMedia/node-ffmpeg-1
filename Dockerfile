FROM node:16-bullseye

RUN apt-get update && apt-get install -yq --no-install-recommends \
        build-essential \
        curl \
        expat \
        autoconf \
        bash \
        libkrb5-dev \
        graphicsmagick \
        libcairo2-dev \
        imagemagick \
        git \
        libgconf-2-4 \
        apt-transport-https \
        wget \
        gnupg \
        ffmpeg
