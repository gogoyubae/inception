FROM alpine:3.13
EXPOSE 443

RUN apk update && apk add --no-cache nginx openssl vim openrc
#&& mkdir -p /var/www/html/wordpress

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN="

RUN mkdir -p /run/nginx

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

#ENTRYPOINT ["tail", "-f"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
