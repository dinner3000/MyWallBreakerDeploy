#!/bin/sh

../obfs-setup.sh /opt/ss-libev
../reg-service.sh obfs-server /opt/ss-libev/bin/obfs-server /root/proxies-deploy/server-side/obfs-server.json "-v -c"
