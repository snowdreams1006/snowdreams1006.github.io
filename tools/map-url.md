# 给你一个坐标告诉我在哪

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.
  
现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/478bce29701d85c60553d9ddc3d1afea.gif)

## 引言

平时经常性涉及到gps坐标位置展示功能,给定坐标直接跳转到网页地图这种常见的效果不用自己开发,直接使用公开链接就可以了,现在整理总结一下,也是一种记录.

## 方案 

- GPS坐标数值

例如下面这种给定了gps的名称和坐标,列表展示数据不太直观,点击坐标能直接跳转到地图服务能稍微好一些.

> 浙江省/杭州市/临安市/青山湖街道: 经度/lng;纬度/lat

```
{"lng":"119.843582","lat":"30.246313"}
```

![](/assets/picgo/ae4b6cf7358fa1c9fd7e59ba8781312e.png)

- 坐标地图

为了实现上述目的,可以使用百度地图的直达链接,拼接出自己的坐标链接,用户点击就能直接跳转到网页版地图.

> 百度地图直达链接: [30.246313,119.843582](http://api.map.baidu.com/marker?location=30.246313,119.843582&title=青山湖街道&content=浙江省/杭州市/临安市/青山湖街道&output=html)

`http://api.map.baidu.com/marker?location=30.246313,119.843582&title=青山湖街道&content=浙江省/杭州市/临安市/青山湖街道&output=html`

**主要参数有三个**,分别是坐标`location`,其中纬度在前,经度在后,并用英文逗号隔开;标题`title`,内容`content`,替换掉相关参数就能实现自定义百度地图直达链接.

![](/assets/picgo/34133f603f6fc6eb93b284e555ccd22d.png)

除了国内坐标,同样也**适用于国外坐标**: `54.92618179,20.15727806`

[http://api.map.baidu.com/marker?location=54.92618179,20.15727806&title=国外地点标题&content=国外地点描述&output=html](http://api.map.baidu.com/marker?location=54.92618179,20.15727806&title=国外地点标题&content=国外地点描述&output=html)

![](/assets/picgo/ddecf94b30280276048a2d4b135d1ac3.png)

最终实现的效果如下:

![](/assets/picgo/bd4fc4df9db946ce184dcf05b5e14759.gif)

- 坐标拾取器

什么?你说没有具体的坐标怎么做地图链接?很简单,百度搜索一下"坐标拾取器"就可以按照名称得到坐标点,然后就能得到自己的专属地图链接.

> [百度坐标拾取器](https://api.map.baidu.com/lbsapi/getpoint/index.html)

![](/assets/picgo/6024dafed5521a26288f2f0934e9031b.gif)

同样的方法也适合高德地图,经测试发现高德地图不支持国外地点,这里也做一下相关说明吧!

> 浙江省/杭州市/临安市/青山湖街道: 经度/lng;纬度/lat

```
{"lng":"119.843582","lat":"30.246313"}
```

[https://ditu.amap.com/regeo?lng=119.843582&lat=30.246313](https://ditu.amap.com/regeo?lng=119.843582&lat=30.246313)

其中参数`lng`是经度,`lat`是纬度,是单独区分出来的,别弄错了.

![](/assets/picgo/10ba9c2066876563812e166374f5eb0f.png)

如果是国外坐标`54.92618179,20.15727806`,其中纬度`lat`是**54.92618179**,经度`lng`是**20.15727806**,按照上述规则拼接高德地图网页版链接如下:

[https://ditu.amap.com/regeo?lng=20.15727806&lat=54.92618179](https://ditu.amap.com/regeo?lng=20.15727806&lat=54.92618179)

![](/assets/picgo/17b88968c40a2f43915f4aa7d5e4eee2.png)

同样的,高德坐标拾取器的链接如下:

[https://lbs.amap.com/tools/picker/](https://lbs.amap.com/tools/picker/)

![](/assets/picgo/92e308d1d39b1f9da12a8a3068d21feb.png)

## 总结

本文主要总结了如何通过gps坐标拼接处一条可直接跳转到网页地图的在线链接,包括了百度地图和高德地图都有相关的公开服务.

如果没有地点gps坐标也可以用坐标拾取器获取坐标,针对国内外不同的坐标,有些数据可能更加详细,有些只是粗略的位置,具体情况还要以实际为准.

- 百度地图自定义链接: `http://api.map.baidu.com/marker?location=改为自己的纬度,改为自己的经度&title=改为地点名称&content=改为地点描述&output=html`
- 百度地图坐标拾取器: `https://api.map.baidu.com/lbsapi/getpoint/index.html`
- 高德地图自定义链接: `https://ditu.amap.com/regeo?lng=改为自己的经度&lat=改为自己的纬度`
- 高度地图坐标拾取器: `https://lbs.amap.com/tools/picker/`
![](/assets/picgo/c1a8f476bb6f8ef95a86575da9fb546e.gif)

## 往期精彩文章

- [C 盘爆满飘红不用怕,教你三招搞定它,轻松释放几十 G 的磁盘空间!](https://mp.weixin.qq.com/s/fzhPp_9Nze5znnJdOlT6-g?token=327782893&lang=zh_CN)
- [Mac版本Burpsuite下载安装超详细教程,专业版中文激活教程(附下载)](https://mp.weixin.qq.com/s/CqBcQpZYLY33iF0DdWrdiA?token=327782893&lang=zh_CN)
- [Burpsuite下载安装超详细教程,社区版永久有效,专业版汉化激活到2099年,不看会后悔系列,亲测好用!](https://mp.weixin.qq.com/s/lQuBxUPPwx0cFdhGo9YWEg?token=327782893&lang=zh_CN)
- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)

## 欢迎扫码关注
                  
![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`



