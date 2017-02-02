#!/bin/sh

/opt/ss-libev/bin/obfs-local -c /root/shadowsocks/obfs-client.json > /var/log/obfs-local.log 2>&1 &

/opt/ss-libev/bin/ss-local -A -u -c /root/shadowsocks/ss-client.json > /var/log/ss-local.log 2>&1 &

exit 0
