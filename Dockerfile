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

RUN wget https://imagemagick.org/archive/ImageMagick-7.1.0-57.tar.xz
RUN tar -axvf ImageMagick-7.1.0-57.tar.xz
WORKDIR /ImageMagick-7.1.0-57
RUN ls
RUN ./configure --with-modules
RUN make install
RUN ldconfig /usr/local/lib
WORKDIR /

RUN wget ftp://ftp.icm.edu.pl/pub/unix/graphics/GraphicsMagick/1.3/GraphicsMagick-1.3.36.tar.gz
RUN tar xzvf GraphicsMagick-1.3.36.tar.gz
WORKDIR /GraphicsMagick-1.3.36
RUN ./configure
RUN make install
RUN ls
WORKDIR /
