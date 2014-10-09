FROM ubuntu:14.04.1
MAINTAINER Bart Teeuwisse <bart@thecodemill.biz>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install m4 automake autoconf make gcc libtool curl python3-yaml

RUN mkdir /pocketmine
RUN cd /pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development

VOLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

CMD ["./start.sh", "--no-wizard", "--enable-rcon=on"]
