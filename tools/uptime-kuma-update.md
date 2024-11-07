# uptime监控工具更新

> 开源监控平台 Uptime Kuma 提示有新版本,更新升级教程来了!

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白,
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/478bce29701d85c60553d9ddc3d1afea.gif)

## 前言

`Uptime Kuma` 是一款自托管的监控工具,开源好用,界面美观,部署服务器后运行一段时间偶尔会收到版本更新的提醒,紧跟最新代码,那就更新吧!

![](/assets/picgo/59c113fcfe1dab65e0755c3a522be607.png)

> 如果还不了解请参考: [告别网站宕机烦恼！Uptime Kuma：你的 24 小时运行监控神器](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485740&idx=1&sn=90cfd2630e5e6a8e576f8c32221a07e0&chksm=fd1f20e6ca68a9f059d2d31cca5c73d00dea5320408f6073756a921f15f45cd74e6d5f96d3d8&token=1699993726&lang=zh_CN#rd)

## 更新升级

- docker 更新方式

> docker 更新方式: 升级 docker 镜像再重启容器

```bash
# 更新docker版本uptime-kuma
docker pull louislam/uptime-kuma:1

# 重新部署uptime-kuma
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
```

![](/assets/picgo/be6e586311f00f13203e9f8938f0a0dd.png)

- 源码更新方式

> 源码更新方式: 拉取最新源码并重启

![](/assets/picgo/7f8d79c364e9a621e0c3f1b003ec9b7b.png)

```bash
# 更改为另一个HTTPS URL
git remote set-url origin https://github.com/snowdreams1006/uptime-kuma.git

# 查看远程仓库url
git remote -v

# 查看本地仓库分支
git branch

# 设置登录信息
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# 合并最新提交
git pull origin master

# 源码启动项目
node server/server.js
```

![](/assets/picgo/c23d07e45e35972922c049258aef352e.png)

## 总结

本文主要就介绍了如何更新 uptime 监控系统,docker 部署或者源码部署都提供了更新示例,在实际操作过程中数据库文件直接复制过去或者在线升级部署方式都是不错的选择,否则之前的设置可能会全部丢失!

![](/assets/picgo/c1a8f476bb6f8ef95a86575da9fb546e.gif)

## 往期精彩文章

- [告别网站宕机烦恼！Uptime Kuma：你的 24 小时运行监控神器](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485740&idx=1&sn=90cfd2630e5e6a8e576f8c32221a07e0&chksm=fd1f20e6ca68a9f059d2d31cca5c73d00dea5320408f6073756a921f15f45cd74e6d5f96d3d8&token=1699993726&lang=zh_CN#rd)
- [一夜之间网站访问量剧增 1 万多倍达到恐怖的 5 亿是个什么体验](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247486107&idx=1&sn=535a2194583ac614d3a9305cf163dc04&chksm=fd1f2351ca68aa478f31b6ad1e516c1e0b64d6843cd7d770c3beaf73677dc046acb952d1162e&token=1699993726&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
