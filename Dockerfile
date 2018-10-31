FROM jrottenberg/ffmpeg AS base
MAINTAINER ahmet@cetin.info

RUN apt-get install --yes curl

FROM        base AS build

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]

# Let's make sure the app built correctly
# Convenient to verify on https://hub.docker.com/r/jrottenberg/ffmpeg/builds/ console output
