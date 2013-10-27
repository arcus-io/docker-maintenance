FROM ubuntu:12.04
MAINTAINER Arcus "http://arcus.io"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y nginx-full
ADD . /usr/share/nginx/www
ADD nginx.conf /etc/nginx/nginx.conf
ADD run.sh /usr/local/bin/run

EXPOSE 80
CMD ["/usr/local/bin/run"]
