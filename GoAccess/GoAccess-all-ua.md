# 爬虫识别，从此天下再无真假李逵！

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 引言

今天想来已经一段时间没有查看`nginx`日志大屏了,一条拉黑ip消息推送倒是提醒了我,应该查看一下最近服务器日志是否出现异常情况.

![](/assets/picgo/ce24ff94ea734b3fc6804ba5936f749d.png)

于是乎,抽空查看了一下`GoAccess`监控下的`Nginx`日志分析大屏,发现了如下问题:

![](/assets/picgo/7d3d8a9e4d0cd833658bcd2e9a119c36.png)

## 鼠标滚动不好复制

查看日志的过程中,对于那些疑似黑客行为,想要选中某元素复制时,总会很容易触发到鼠标选择了其他区域的元素,所以最好能屏蔽掉这种效果.

![](/assets/picgo/b06852795ce4458f57e4f0c400b83a43.png)

翻找了一下`GoAccess`配置文件,找到了如下配置,尝试关闭鼠标支持`with-mouse`设置为`false`

![](/assets/picgo/8b2d96ca6f7d5ae7179ac0cbfda4abbe.png)

```
# Enable mouse support on main dashboard.
#
with-mouse false
```

![](/assets/picgo/20bd21ab480ab4d27e19d81975ed1a38.png)

轻松选中指定元素,例如可以复制`ip`查看来源了,看不顺眼可以选择防火墙层面拉黑,都不允许进入`web`层面的`nginx`日志.

## 每日独立访客 - 包括网络机器人

> 访客不变,点击量陡增

![](/assets/picgo/4b943982383669e82f0ed729eff539eb.png)

猜测最忠实的粉丝只有网络爬虫,访客人数没有太大的变化而点击量陡增,那么原因很可以就是因为"小蜘蛛"!

## 请求的文件

> 通配符域名,非正常访问,疑似漏洞扫描 

![](/assets/picgo/8de846e30e1459d7ded63629fdec4962.png)

解决方法: 基于`nginx`配置处理所有未指定与域名的请求统一重定向到错误页面.

- 配置前

> 没有配置过的二级域名会重定向默认的通配符域名

![](/assets/picgo/2fe934d5cf250a43540b3979866a2a0e.png)

- 配置后

```bash
# 首先，为你的主站点和所有明确知道的二级域名配置server块  
server {  
    listen 80;  
    server_name example.com www.example.com;  
  
    # 你的主站点配置...  
}  
  
server {  
    listen 80;  
    server_name api.example.com;  
  
    # 你的API站点配置...  
}  
  
# 然后，添加一个捕获所有未明确指定的二级域名的server块  
server {  
    listen 80 default_server; # 使用default_server来捕获未明确指定的请求  
    server_name _; # 使用_作为server_name，它会匹配所有未明确指定的域名  
  
    # 重定向到主站点  
    return 301 $scheme://example.com$request_uri;  
  
    # 或者，如果你想显示一个错误页面，可以这样做：  
    # root /path/to/error/page;  
    # try_files $uri $uri/ =404;  
    # 这里你需要提前准备一个错误页面在/path/to/error/page/  
}
```

这样再次访问未指定的二级域名就是重定向指定路径,效果如下:

![](/assets/picgo/7d9a3394fa464d80758139c8774a8bf6.gif)

## 访客主机名和IP地址

来自国外的ip访问请求依然是很多,`HeadlessChrome` 无头Chrome浏览器,正常用户谁这么用啊?

如果是来自搜索引擎,那么欢迎您随意爬取,否则拉黑删除毫不客气!

![](/assets/picgo/f1bb30d53e1e64e6de20bda08f22b1a3.png)

```
Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.6533.99 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)

66.249.66.33
```

![](/assets/picgo/17f54aedfe0b75163e016f062d07d902.png)

## 操作系统

`Crawler`爬虫类用户代理不断有新的情况出现,需要定期更新维护,判断是否是恶意的爬虫.

![](/assets/picgo/6c5806c57980c2781845e5ad03b95823.png)

用户代理需要结合ip一起分析是否属于恶意爬虫,或者简单粗暴拉黑某些用户代理.

```
/facebookexternalhit|meta-externalagent|masscan|PetalBot|InternetMeasurement|SemrushBot|CensysInspect|YisouSpider|Engine|KrebsOnSecurity|DotBot|Custom-AsyncHttpClient|python-requests|axios|curl/
```

![](/assets/picgo/aa211175bf859b262284b5c6b530411f.png)

## 总结

本文主要介绍了使用`GoAccess`监控`Nginx`日志,帮助分析平时可能很少关注的点.

尤其是众多爬虫和ip,需要额外关注,根据爬虫的分类可以包括搜索引擎类别的小蜘蛛,也有专门用于营销的网络爬虫,更有甚者还有漏洞检测的爬虫.

如果这些爬虫是正规军,遵守`robots.txt`协议,那还好说,否则就需要自定义额外的处理逻辑来拉黑这些请求.

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 往期精彩文章

- [恨不相逢未嫁时的那么些电脑软件](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484698&idx=1&sn=c874dbfa2f3550b4ea1e88854d4ef80d&chksm=fd1f2cd0ca68a5c6dffa5bf67da755a09aee73d26bb97e67f42d18e0463d3cad2a2fe9e1703f&token=870849709&lang=zh_CN#rd)
- [如果能重来我会这么配置开发环境](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484699&idx=1&sn=bf678eda78398a89ed8c944314054427&chksm=fd1f2cd1ca68a5c7a55d5d9e61a7cf928082daeb6a3916b47d66c5659733c5124cf805371c03&token=870849709&lang=zh_CN#rd)
- [平生不识Charles,网络分析也惘然](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484761&idx=1&sn=9a0ec918d2a1c0b9cae94d794cff587b&chksm=fd1f2c93ca68a585c2f7278a8018baedfe95c68010b88f77b6743f4bd8dfc6e7b0562d1a953a&token=870849709&lang=zh_CN#rd)
- [如今还值得开发微信公众号开发吗](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485083&idx=1&sn=edeb79ba4dfe1d838e48bd1f1efd034a&chksm=fd1f2f51ca68a647fc8dcea35f6973dd36bcc0d50687a6dd2aa5761700e281dcf5c007f0d49e&token=110724280&lang=zh_CN#rd)
- [看我如何玩转测试微信公众号开发](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485114&idx=1&sn=0eb97f345505bb868e0c2b29c50ba577&chksm=fd1f2f70ca68a666e7e0ed08c7662b36d77617eb02d43f6014fffe0dadb1f7cd941984df3cb5&token=110724280&lang=zh_CN#rd)
- [又见Gitbook却卡在了安装这一步](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485189&idx=1&sn=e4ba7b0ad77ee2a6320360e1cb5fb6c3&chksm=fd1f2ecfca68a7d95b0f996696991aabc78d8e5efa1268e8e1434ca797c95c9bdddb5719d0ba&token=2002773743&lang=zh_CN#rd)
- [Gitbook插件开发又被npm绊倒了](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485185&idx=1&sn=2a5931d89ae19ca6b29f9b37bcbffa8f&chksm=fd1f2ecbca68a7ddf2cf036dac68587e7adaf0bbc5746254d3d3d42f7958582a2687390548e8&token=2002773743&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`



