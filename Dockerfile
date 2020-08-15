FROM ubuntu:19.10

MAINTAINER kalemeow <kizzale@gmail.com>

RUN apt-get update && apt-get install -y pygopherd

ADD conf/pygopherd.conf /etc/pygopherd/pygopherd.conf

EXPOSE 70

CMD pygopherd
