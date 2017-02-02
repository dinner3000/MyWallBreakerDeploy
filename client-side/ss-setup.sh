#!/bin/sh

../ss-setup.sh /opt/ss-libev
../reg-service.sh /opt/ss-libev/bin/ss-local /root/breakwall/client-side/ss-client.json "-A -u -v -c"
