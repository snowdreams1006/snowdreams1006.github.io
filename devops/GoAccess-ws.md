# [GoAccess：解锁Web日志的宝藏，你的实时分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484441&idx=1&sn=12996994a835aba76076d0b749ef9aaf&chksm=fd1f2dd3ca68a4c5417ff3b2d02cedf1f6f721db1616f2f8824b9824c000a28226901888f6b5&token=1289104885&lang=zh_CN#rd)

![微信公众号: 雪之梦技术驿站](https://snowdreams1006.github.io/assets/picgo/640.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！

> 偷偷溜进文章的小广告，别害羞，点进去瞅瞅，说不定能发现什么宝藏呢！文末那个也别错过，说不定是通往秘密花园的钥匙哦！

今天，我要向大家介绍一款**开源的实时Web日志分析工具**——GoAccess，它无疑是窥探这座数据宝藏的钥匙。

![](https://snowdreams1006.github.io/assets/picgo/640-20240803133025151.gif)

> GoAccess是一款轻量级的日志分析工具，以其简洁的命令行操作和直观的可视化界面，赢得了众多用户的青睐。它不仅能够展示基本的统计数据，如独立访客、请求的文件、404错误等，还能提供更深层次的分析，如操作系统、浏览器、搜索引擎和HTTP响应代码等。

## 功能亮点

1.  **实时分析**：GoAccess能够实时读取日志文件，并在终端或Web浏览器中动态展示分析结果。这种实时性确保了网站管理者能够随时掌握网站的最新动态，快速响应各种变化。

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLGp2KkiamsJYc88VDpTVyUeQcaUibAAVO2KZUbhKoBH1tCrmy0D61icUhSA/640?wx_fmt=png&from=appmsg)

2.  **多格式支持**：它支持Apache、Nginx、Amazon S3、Elastic Load Balancing、CloudFront等多种日志格式，几乎覆盖了所有主流的Web服务器和云服务。这使得GoAccess在不同环境下都能发挥出色的作用。

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLGRESEWgtWH9Brq7YP21UibG2gt8QicIM7Iz3UavSuB1RbMAuGqib6fYiaeA/640?wx_fmt=png&from=appmsg)

3.  **深度分析**：除了基本的统计数据（如独立访客、请求的文件、404错误等），GoAccess还能提供更深层次的分析，如操作系统、浏览器、搜索引擎和HTTP响应代码等。这些详细的数据分析有助于网站管理者更全面地了解用户行为。

![](https://snowdreams1006.github.io/assets/picgo/640-20240803133025262.png)

4.  **定制化报表**：GoAccess能够将分析结果保存为HTML格式的报告，这些报告不仅美观易读，而且包含了丰富的统计信息和图表。这使得网站管理者能够更直观地理解网站流量和用户行为，并轻松地将报告分享给团队成员或客户。

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLG3Ucye7Ia6y3OCPnXxHicxRAlqRDdSska79FLcXY4C0o7mI1CicAjLJYQ/640?wx_fmt=png&from=appmsg)

> 无外部依赖,可离线查看html网页报告

5.  **WebSocket支持**：通过配置WebSocket选项，GoAccess可以实现实时解析并输出日志详情的功能。这为用户提供了一个交互式的、动态更新的日志分析界面，使得数据分析更加直观和高效。

![](https://snowdreams1006.github.io/assets/picgo/640-20240803133025322.png)

> 开启 `WebSocket` 选项,支持实时解析并输出日志详情  

## 快速上手教程

### docker容器部署  

```bash
# 静态报告: 临时运行  
docker run -i --rm --name=goaccess \  
    # 配置中文语言以及国内时区  
    -e "TZ=Asia/Shanghai" \  
    -e "LANG=zh_CN.UTF-8" \  
    # 开启地理位置解析,需要离线下载数据库  
    -v ~/goaccess/database/GeoLite2-City.mmdb:/GeoLite2-City.mmdb \  
    # 自定义配置文件,设定日志格式等  
    -v ~/goaccess/data:/srv/data \  
    # nginx日志路径  
    -v ~/nginx/logs:/srv/logs \  
    # html报告输出路径  
    -v ~/nginx/html/goaccess:/srv/report \  
    # 也可提前拉取镜像: docker pull allinurl/goaccess  
  allinurl/goaccess --no-global-config \  
  --config-file=/srv/data/goaccess.conf \   
  --output=/srv/report/index.html \  
  --log-file=/srv/logs/access.log \  
  --geoip-database /GeoLite2-City.mmdb  
```

> [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&chksm=fd1f2a06ca68a3105e948e6a1db7098fadd6e5e74fe0cbb87ce736af749611df9611db9216fe&token=196077561&lang=zh_CN&scene=21#wechat_redirect)[你的网站访客来自何方？GoAccess地理分析工具告诉你！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HArebnqO4mbeqKrubRMmUIqSqlwjekBCPRKSH5bmrwrxcP3pDPPAoUg2kxZjPVpDUIlyjFo&scene=21#wechat_redirect)

### 常规部署

```bash
# 静态报告  
TZ="Asia/Shanghai" \
LANG="zh_CN.UTF-8" \
bash -c "goaccess /var/log/nginx/access.log --log-format=COMBINED --geoip-database=/GeoLite2-City.mmdb -o /var/www/html/report.html"  
```

## 重点来了: WebSocket配置

如果希望使用WebSocket功能实现实时日志分析，需要在编译GoAccess时添加`--with-openssl`选项，并在运行时配置相关参数。以下是一些WebSocket相关的配置选项：

- `--real-time-html`：启用实时HTML报告功能。
- `--daemonize`：以守护进程方式运行GoAccess。
- `--origin=<url>`：设置前端发送请求头Origin字段的值。
- `--ws-url=<[scheme://]url[:port]>`：设置前端WebSocket连接的URL。
- `--port=<port>`：设置后端WebSocket服务监听的端口号，默认为7890。
- `--ping-interval=<secs>`：设置心跳间隔（以秒为单位），以保持WebSocket连接活跃。

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLGj49UqthTic1C7M6AoceLOYAtd11pDtKd3fbjABh8DpcMmsFxPh1sNLw/640?wx_fmt=png&from=appmsg)

如果担心直接暴露WebSocket端口的安全问题，可以使用Nginx等反向代理工具来代理WebSocket服务。

```bash
# GoAccess: WebSocket 服务  
location /goaccess/webSocket {  
    proxy_redirect off;  
    proxy_pass http://127.0.0.1:7890;  
    proxy_http_version 1.1;  
    proxy_set_header Upgrade $http_upgrade;  
    proxy_set_header Connection "upgrade";  
    proxy_set_header Host $http_host;  
    proxy_set_header X-Real-IP $remote_addr;  
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  
    proxy_connect_timeout 600s;  
    proxy_read_timeout 600s;  
    proxy_send_timeout 600s;  
}  
```

没有开启前左侧的小齿轮是灰色的按钮,打开控制台过滤`websocket`也没有该类请求.

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLGDj9bXJE1GhE1LpaGE3ZKTkv7eYc3icTsEtwJocSF4fd3boo2wXjN4xg/640?wx_fmt=png&from=appmsg)

按照上述GoAccess配合nginx反向代理后,开启`websocket`支持:

```bash
# GoAccess配合nginx反向代理  
goaccess /var/log/nginx/access.log --log-format=COMBINED \  

 # 开启实时解析  

 --real-time-html \  

 # 设置请求头origin  

 --origin=https://snowdreams1006.cn \  

 # 设置ws请求路径  

 --ws-url=wss://snowdreams1006.cn:443/goaccess/webSocket \  

 # 监听端口  

 --port=7890 \  

 # 心跳检测  

 --ping-interval=60 \  

 # 地理位置解析,参考-你的网站访客来自何方？GoAccess地理分析工具告诉你！  

 --geoip-database=/GeoLite2-City.mmdb \  

 # 输出静态文件到可访问的静态目录,例如可能形如 https://snowdreams1006.cn/report.html  

 -o /var/www/html/report.html  
```

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLGxon7GAwFPdXfsXMftMTn1tpAuVibSjVxkXZdu1GibMjDAkrlxXjefCicg/640?wx_fmt=png&from=appmsg)

> 开启后左侧的小齿轮变成绿色,已有了websock请求\!

同样支持`docker`部署方式,可以将上述配置选项写到配置文件`goaccess.conf`中,如果找不到该配置文件可以『雪之梦技术驿站』评论私信哦\~

```bash
# 实时报告: 后台运行  
docker run -d -p 7890:7890 --restart always --name=goaccess \  
    # 配置中文语言以及国内时区  
    -e "TZ=Asia/Shanghai" \  
    -e "LANG=zh_CN.UTF-8" \  
    # 开启地理位置解析,需要离线下载数据库  
    -v ~/goaccess/database/GeoLite2-City.mmdb:/GeoLite2-City.mmdb \  
    # 自定义配置文件,设定日志格式等  
    -v ~/goaccess/data:/srv/data \  
    # nginx日志路径  
    -v ~/nginx/logs:/srv/logs \  
    # html报告输出路径  
    -v ~/nginx/html/goaccess:/srv/report \  
    # 也可提前拉取镜像: docker pull allinurl/goaccess  
  allinurl/goaccess  --no-global-config \   
  --config-file=/srv/data/goaccess.conf \  
  --output=/srv/report/index.html \  
  --log-file=/srv/logs/access.log \  
  --real-time-html \  
  --geoip-database /GeoLite2-City.mmdb  
```

现在有了实时监控日志的功能,可以及时掌握更多数据.

## 总结

本文属于GoAccess的应用篇,主要介绍了如何配置`webSocket`实现实时监控解析web日志的功能.详细介绍了相关配置以及具体的演示案例,同时利用`nginx`反向代理方式避免了GoAccess默认端口`7890`暴露到外网的风险.

![](https://mmbiz.qpic.cn/sz_mmbiz_png/aEPult10iakLJLjf1bfibmaIPWoSlCTlLGftrhdyPibGKuHfRf1ovBsfr59v8t5EznwWpVl0GYGcrJyXSPRCKjhAQ/640?wx_fmt=png&from=appmsg)

嘿，小伙伴们，你们知道吗？这字儿可不是白码的，每一颗键帽下的汗水都能浇出一朵花来！所以，要是看得开心，就请大方地撒点阳光——评论点赞转发走一波，让我这花园更加灿烂！

![](https://snowdreams1006.github.io/assets/picgo/640.jpeg)

## 往期精彩文章

- [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&scene=21#wechat_redirect)
- [你的网站访客来自何方？GoAccess地理分析工具告诉你！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HArebnqO4mbeqKrubRMmUIqSqlwjekBCPRKSH5bmrwrxcP3pDPPAoUg2kxZjPVpDUIlyjFo&scene=21#wechat_redirect)

## 欢迎扫码关注

![微信公众号-雪之梦技术驿站](https://snowdreams1006.github.io/assets/picgo/640-20240803133025432.jpeg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`