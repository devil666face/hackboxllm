#!/bin/sh
if [ ! -f /etc/nginx/ssl/nginx.key ]; then
    echo "Generating SSL pair"
    openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj /C=RU/ST=Moscow/L=Moscow/O=5HM3L/OU=Community/CN=hackboxllm
fi
