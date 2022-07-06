FROM alpine:3.16
EXPOSE 443

RUN apk update && apk add nginx openssl vim openrc && mkdir -p /var/www/html

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN="

RUN mkdir -p /run/nginx

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

#COPY default.conf /etc/nginx/http.d/
#COPY index.html /var/www/html/

ENTRYPOINT ["tail", "-f"]
# ENTRYPOINT ["sh", "-c", "nginx -g 'daemon off;'"]
