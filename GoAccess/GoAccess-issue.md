# GoAccess常见问题

> [GoAccess实战秘籍：从新手到高手，跨越那些“坑”与“惑”！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484472&idx=1&sn=ff44b15ef5e8ac75e6f17837f23d8321&chksm=fd1f2df2ca68a4e4f0b2e1d1c18c0bde441f908476a11823fbb656697747f65ddf5c7ae15da7&token=1289104885&lang=zh_CN#rd)

![微信公众号: 雪之梦技术驿站](/assets/picgo/183223911bf8331efdc5b61a90e0f50d.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！

> 偷偷溜进文章的小广告，别害羞，点进去瞅瞅，说不定能发现什么宝藏呢！文末那个也别错过，说不定是通往秘密花园的钥匙哦！

🌟 大家好，欢迎来到「雪之梦技术驿站」🚀 今天，我们就来一场说走就走的GoAccess探险之旅，不仅揭秘那些让你头疼不已的问题，还亲手为你铺设一条从新手到高手的快速通道。

> GoAccess 是一款开源的且具有交互视图界面的实时 Web 日志分析工具，通过你的 Web 浏览器或者 \*nix 系统下的终端程序\(terminal\)即可访问。能为系统管理员提供快速且有价值的 HTTP 统计，并以在线可视化服务器的方式呈现。摘录自中文翻译网站: https://www.goaccess.cc/

无论你是刚开始接触日志分析的新手，还是想要提升效率的老鸟，这篇文章都将是你不可多得的宝藏地图！

![](https://eladmin.snowdreams1006.cn/file/image/a780541a093cfd17cc6e4d239f8c4e0a.png)

 🔍 首先，让我们直击痛点，聊聊那些在使用GoAccess过程中，你最可能遇到的几个‘坑’：

- 配置迷茫：面对复杂的配置文件，是不是常常感到无从下手，不知道哪些设置才是最适合自己的需求？
- 性能瓶颈：随着数据量的激增，GoAccess是否还能保持其轻盈的身姿，流畅地展示分析结果？
- 数据导入难题：如何将Nginx、Apache等服务器的日志文件无缝导入GoAccess，实现一键分析？
- 报表定制：如何根据自己的需求，定制出既美观又实用的报表，让数据说话更有力？

![](https://eladmin.snowdreams1006.cn/file/image/b6e4ef67eb16798f55f859c4233a7c91.png)

🎉 准备好了吗？让我们一起踏上这场充满挑战与收获的旅程，让GoAccess成为你日志分析领域的得力助手！

```bash
# 生成一份 HTML 报告  
goaccess access.log -a -o report.html  
```

> 详细配置选项请参考官方用户手册

## 常用配置

### 语言时区等设置

> 默认英文环境,需求为更改为中文环境 `zh_CN.UTF-8`

如果系统是英文环境则GoAccess日志监测报告也是英文,查看默认`echo $LANG`环境变量\!

![](https://eladmin.snowdreams1006.cn/file/image/17180091722029f92cf363d568f5004f.png)

所以想要GoAccess显示中文,只需要将环境变量设置为中文即可 `LANG="zh_CN.UTF-8"`

![](https://eladmin.snowdreams1006.cn/file/image/6feb5b7a81c6400375aee9f0be470b0b.png)

### 请求的文件

> 请求链接携带参数,需求为忽略请求参数,精简get请求url

如果是get请求会携带大量的参数,也会展示多条记录,显得非常凌乱,因此需要忽略`query`参数部分

![](https://eladmin.snowdreams1006.cn/file/image/501322963beae699cacd528ddf5d8dc9.png)

```bash
-q --no-query-string  
Ignore request's query string. i.e., www.google.com/page.htm?query => www.google.com/page.htm  
Note: Removing the query string can greatly decrease memory consumption, especially on timestamped requests.  
```

![](https://eladmin.snowdreams1006.cn/file/image/413503d0e6a8afbeedf7d0c4c08ff8f7.png)

### 访客主机名和IP地址

> 只能看到具体的ip数据,无法直观查看ip归属地,需求是解析ip地理位置

![](https://eladmin.snowdreams1006.cn/file/image/583daee9e9ab186920cbf837d9fb8019.png)

开启地理位置解析,指定离线ip数据库文件,具体操作可参考: [你的网站访客来自何方？GoAccess地理分析工具告诉你！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HPngiD-UJKeCAaCwZrsulpfCXcsReG31BBb2pK7Y7kvegRli5-tvNc2o41Uv2HJnT74VSyI&scene=21#wechat_redirect)

```bash
--geoip-database <geocityfile>  
Specify path to GeoIP database file. i.e., GeoLiteCity.dat. File needs to be downloaded from maxmind.com. IPv4 and IPv6 files are supported as well. Note: --geoip-city-data is an alias of --geoip-database.  
Note: If using GeoIP2, you will need to download the City/Country database from MaxMind and use the option --geoip-database to specify the database. Currently cities are only shown in the hosts panel (per host).  
```

![](https://eladmin.snowdreams1006.cn/file/image/09b9708664e9368670fca07e4d9c0261.png)

### 操作系统

> 未知数据`Unknown`单独占比是不太科学的,需求是归类为爬虫`Crawlers`记录

![](https://eladmin.snowdreams1006.cn/file/image/6a2b39b39cb22283f20218c0917b6086.png)

```bash
--unknowns-as-crawlers  
Classify unknown OS and browsers as crawlers. As an attempt to detect non-humans more accurately, an option to classify unknown OS and browsers and crawlers help.  
```

![](https://eladmin.snowdreams1006.cn/file/image/dcaed98f28484a57bbcbe3286bb61453.png)

###  时间分配

> 默认按照小时统计,特殊情况下也可以指定按照分钟统计

![](https://eladmin.snowdreams1006.cn/file/image/1fff065dbd8ce750418b48470ff0c4c0.png)

```bash
--hour-spec=<hour|min>  
Set the time specificity to either hour (default) or min to display the tenth of an hour appended to the hour.  
This is used in the time distribution panel. It's useful for tracking peaks of traffic on your server at specific times.  
```

![](https://eladmin.snowdreams1006.cn/file/image/2d852a720a8b8ea5fb168a514fb9f1a9.png)

### 地理位置

> 需要开启地理位置选项,来源于解析ip对应的地理位置统计展示的数据,否则没有该面板.

```bash
--geoip-database <geocityfile>  
Specify path to GeoIP database file. i.e., GeoLiteCity.dat. File needs to be downloaded from maxmind.com. IPv4 and IPv6 files are supported as well. Note: --geoip-city-data is an alias of --geoip-database.  
Note: If using GeoIP2, you will need to download the City/Country database from MaxMind and use the option --geoip-database to specify the database. Currently cities are only shown in the hosts panel (per host).  
```

![](https://eladmin.snowdreams1006.cn/file/image/fc8959390b9c799b1ce0c3867239a802.png)

具体操作可参考: [你的网站访客来自何方？GoAccess地理分析工具告诉你！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HPngiD-UJKeCAaCwZrsulpfCXcsReG31BBb2pK7Y7kvegRli5-tvNc2o41Uv2HJnT74VSyI&scene=21#wechat_redirect)  

## 总结

本文主要介绍了GoAccess使用过程中的关于面板的常用配置选项,反复查看配置文档的吐血总结,争取新人不用再看繁琐的用户手册就能直接上手.如果是您正在使用的是默认的`nginx`日志格式,那么接下来的命令可以参考使用.请先确认`nginx`日志格式 `--log-format=COMBINED`

```bash
http {  
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '  
                      '$status $body_bytes_sent "$http_referer" '  
                      '"$http_user_agent" "$http_x_forwarded_for"';  
  
    access_log  /var/log/nginx/access.log  main;  
    ...      
}  
```

如果是其他web日志格式,请参考https://goaccess.io/man

```bash
--log-format <logformat>  
The log-format variable followed by a space or \t for tab-delimited, specifies the log format string.  
  
In addition to specifying the raw log/date/time formats, for simplicity, any of the following predefined log format names can be supplied to the log/date/time-format variables. GoAccess can also handle one predefined name in one variable and another predefined name in another variable.  
  
COMBINED     | 联合日志格式  
VCOMBINED    | 支持虚拟主机的联合日志格式  
COMMON       | 通用日志格式  
VCOMMON      | 支持虚拟主机的通用日志格式  
W3C          | W3C 扩展日志格式  
SQUID        | Native Squid 日志格式  
CLOUDFRONT   | 亚马逊 CloudFront Web 分布式系统  
CLOUDSTORAGE | 谷歌云存储  
AWSELB       | 亚马逊弹性负载均衡  
AWSS3        | 亚马逊简单存储服务 (S3)  
```

最后,静态报告基本命令如下:

```bash
# 静态报告  
goaccess /var/log/nginx/access.log --log-format=COMBINED \  
 # ip地理解析数据库文件  
 --geoip-database=/GeoLite2-City.mmdb \  
 # ip地理解析数据库文件  
 --geoip-database=/GeoLite2-City.mmdb \  
 # 忽略GET请求查询参数  
 -q \  
 # 未知用户代理设为爬虫  
 --unknowns-as-crawlers  
 # 输出到web静态路径  
 -o /var/www/html/report.html  
  
```

> 实时报告如下,需要配置`websocket`等选项,关注上一篇历史文章有专门的详细介绍\!

```bash
goaccess /var/log/nginx/access.log --log-format=COMBINED \  
 # 实时日志相关配置  
 --real-time-html \  
 --ws-url=wss://js56.cn:443/goaccess/webSocket \  
 --origin=https://js56.cn \  
 --port=7890 \  
 --ping-interval=60 \  
 # ip地理解析数据库文件  
 --geoip-database=/GeoLite2-City.mmdb \  
 # 忽略GET请求查询参数  
 -q \  
 # 未知用户代理设为爬虫  
 --unknowns-as-crawlers  
 # 输出到web静态路径  
 -o /var/www/html/report.html  
```

![](https://eladmin.snowdreams1006.cn/file/image/e9e1de7a269853b874eb26f3fbbab520.png)

嘿，小伙伴们，你们知道吗？这字儿可不是白码的，每一颗键帽下的汗水都能浇出一朵花来！所以，要是看得开心，就请大方地撒点阳光——评论点赞转发走一波，让我这花园更加灿烂！

![](/assets/picgo/1a73a56f5d79d629432d2ec98b619d80.other)

## 往期精彩文章

- [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&scene=21#wechat_redirect)
- [你的网站访客来自何方？GoAccess地理分析工具告诉你！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HArebnqO4mbeqKrubRMmUIqSqlwjekBCPRKSH5bmrwrxcP3pDPPAoUg2kxZjPVpDUIlyjFo&scene=21#wechat_redirect)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/2f6cef19-53af-4934-aa53-1e91924b3364.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`