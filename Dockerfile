FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget supervisor qemu qemu-system grub linux-generic linux-image-generic linux-headers-generic

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN qemu-img create -f raw /root/binary.img 100M

WORKDIR /root/
ADD novnc /root/novnc/

ENV DISPLAY :0
EXPOSE 8080
CMD ["/usr/bin/supervisord"]
