FROM nginx:stable-alpine
LABEL version="1.0" maintainer="Jimmy Iu <jimmy@arch-partnership.com>"
RUN rm -rf /usr/share/nginx/html/* && \
    rm /etc/nginx/conf.d/default.conf && \
    echo '\
server {\
  listen 80;\
  location / {\
    root /usr/share/nginx/html;\
    try_files $uri $uri/ @rewrites;\
    location ~* \.(?:ico|css|js|gif|jpe?g|png)$ {\
      # Some basic cache-control for static files to be sent to the browser\
      expires max;\
      add_header Pragma public;\
      add_header Cache-Control "public, must-revalidate, proxy-revalidate";\
    }\
  }\
  location @rewrites {\
    rewrite ^(.+)$ /index.html last;\
  }\
}' >> /etc/nginx/conf.d/default.conf
COPY / /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/
