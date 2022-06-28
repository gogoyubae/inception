FROM alpine:3.16

RUN apk add nginx openssl vim && mkdir -p /var/www/html
# RUN apt-get update -y && apt-get install -y nginx openssl vim

COPY default.conf /etc/nginx/http.d/
COPY index.html /var/www/html/


ENTRYPOINT ["nginx", "-g", "daemon off;"]