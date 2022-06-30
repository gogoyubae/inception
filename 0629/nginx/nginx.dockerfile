FROM debian:buster

RUN apt-get update -y  && apt-get install -y nginx openssl vim && mkdir -p /var/www/html


COPY default.conf /etc/nginx/http.d/
COPY index.html /var/www/html/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
