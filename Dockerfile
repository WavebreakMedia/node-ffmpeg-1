FROM node:16-bullseye

RUN apt-get update && apt-get install -yq --no-install-recommends \
        build-essential \
        curl \
        expat \
        autoconf \
        bash \
        libkrb5-dev \
        libcairo2-dev \
        git \
        libgconf-2-4 \
        apt-transport-https \
        wget \
        gnupg \
        ffmpeg \
        webp

# Download and extract ImageMagick to a fixed directory name
RUN wget https://imagemagick.org/archive/ImageMagick.tar.xz && \
    mkdir ImageMagick && \
    tar --strip-components=1 -C ImageMagick -axvf ImageMagick.tar.xz && \
    rm ImageMagick.tar.xz

WORKDIR /ImageMagick
RUN ./configure --with-modules && \
    make install && \
    ldconfig /usr/local/lib
WORKDIR /

# Download and extract GraphicsMagick to a fixed directory name
RUN wget ftp://ftp.icm.edu.pl/pub/unix/graphics/GraphicsMagick/GraphicsMagick-LATEST.tar.gz && \
    mkdir GraphicsMagick && \
    tar --strip-components=1 -C GraphicsMagick -xzvf GraphicsMagick-LATEST.tar.gz && \
    rm GraphicsMagick-LATEST.tar.gz

WORKDIR /GraphicsMagick
RUN ./configure && \
    make install
WORKDIR /
