FROM ubuntu:16.04

RUN mkdir src
WORKDIR src

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' \
           -e 's/^# deb-src/deb-src/g' /etc/apt/sources.list && \
    apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y devscripts software-properties-common

RUN apt-get source neutron && apt-get build-dep -y neutron
RUN cd neutron-8.4.0 && debuild -uc -us -b
