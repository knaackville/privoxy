
**Privoxy in docker container**
===

Versions in the latest image
-----
- [Privoxy](https://www.privoxy.org/ "Privoxy Homepage") Version: 3.0.33

Healthcheck & Configs
-----
The docker container has a working health-check built in.

To determine the correct function, it verifies access to the *.onion address from [DuckDuckGo](https://duckduckgo.com/ "DuckDuckGo Homepage").

**privoxy-configuration:**
```
listen-address 0.0.0.0:8118
```

Start your container
-----
On port **[8118]**, the container offers a privoxy HTTP-Proxy

**alpine version**
```
docker run -d \
  -p 8118:8118 \
  -p 9050:9050 \
  --user=[UID:GID] \
  --name privoxy \
  --restart=unless-stopped avpnusr/privoxy
```
