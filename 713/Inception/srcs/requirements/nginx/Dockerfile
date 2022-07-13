FROM alpine:3
EXPOSE 443

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  -subj "/C=FR/ST=AURA/L=Lyon/O=42Lyon/CN="

# nginx config
RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
