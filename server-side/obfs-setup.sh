#!/bin/sh

../obfs-setup.sh /opt/ss-libev
../reg-service.sh /opt/ss-libev/bin/obfs-server /root/proxies-deploy/server-side/obfs-server.json "-v -c"
