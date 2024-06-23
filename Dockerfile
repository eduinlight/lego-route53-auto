FROM alpine:3.20.1
LABEL author="Eduin Garcia Cordero"
LABEL description="Docker compose configuration to create tls certificates for https. Automate certificates renovation."

RUN apk upgrade \
  && apk add --no-cache bash lego \
  && rm -rf /var/cache/apk/*

COPY cron-config /var/spool/cron/crontabs/root

COPY *.sh /usr/bin/

RUN chmod +x /usr/bin/lego.sh

CMD bash -c "lego.sh run && crond -f"
