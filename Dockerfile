FROM nginx:1.17.7-alpine
COPY ./index-tpl.html /tmp/html/index-tpl.html
COPY ./nginx.conf /tmp/nginx.conf
EXPOSE 8080
ENTRYPOINT envsubst '$MESSAGE_1,$MESSAGE_2' < /tmp/html/index-tpl.html > /tmp/html/index.html && exec nginx -c /tmp/nginx.conf -g 'daemon off;'
