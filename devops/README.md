# 运维部署

## 系统版本

- 查看系统版本

```bash
$ uname -a
```

```bash
cat /proc/version
```

- 查看 centos 版本号

```bash
$ cat /etc/centos-release
```

## 内存配额

```bash
$ free -h
```

## 公网 ip

- `ifconfig.me`

```bash
$ curl ifconfig.me
```

- `icanhazip.com`

```bash
$ curl icanhazip.com
```

## 内网 ip

```bash
$ ifconfig eth0
```

## TODO 清单

- [使用 ansible 做自动化运维](https://juejin.im/post/5dafb50c6fb9a04e1325f2ff)
- [使用 docker 高效部署前端应用](https://github.com/shfshanyue/op-note/blob/master/deploy-fe-with-docker.md)
- [前端部署演化史](https://github.com/shfshanyue/op-note/blob/master/deploy-fe.md)
- [linux 调优各项监控指标小记](https://juejin.im/post/5dae57fbf265da5b5b6c7881)
- [sed 命令使用及示例](https://juejin.im/post/5db1053df265da4d57770c30)
- [jq: 命令行下的 json 处理工具](https://juejin.im/post/5db104f7f265da4d2e121510)
- [博客域名更换记录以及衍生问题解决方案](https://shanyue.tech/post/domain-update-record/#https)
- [使用 Let's Encrypt 为 Traefik 制作证书并自动续期](https://shanyue.tech/post/traefik-https/#%E5%89%8D%E8%A8%80)
- github 托管私有仓库，并结合 github action 做 CI/CD
- quay 构建镜像
- cloudflare 免费的 CDN
- sentry 异常上报
- aws-lambda 简单的 API

## 参考文档

- [SSH简介及两种远程登录的方法](https://blog.csdn.net/li528405176/article/details/82810342)
- [服务器快速免密ssh登录配置](https://juejin.im/post/5da724506fb9a04e2a73d96c)
- [linux 信息查看及命令](https://juejin.im/post/5dad7681f265da5bb86ad2f5)
- [github连接报"ssh: connect to host github.com port 22: Connection timed out"错误](https://www.cnblogs.com/jpfss/p/8094005.html)

## LICENSE

![知识共享许可协议 Figure: 知识共享许可协议](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)

[知识共享许可协议 Figure: 知识共享许可协议](http://creativecommons.org/licenses/by-nc-nd/4.0/)

