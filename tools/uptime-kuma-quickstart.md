# 网站运行时间监控

> 告别网站宕机烦恼！Uptime Kuma：你的24小时运行监控神器

![微信公众号「雪之梦技术驿站」](/assets/picgo/6f3b53a1d54f77563e71b92645f520a7.gif)

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！

---

如果你有一群需要特别关注的网站或者服务,那么时刻掌握服务可用性显得至关重要!

想象一下,针对某些网站是否发生故障,什么时间重新恢复?简单的逻辑,复杂的开发.

![](/assets/picgo/e64dd21ea1d111e2f30a63f2ff5d98f9.png)

曾经的我,是这么实现的,不仅要处理普通的 http 请求返回 json 格式,还要 selenium 爬取监控首页,判断是否可用后再写个消息推送服务,不可不谓不复杂!

这密密麻麻是代码如今再也不需要了,只要简单部署`Uptime Kuma`服务即可轻松实现!

> 内心 OS: 为啥不让我早日发现这神奇项目,推荐给大家.

## 效果

部署成功后,你将收到一个默认首页,效果杠杠滴,高端大气上档次.

> 默认网站监控首页: [https://uptime.snowdreams1006.cn/](https://uptime.snowdreams1006.cn/)

![](/assets/picgo/b98befa86aee5e7efd92f3ddeacd1c5d.png)

首次部署成功后会提示注册用户,成为管理员就能添加各类的监控网站,支持 http 请求,还额外附带了**https 证书过期提醒**服务!

> 添加监控网站设置: [https://uptime.snowdreams1006.cn/manage-status-page](https://uptime.snowdreams1006.cn/manage-status-page)

不仅支持普通的`http`网站,还支持`docker`,数据库等多种特殊类型监控.

![](/assets/picgo/91a3c6ca71b8cfe656fa6eab3b175405.png)

当网站发生故障时,内置了多种通知的配置,让你第一时间收到最新动态.

![](/assets/picgo/800edd3f38e974fdd56bd561ebf9755b.png)

例如某个关注网站不可用或者重新恢复正常时,你将会收到这样的消息推送.

![](/assets/picgo/f755d7fc050fa4afab2c1f411948f92d.png)

所以,让我们一起看看如何安装使用这个开源项目吧!

## 项目

直接推荐 github 地址,不仅支持常规方式部署,还支持 docker 部署!

> 项目地址: [https://github.com/louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)

**安装**

- docker 方式

> 友情提示: 目前国内 docker 环境异常,请自行搜索相关解决,懒得话也可以私聊我.

```bash
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
```

- 源码安装

> pm2 : 用于后台运行`Uptime Kuma`

```bash
git clone https://github.com/louislam/uptime-kuma.git
cd uptime-kuma
npm run setup

# Option 1. Try it
node server/server.js

# (Recommended) Option 2. Run in the background using PM2
# Install PM2 if you don't have it:
npm install pm2 -g && pm2 install pm2-logrotate

# Start Server
pm2 start server/server.js --name uptime-kuma
```

> 支持`windows/mac/linux`等常见系统,`nodejs`版本推荐`v20.17.0`即可.

## 使用

本地启动后默认会在`3001`端口开启`http`服务,正式部署上线需要确保`3001`端口可以访问或者使用`nginx`等反向代理方式公开服务.

> [http://localhost:3001/](http://localhost:3001/)

![](/assets/picgo/ff4c9c7f88822f88d15a784386b7a4c5.png)

**站点主 URL**

设置-->常规-->自动获取**站点主 URL**: [https://uptime.snowdreams1006.cn](https://uptime.snowdreams1006.cn)

> 注意: 这里的站点 url 就是游客访问时的默认首页!

![](/assets/picgo/a34a46608bbe7af3b17f53da5598348d.png)

**TLS 证书过期通知**

设置-->通知-->TLS 证书过期通知

![](/assets/picgo/a9065f111b146d81993c852c5e7b4c3e.png)

**可信的代理类字段 HTTP 头**

设置-->反向代理-->HTTP 头-->是

> nginx 的 https 请求配置示例,更多请参考官方文档
>
> [https://github.com/louislam/uptime-kuma/wiki/Reverse-Proxy](https://github.com/louislam/uptime-kuma/wiki/Reverse-Proxy)

```config
server {
  listen 443 ssl http2;
  # Remove '#' in the next line to enable IPv6
  # listen [::]:443 ssl http2;
  server_name sub.domain.com;
  ssl_certificate     /path/to/ssl/cert/crt;
  ssl_certificate_key /path/to/ssl/key/key;
  # *See "With SSL (Certbot)" below for details on automating ssl certificates

  location / {
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   Host $host;
    proxy_pass         http://localhost:3001/;
    proxy_http_version 1.1;
    proxy_set_header   Upgrade $http_upgrade;
    proxy_set_header   Connection "upgrade";
  }
}
```

**Docker 宿主**

设置-->Docker 宿主-->Docker 守护进程

> 如果想要监控其他 docker 化容器,需要配置 uptime-kuma 宿主信息.
>
> [https://github.com/louislam/uptime-kuma/wiki/How-to-Monitor-Docker-Containers](https://github.com/louislam/uptime-kuma/wiki/How-to-Monitor-Docker-Containers)

**备份**

> 请改为直接备份 docker 卷或者数据文件夹（./data/）。

![](/assets/picgo/c83b95b43e87fbdc9fc98b2f3959702a.png)

## 总结

本文主要介绍了`louislam/uptime-kuma`项目,简洁漂亮的首页监控着众多网页,还支持国内外各类消息服务.

> 项目地址: [https://github.com/louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)

![](/assets/picgo/cd9f7e9d2938f5974adc667be85e1c78.png)

## 往期精彩文章

- [一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)
- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484509&idx=1&sn=ab610cdda5a19e6d93584eb47e1ca90b&chksm=c34ad19f34396970754c7c675842c376c463517d186ca0a2625d0f5e1c93fba1294ffbfbe2b1&mpshare=1&scene=1&srcid=0830xWe7y9ghVDMQCa1Nc1Aa&sharer_shareinfo=7bd783bffb92c8b1f5b6300d76562b33&sharer_shareinfo_first=7bd783bffb92c8b1f5b6300d76562b33#rd)

![](/assets/picgo/31f9180b2c2601eb166e885a92d804e3.jpg)

## 欢迎扫码关注
                  
![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`