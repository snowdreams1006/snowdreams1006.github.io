# docker + gogs

```bash
docker run --name gogs -d -p 10022:22 -p 10080:3000 --restart=always \
    -v ~/gogs:/data \
    gogs/gogs
```

- github

```
git@github.com:snowdreams1006/snowdreams1006.github.io.git

https://github.com/snowdreams1006/snowdreams1006.github.io.git
```

- gogs

```
git@ssh.snowdreams1006.cn:snowdreams1006/snowdreams1006.github.io.git

https://gogs.snowdreams1006.cn/snowdreams1006/snowdreams1006.github.io.git
```

```
./gogs cert -ca=true -duration=8760h0m0s -host=gogs.snowdreams1006.cn
```

```
docker cp gogs:$(docker exec gogs pwd)/cert.pem gogs/https
```

- [gogs/gogs](https://hub.docker.com/r/gogs/gogs)
- [配置文件手册](https://gogs.io/docs/advanced/configuration_cheat_sheet.html)
- [Docker下gogs的使用](https://blog.csdn.net/wangchao8110/article/details/85220918)
- [docker安装gogs](https://www.jianshu.com/p/2a7acb07b352)
- [docker gogs安装](https://segmentfault.com/a/1190000015731724)