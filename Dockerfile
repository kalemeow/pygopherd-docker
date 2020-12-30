FROM ubuntu:20.04

MAINTAINER kalemeow <kizzale@gmail.com>

RUN apt-get update && apt install -y python curl logrotate patch
RUN curl -L -o ./python-simpletal.deb http://mirrors.kernel.org/ubuntu/pool/universe/s/simpletal/python-simpletal_4.1-9_all.deb && dpkg -i ./python-simpletal.deb
RUN curl -L -o pygopherd.deb http://mirrors.kernel.org/ubuntu/pool/universe/p/pygopherd/pygopherd_2.0.18.5_all.deb && dpkg -i pygopherd.deb
ADD conf/pygopherd.conf /etc/pygopherd/pygopherd.conf

EXPOSE 70

RUN curl -O https://github.com/jgoerzen/pygopherd/commit/50c01600afbb99be1f6aba63ae3a007404a0bbc4.patch && patch /usr/lib/python2.7/dist-packages/pygopherd/handlers/UMN.py 50c01600afbb99be1f6aba63ae3a007404a0bbc4.patch
RUN curl -O https://github.com/jgoerzen/pygopherd/commit/926b185da25c0f303c90dc2cf78f3d24bef9f7a6.patch && patch /usr/lib/python2.7/dist-packages/pygopherd/handlers/gophermap.py 926b185da25c0f303c90dc2cf78f3d24bef9f7a6.patch

CMD pygopherd
