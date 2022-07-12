# !/bin/sh

# Check Whether Configuration File Exists or Not
if [ ! -f "/etc/nginx/http.d/default.conf" ]; then
  # Copy Configuration File
  cp /tmp/nginx.conf /etc/nginx/http.d/default.conf
  # Make WordPress Ready to Run Nginx
  sleep 5;
fi

nginx -g 'daemon off;'
