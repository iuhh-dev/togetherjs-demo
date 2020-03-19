FROM nginx:stable-alpine
LABEL version="1.0" maintainer="IUHH <me@iuhh.dev>"
RUN rm -rf /usr/share/nginx/html/* && \
    rm /etc/nginx/conf.d/default.conf && ls -al /usr/share/nginx/html/
COPY client/default.conf /etc/nginx/conf.d/default.conf
COPY togetherjs/build /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/
