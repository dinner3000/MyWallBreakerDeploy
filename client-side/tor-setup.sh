#!/bin/sh

#HTTP_PROXY=http://127.0.0.1:8118

SRC_PKG_NAME="tor-0.2.9.9.tar.gz"
#SRC_PKG_URL="https://dist.torproject.org/${SRC_PKG_NAME}"
INS_PATH="/opt/tor"

#wget -v ${SRC_PKG_URL}
tar zxf ${SRC_PKG_NAME}
cd tor-0.2.9.9

./configure --prefix=${INS_PATH} --with-libevent-dir=/usr/local 
make        
make install 

#../reg-service.sh /opt/privoxy/sbin/privoxy /root/breakwall/client-side/privoxy.conf/config 

#firewall-cmd --permanent --add-port=8118/tcp
#firewall-cmd --reload


