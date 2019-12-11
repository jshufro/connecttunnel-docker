FROM ubuntu:18.04
LABEL maintainer "Jacob Shufro"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update; apt-get install -y linux-image-$(uname -r) kmod net-tools openjdk-8-jdk dante-server

RUN modprobe tun
COPY ConnectTunnel-Linux64.tar ConnectTunnel-Linux64.tar
RUN tar xf ConnectTunnel-Linux64.tar
RUN ./install.sh

VOLUME /dev/net
COPY sockd.conf /etc/danted.conf
COPY startct_wrap.sh startct_wrap.sh

ENTRYPOINT ["/bin/bash", "startct_wrap.sh"]
