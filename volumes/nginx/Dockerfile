FROM nginx:alpine

COPY server.conf /etc/nginx/conf.d/server.conf

COPY entrypoint.sh /docker-entrypoint.d/100-generate-ssl-certs.sh

RUN apk update && apk add bash && apk add openssl && \
rm -rf /var/cache/apk/* && \
mkdir -p /etc/nginx/ssl && \
chmod +x /docker-entrypoint.d/100-generate-ssl-certs.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
