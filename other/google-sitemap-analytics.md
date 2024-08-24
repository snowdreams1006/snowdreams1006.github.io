# 教你两步实现个人网站被谷歌快速收录

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 引言

一直以来,个人博客网站同时部署了个人云服务器和github静态托管,毕竟是中文技术知识免费分享,总以为爬虫也是国内爬虫居多,实际上依然是谷歌搜索占比相对较高!

不论是自己云服务搭建的日志监控平台数据,还是谷歌统计,百度统计各自平台的数据都反复验证了这一点.

![](/assets/picgo/5edd31e05d4d2140ec7602d3efcbf2f9.png)

> `nginx`日志大屏可视化请参考: [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&chksm=fd1f2a06ca68a3105e948e6a1db7098fadd6e5e74fe0cbb87ce736af749611df9611db9216fe&token=1806469695&lang=zh_CN#rd)

百度统计平台的数据分析,同时监控了[国内博客地址](https://blog.snowdreams1006.cn/)和[github博客地址](https://snowdreams1006.github.io/).

![](/assets/picgo/d098b68fef8339e9678d7afd4398ee88.png)

同样的,谷歌统计平台也有类似的结论,因此还是谷歌流量更大一些.

![](/assets/picgo/4dd0cd21b937c7813208db2196635183.png)

没有对比就没有伤害,还是github的流量比较大一些,比个位数好看多了.

![](/assets/picgo/bc76f64423deb415efae07f33c79093b.png)

所以接下来就分享一下如何教你提交谷歌收录.

## 提交谷歌收录 

欢迎使用 [Google Search Console](https://search.google.com/search-console/welcome)

添加网址前缀,如下:

```
https://snowdreams1006.github.io/
```

![](/assets/picgo/04da9bc843d14d1110bb5f678640036b.png)

添加新的站点地图

> 前提是先生成站点地图`sitemap.xml`文件并防止到网站根目录下,能够直接访问该文件内容.

```
https://snowdreams1006.github.io/sitemap.xml
```

![](/assets/picgo/c81b62e3cec4e9c68cd42e37520a1514.png)

已成功提交站点地图

![](/assets/picgo/d07ab9c6ffec1b86953ded6cfe61f64f.png)

已提交的站点地图

![](/assets/picgo/b1a73a5a8619d3531854aa66c1ee72ef.png)

已成功处理站点地图

![](/assets/picgo/4f261251daeb46dc8bdc52bb40dfa701.png)

由于网络问题,经过测试访问国内网站反而不太容易成功,验证网站时建议选择添加`TXT`解析记录,更容易验证成功.

## 验证谷歌收录

经过上一步提交了站点地图`sitemap.xml`之后就耐心等待谷歌爬虫抓取网站内容即可,接下来的事情就是每次更新网站时候自动更新站点地图文件.

幸运的话,一段时间后,当你再次打开浏览器输入以下搜索语句验证一下网站是否被谷歌收录.

```
site:snowdreams1006.github.io
```

![](/assets/picgo/612463dd5265707fe3b8fc51cc252956.png)

实际上,图中圈中的教程八百年没有及时更新了,但是收录结果却是三四天前,是否好奇如何做到的?

![](/assets/picgo/34e3054434621e4d73308684897815c6.png)

## 谷歌分析

为了检测谷歌收录的数据,可以注册并登录[谷歌分析](https://analytics.google.com/)网站,为每一个页面植入统计代码.

点击创建

![](/assets/picgo/087f08e66e2aaeedcfaa892140aa2133.png)

创建媒体资源

![](/assets/picgo/e5ca7e833cef4ba108bb7fed8b9c109c.png)

填写商家描述

![](/assets/picgo/15cbdd340135e2128442101550578ef3.png)

选择您的业务目标

![](/assets/picgo/da096113d360d7048d99d3fdecff5031.png)

开始收集数据

![](/assets/picgo/4d0d9545eb66a2dfaba9a82b47bc0569.png)

设置数据流

![](/assets/picgo/1f91b5499f6a58d8c7f3228eaf919959.png)

选择设置 Google 代码的方式

![](/assets/picgo/1043e21fa9275491b8ae67c4091a4e4d.png)

测试安装情况

![](/assets/picgo/d8fd4021f3acc19bc5f7af232146b7bb.png)

上传更新网站后再次验证

![](/assets/picgo/cbf03287f45682c6458631343f2c1046.png)

在您的网站上正确检测到了 Google 代码。

![](/assets/picgo/018544125f608b44e6ab79148eb548ae.png)

网站数据流详情

![](/assets/picgo/4dcd58560df542c69ccd767640ce8e11.png)

Google 代码如下

```js
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-XXXXXX');
</script>
```

![](/assets/picgo/02973167695764ca92a73a7c77fb69bd.png)

正在等待收集数据

![](/assets/picgo/3a4352fdfad2bbafcc64928abf7c7c88.png)

您的数据收集功能处于启用状态 🎉

![](/assets/picgo/968766d42ff5fdbb0bd26371aff42468.png)

按照提示设置助理,按照提示个性化设置.

![](/assets/picgo/62eba6319335eb3d4d85aa67b85a9c2b.png)

## 总结

本文主要介绍了如何快速提交站点地图`sitemap.xml`到谷歌搜索,并通过集成谷歌分析代码,深入分析网站流量情况.

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 往期精彩文章

- [让人又爱又恨的百度爬虫?这一次我选择了主动投怀送抱!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485385&idx=1&sn=90e8565eeb0b8982ff18655353d2c203&chksm=fd1f2e03ca68a715c1822c3e45d846d24148ab88ade621eb0bdce6abe09e6dffd75b51af8954&token=1806469695&lang=zh_CN#rd)
-[在线发问: 百度搜索资源平台是废了还是真不行了?](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485352&idx=1&sn=4bb8b9273b7cc8b5eb0365032eb9141f&chksm=fd1f2e62ca68a7741c43ad3f9b9dfdd91b19323bf52ad09fa99d900e6cbaba6115623280de05&token=1806469695&lang=zh_CN#rd)
- [爬虫识别，从此天下再无真假李逵！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485327&idx=1&sn=8c9d9f22f6684fae042a965daddb2cb5&chksm=fd1f2e45ca68a753308e22cbe434fdfd4ebd7194d13043f049dc4f859cde08204b0bd2d6d605&token=1806469695&lang=zh_CN#rd)
- [Automa插件之js脚本小技巧：在浏览器环境下轻松判断操作系统](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485303&idx=1&sn=c1313f02dd5d5fe026c0df24ea993fc0&chksm=fd1f2ebdca68a7ab1857dada18197666db99d0dc8c2311faa5505fd871da62eb04765629b483&token=1806469695&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=1806469695&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`