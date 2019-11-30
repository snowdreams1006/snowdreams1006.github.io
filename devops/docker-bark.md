# docker + Bark

> [https://github.com/Finb/bark-server](https://github.com/Finb/bark-server)

- install

```bash
docker run -dt --name bark -p 8080:8080 -v `pwd`/data:/data finab/bark-server
```

- test

```bash
curl http://0.0.0.0:8080/ping
```

```bash
curl https://bark.snowdreams1006.cn/ping
```