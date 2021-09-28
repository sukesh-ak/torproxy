# TOR-PROXY
Tor proxy in a docker container

> docker pull sukeshak/torproxy:latest  

Check IP before torproxy
> curl -L http://ifconfig.me

Usage:
> sudo docker run -d --restart always -p 9050:9050 --name torproxy sukeshak/torproxy

Check IP after torproxy
> curl --socks5 http://localhost:9050 -L http://ifconfig.me
