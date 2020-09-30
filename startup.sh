#!/bin/sh

sed -i 's|{TARGET_HOST}|'$TARGET_HOST'|g' /etc/rsyncd.conf
sed -i 's|{TARGET_HOST}|'$TARGET_HOST'|g' /root/confxml.xml

# exec sersync2 -r -o confxml.xml

sersync2 -d -r -o confxml.xml

tail -f /tmp/rsyncd.log


