FROM ubuntu

#ADD  fs/ /
COPY fs/opt/freeradius.tar.bz2 /opt/
COPY fs/init.sh /

MAINTAINER Francisco Giana <gianafrancisco@gmail.com>

RUN apt-get update && \
	apt-get -y install libmysqlclient18 && \
	cd /opt/ && tar -jxvf freeradius.tar.bz2 && ldconfig && \
	rm -f freeradius.tar.bz2 && \

EXPOSE 1812 1813

ENTRYPOINT /init.sh

