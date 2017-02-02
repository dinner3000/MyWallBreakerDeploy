#!/bin/sh

SRC_PKG="https://www.privoxy.org/sf-download-mirror/Sources/3.0.26%20%28stable%29/privoxy-3.0.26-stable-src.tar.gz"
INS_PATH="/opt/privoxy"

wget ${SRC_PKG}
tar zxf privoxy-3.0.26-stable-src.tar.gz
cd privoxy-3.0.26-stable

autoheader
autoconf

adduser privoxy -g privoxy
./configure --prefix=${INS_PATH} USER=privoxy GROUP=privoxy # (--help to see options)
make             # (the make from GNU, sometimes called gmake)
make -n install  # (to see where all the files will go)
make -s install USER=privoxy GROUP=privoxy  # (to really install, -s to silence output)

#../reg-service.sh /opt/privoxy/sbin/privoxy /root/breakwall/client-side/privoxy.conf/config 

#firewall-cmd --permanent --add-port=8118/tcp
#firewall-cmd --reload


