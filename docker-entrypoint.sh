#!/bin/sh

SERVER_ADDR=${SERVER_ADDR:-"0.0.0.0"}
METHOD=${METHOD:-"aes-256-cfb"}
PASSWORD=${PASSWORD:-"shadowsocks"}
SSPORT=${SSPORT:-"12580"}


# echo "***** Run with Password [${PASSWORD}] and Method [${METHOD}] *****"

sed -i '/^listen-address.*/d' /etc/privoxy/config
echo "listen-address  0.0.0.0:${PROXYPORT}" >> /etc/privoxy/config
echo "forward-socks5   /               127.0.0.1:1080 ." >> /etc/privoxy/config

nohup privoxy --no-daemon /etc/privoxy/config &
ss-local -s ${SERVER_ADDR} -p ${SSPORT} -m ${METHOD} -k ${PASSWORD} -l 1080
