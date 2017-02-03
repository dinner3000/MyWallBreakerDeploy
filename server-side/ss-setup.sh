#!/bin/sh

../ss-setup.sh /opt/ss-libev
../reg-service.sh /opt/ss-libev/bin/ss-server /root/proxies-deploy/server-side/ss-server.json "-A -u -v -c"
