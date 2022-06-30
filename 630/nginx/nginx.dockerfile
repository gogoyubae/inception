FROM alpine:3.16

RUN apk update && apk add nginx openssl vim openrc
#\&& mkdir -p /var/www/html



#COPY default.conf /etc/nginx/http.d/
#COPY index.html /var/www/html/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
