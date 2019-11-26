# docker + mojo-Weixin

> https://github.com/sjdy521/Mojo-Weixin

- 拉取镜像

```bash
docker pull sjdy521/mojo-weixin
```

- 运行镜像

```bash
docker run -it  --env MOJO_WEIXIN_LOG_ENCODING=utf8 -p 3000:3000 -v /tmp:/tmp sjdy521/mojo-weixin 
```

```bash
docker run -it  --env MOJO_WEIXIN_LOG_ENCODING=utf8 -p 3000:3000 -v /root/mojo/tmp:/tmp sjdy521/mojo-weixin 
```

> https://github.com/sjdy521/Mojo-Weixin/blob/master/Docker.md

