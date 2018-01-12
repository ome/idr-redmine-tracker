#!/bin/bash
set -eux

HTTPPORT="${HTTPPORT:-80}"
HTTPSPORT="${HTTPSPORT:-443}"
DOMAINNAME="${DOMAINNAME:-localhost}"
BACKENDS="${BACKENDS:-}"
CONF=/etc/nginx/conf.d/default.conf

KEY=/etc/nginx/ssl/selfsigned.key
CRT=/etc/nginx/ssl/selfsigned.crt
if [ -f "$KEY" -a -f "$CRT" ]; then
    echo Certificate already exists
else
    echo Generating self-signed certificate
    openssl req -new -nodes -x509 -subj "/C=UK/ST=Scotland/L=Dundee/O=OME/CN=$DOMAINNAME" -days 365 -keyout "$KEY" -out "$CRT" -extensions v3_ca
fi

cat /etc/nginx/conf.d/proxy.header > $CONF
echo "listen $HTTPPORT; listen $HTTPSPORT ssl;" >> $CONF

for backend in $BACKENDS; do
    echo "$backend"
    IFS='|' read -a ARRAY <<< "$backend"
    echo -e "location ${ARRAY[0]} {\n proxy_pass ${ARRAY[1]}; }" >> $CONF
done
echo '}' >> $CONF
cat $CONF

exec nginx -g "daemon off;"
