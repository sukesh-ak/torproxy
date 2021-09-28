## Usage & Testing
##  > curl -L http://ifconfig.me
##  > sudo docker run -d --restart always -p 9050:9050 --name torproxy sukeshak/torproxy
##  > curl --socks5 http://localhost:9050 -L http://ifconfig.me

FROM alpine:latest
RUN apk update && apk add tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*
EXPOSE 9050
COPY torrc.default /etc/tor/torrc.default
RUN chown -R tor /etc/tor
USER tor
ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
