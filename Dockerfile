FROM ubuntu:1404-163
MAINTAINER qiang <194724379@qq.com>

# Install base packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        gcc \
	autoconf \
        libreadline-dev \
        libpcre3-dev \
	perl \
	libncurses5-dev \
        build-essential \
	libssl-dev  \
	make && \
        rm -rf /var/lib/apt/lists/*

#create data dir
RUN mkdir /data
ADD sammple/ /data

#openresty source
ADD openresty-1.11.2.2.tar.gz /tmp/openresty-1.11.2.2
WORKDIR /tmp/openresty-1.11.2.2/openresty-1.11.2.2

#compile
RUN  pwd
RUN  ./configure --prefix=/usr/local/openresty \
     --with-debug \
     --with-luajit \
     --without-http_redis2_module \
     --with-http_iconv_module && \
#     --with-http_postgres_module && \
     make && make install 
ADD run.sh /run.sh
RUN chmod +x /run.sh
WORKDIR /data
CMD ["/run.sh"]
