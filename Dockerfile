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

RUN wget https://imagemagick.org/archive/ImageMagick.tar.xz
RUN tar -axvf ImageMagick.tar.xz
WORKDIR /ImageMagick
RUN ls
RUN ./configure --with-modules
RUN make install
RUN ldconfig /usr/local/lib
WORKDIR /

RUN wget ftp://ftp.icm.edu.pl/pub/unix/graphics/GraphicsMagick/GraphicsMagick-LATEST.tar.gz
RUN tar xzvf GraphicsMagick-LATEST.tar.gz
WORKDIR /GraphicsMagick-LATEST
RUN ./configure
RUN make install
RUN ls
WORKDIR /
