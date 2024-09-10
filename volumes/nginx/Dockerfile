FROM nginx:alpine

COPY server.conf /etc/nginx/conf.d/server.conf

RUN apk update && apk add bash

CMD ["nginx", "-g", "daemon off;"]
