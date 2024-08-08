# GoAccess地理位置

> [你的网站访客来自何方？GoAccess地理分析工具告诉你！ ](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HGcl03MA2kBVL4aYDgQZf8tVGobSOtHi3s6JshgR1CWosHXlok7r5l3qiWwwNvtQbSLnZw0#rd)

![微信公众号: 雪之梦技术驿站](/assets/picgo/183223911bf8331efdc5b61a90e0f50d.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！想象一下，你站在世界地图前，手中的放大镜缓缓移动，寻找着那些隐藏在数字海洋中的神秘岛屿——IP地址。今天，我们要介绍的**GoAccess**，就是这样一款能够将IP地址转化为全球地理分布的强大工具。

![](/assets/picgo/5f96fc3a15d064a5e3e3fde96aa2305a.png)

### 一窥数字世界背后的真实

你有没有想过，当你浏览网页时，你的IP地址就像是一张张明信片，记录着你的在线行为并发送给网站管理员。而对于网站管理员来说，如何有效分析这些数据，了解访问者的地理位置分布，就成了一个重要的问题。**GoAccess**的出现，为这一问题提供了完美的解决方案。

### 探索GoAccess的神秘面纱

首先，让我们来看一个实际的案例。假设你拥有一个全球性的电商平台，每天都有成千上万的访客从世界各地涌入。通过**GoAccess**的数据分析，你可能会惊讶地发现，尽管你的商品在全球范围内都受欢迎，但某些特定地区在特定时间段内的访问量远远超出了你的预期。

```bash
# 输出到终端且生成一个可交互的报告  
goaccess access.log  
  
# 生成一份 HTML 报告  
goaccess access.log -a -o report.html  
  
# COMBINED     | 联合日志格式  
# VCOMBINED    | 支持虚拟主机的联合日志格式  
# COMMON       | 通用日志格式  
# VCOMMON      | 支持虚拟主机的通用日志格式  
# W3C          | W3C 扩展日志格式  
# SQUID        | Native Squid 日志格式  
# CLOUDFRONT   | 亚马逊 CloudFront Web 分布式系统  
# CLOUDSTORAGE | 谷歌云存储  
# AWSELB       | 亚马逊弹性负载均衡  
# AWSS3        | 亚马逊简单存储服务 (S3)  
  
# GoAccess 非常灵活，支持实时解析和过滤。例如：需要通过监控实时日志来快速诊断问题：  
tail -f access.log | goaccess --log-format=COMBINED -  
```


### 开启地理解析之旅

配置**GoAccess**以实现地理IP解析并不复杂。首先，你需要从源代码编译安装**GoAccess**，并启用地理IP解析支持。这一步骤通过以下命令即可轻松完成：[\--enable-geoip=](https://goaccess.io/download "--enable-geoip=<legacy|mmdb>")

> “Compile with GeoLocation support. MaxMind's GeoIP is required. legacy will utilize the original GeoIP databases. mmdb will utilize the enhanced GeoIP2 databases.

```bash
$ git clone https://github.com/allinurl/goaccess.git   
$ cd goaccess  
$ autoreconf -fi  
$ ./configure --enable-utf8 --enable-geoip=mmdb  
$ make  
# make install  
```

### 地理数据库的选择与配置

接下来，你需要获取并配置地理IP数据库。这里有两种数据库可供选择：**标准GeoIP数据库**和**GeoIP2数据库**。标准GeoIP数据库占用内存较少，适合对资源有限制的环境；而GeoIP2数据库则提供了更为详尽的地理位置信息。**方式1: 下载标准 GeoIP 数据库**

> “`-g --std-geoip` 标准 GeoIP 数据库，低内存占用

```bash
# IPv4 Country database:  
# Download the GeoIP.dat.gz  
# gunzip GeoIP.dat.gz  
#  
# IPv4 City database:  
# Download the GeoIPCity.dat.gz  
# gunzip GeoIPCity.dat.gz  
```

**方式2: 下载GeoIP2数据库-MaxMind**

> “注意: `--geoip-city-data` 是 `--geoip-database` 的别名

```bash
# For GeoIP2 City database:  
# Download the GeoLite2-City.mmdb.gz  
# gunzip GeoLite2-City.mmdb.gz  
#  
# For GeoIP2 Country database:  
# Download the GeoLite2-Country.mmdb.gz  
# gunzip GeoLite2-Country.mmdb.gz  
```

下载并解压相应的数据库文件后，你只需在**GoAccess**的命令行参数中指定数据库文件的位置，即可让工具在分析日志文件时自动将IP地址与地理位置关联起来。

> “更多配置请参考[官网用户手册](https://goaccess.io/man "官网用户手册")

注册并登录[maxmind](https://www.maxmind.com/en/home "maxmind"),可以免费下载离线数据库.

![](/assets/picgo/fb88b176401aa2985ff975947c246941.png)  

然后一键直达[数据库下载页面](https://www.maxmind.com/en/accounts/887917/geoip/downloads "数据库下载页面"),有很多不同类型的数据库,选择`GeoLite2 (.mmdb)`

![](/assets/picgo/55e514094f1ffdebbf4ece1755595876.png)

最后解压缩到本地,上传到服务器某路径下,接下来就可以让`GoAccess`具有解析地理位置的能力啦\!  
![](/assets/picgo/c833ce4e93796b1731be8829f904e36d.png)  
  


> “如果不想自己下载数据库,开箱即用,可以私信「雪之梦技术驿站」评论回复领取\!

### 实时地理位置可视化

无论是生成静态的HTML报告，还是实时更新的HTML报告，都可以通过简单的命令行操作实现。例如，你可以使用以下命令生成一个包含地理位置信息的静态HTML报告：

```bash
# 静态HTML报告: 开启地理位置支持goaccess access.log -o report.html --log-format=COMBINED --geoip-database=/path/to/GeoLite2-City.mmdb
```

或者，如果你想实时查看数据，可以使用以下命令生成实时HTML报告：

```bash
# 实时HTML报告: 开启地理位置支持   
goaccess access.log -o report.html --log-format=COMBINED --geoip-database=/path/to/GeoLite2-City.mmdb --real-time-html --daemonize  
```

### 地理位置的局限性

使用**GoAccess**的地理分析功能，你将能够直观地看到访问者的地理位置分布，这不仅能够帮助你更好地理解用户行为，还能够为你的商业决策提供数据支持。然而，值得注意的是，免费的数据库文件更新频率可能较低，这意味着某些IP地址可能无法解析出具体位置。但这并不妨碍我们利用现有数据做出明智的决策。

![](/assets/picgo/6a01b0d17ace469905d431ae463c3c5e.svg)

### 结语

在这个数据为王的时代，让我们用**GoAccess**绘制出属于你的世界地图，让每一次访问都成为探索的起点，每一次分析都成为成功的基石。开启你的数据之旅，从这里开始。

![](/assets/picgo/51b2dd262df21448aba11c092abae94b.svg)


![微信公众号-雪之梦技术驿站](/assets/picgo/9dd8e5a0702f76903bedb42f9a601885.jpeg)

## 往期精彩文章

- [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&scene=21#wechat_redirect)

## 您的关注是小站的动力

`欢迎扫码关注,私信回复『加群』一起交流技术`