#!/bin/bash
service haproxy stop
service nginx start
certbot renew --cert-name $1
cat /etc/letsencrypt/live/$1/fullchain.pem /etc/letsencrypt/live/$1/privkey.pem > /etc/ssl/private/$1.pem
service nginx stop
service haproxy start