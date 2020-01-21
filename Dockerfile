FROM nginx:1.17.7-alpine
COPY ./index-tpl.html /tmp/html/index-tpl.html
COPY ./logo.png /tmp/html/logo.png
COPY ./nginx.conf /tmp/nginx.conf
EXPOSE 8080
ENTRYPOINT envsubst '$APP_TITLE,$DB_HOST,$APP_VERSION' < /tmp/html/index-tpl.html > /tmp/html/index.html && exec nginx -c /tmp/nginx.conf -g 'daemon off;'
