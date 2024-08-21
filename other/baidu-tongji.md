# 集成百度统计

> 让人又爱又恨的百度爬虫?这一次我选择了主动投怀送抱!

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 引言

前几天打算将网站提交到[百度搜索资源平台](https://ziyuan.baidu.com/linksubmit/)供小蜘蛛爬取,本想着一劳永逸提交站点地图`sitemap.xml`文件,结果发现似乎没有相关权限.

![](/assets/picgo/6cd7586ba2b855bf80f8c4202d79e188.png)

手动提交的方式是可以的,当然也在这里直接[提交非验证站点链接](https://ziyuan.baidu.com/linksubmit/url)

![](/assets/picgo/30046209eb4c42f17fa3d67a33c5e6d1.png)

但是手动提交的方式就是会出现验证码,摆正图案验证让我很心烦.

![](/assets/picgo/1e2d7e33ec89c57eb6ff0bd0ab67600a.png)

既然能够正常提交网址,那么**API提交**方式应该也是可以的,刚开始直接推送了全站的链接,提示配额不足.

```bash
{"error":400,"message":"over quota"}
```

手动修改提交链接的数量,再次推送就可以了,说明确实是配额问题,只不过后台一直没有看到具体的配额信息.

![](/assets/picgo/4258430f8a8f4f69edfd1fe91182893e.png)

```bash
{"remain":8,"success":1}
```

加上之前手动提交推送的链接,所以目前每日总链接配额10个.

![](/assets/picgo/9b5a0d3b3272b6409da9ce204b44ce5d.png)

**普通收录使用说明**

> 1、普通收录工具可以向百度搜索主动推送资源，缩短爬虫发现网站链接的时间，不保证收录和展现效果。
>
> 2、API提交和手动提交共享配额，sitemap提交配额不与其他方式共享，具体配额以站点页面显示数据为准 。配额不可累计，当日有效。
>
> 3、若链接存在跳转关系，请直接提交跳转后链接。如网站换域名，需提交新域名资源；进行HTTPS改造页面，请提交HTTPS资源。

## 验证

按照上述测试得知,当前每日限额是10个链接,还剩余8条链接,于是再次推送剩余链接,每日推送不用白不用.

```bash
$ curl -H 'Content-Type:text/plain' --data-binary @urls.txt "http://data.zz.baidu.com/urls?site=https://blog.snowdreams1006.cn&token=XXXXXX"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   525  100    24  100   501    124   2605 --:--:-- --:--:-- --:--:--  2763{"remain":0,"success":8}

```

![](/assets/picgo/fd6f1223b7507632e894950cd4836524.png)

但是我怀疑百度和我总有一方是出错的,后台数据统计看不到提交过的痕迹.

![](/assets/picgo/729ca77ea0179d5d6a23f9bc9fb499e6.png)

直接在浏览器搜索`site:blog.snowdreams1006.cn`站点结果,只有一条手动推送的记录.

![](/assets/picgo/e71bbfbc1f2d423999b4abc7bb9786d0.png)

当然也不排除`API提交`方式还没有立即被收录的可能性,等待一段时间再试试或许会不一样.

## 百度统计平台

经过百度搜索资源平台主动推送网站链接后,想要进一步分析网站来源流量信息,除了直观感受引流效果,更想知道具体的数据效果,那么网站页面中进行埋点统计肯定是不错的选择.

![](/assets/picgo/9ff07c8dc44f916efb6bbb51a0d1ba6e.png)

[注册并登录百度统计平台](https://tongji.baidu.com/web5/welcome/login)就是这么的作用,可以直观感受数据统计的魅力,帮助更好的看到数据效果.

![](/assets/picgo/e4b5547429f995cd4159c5cf037841d0.png)

不出意外的是,最忠实的粉丝就是各种爬虫,数据不会说谎只会造假.

![](/assets/picgo/baa7dbd49040a9e2ceae3b754b8c9574.png)

在代码设置中获取新版统计代码,然后插入到网站的每个页面中即可.

```js
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?XXXXXX";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
```

![](/assets/picgo/65455a9417ba8212e67f9039a45421f1.png)

确保网站已更新,每个页面都有这么一段百度统计代码:

![](/assets/picgo/3e37cc7974ee1e52c4a551d757cfeca7.png)

然后再使用**代码安装检查**工具进行检测是否安装正常:

![](/assets/picgo/45c5ccc3c2aebc8f851f6a97c9c4d52c.png)

针对新网站首次监控也是类似的逻辑,添加网站植入统计代码.

![](/assets/picgo/7e1b0ab212dca7777216a31deff0b2e2.png)

填写好网站基本信息后,即可获取统计代码.

![](/assets/picgo/93a9aa6365258544df867e2342657759.png)

根据不同的网站安装方式不一样,最终的效果如下

![](/assets/picgo/2a3f6339661c9d2d75f27910da87fd9f.png)

网站插入统计代码后,再次检测是否安装成功

![](/assets/picgo/c1af3b3b626ea6c9f247e81057526ea8.png)

当然这是还没来得及更新网站的错误示例,等网站更新成功检测结果应该是这样的.

![](/assets/picgo/52e2341d8e4c45b14c6a78dd1400a542.png)

## 总结

本文主要介绍了如何将自建网站提交给百度搜索引擎,实测下来只有手动提交和api提交两种方式可用,并且每日额度有限.

![](/assets/picgo/9113540f57c4681d90d4a02d72d243e7.png)

如果想要进一步分析网站流量情况,可以集成百度统计平台,将统计代码植入到每一个网站页面中,这样就能看到统计数据.

![](/assets/picgo/248ccc6204255bd4071b1c8747314465.png)

最简单检测网站收录的情况,可以直接搜索`site:blog.snowdreams1006.cn`看到被各大搜索引擎搜索结果.

![](/assets/picgo/132de81607872fb9e67a6ac642b7d3c8.png)

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 往期精彩文章

-[在线发问: 百度搜索资源平台是废了还是真不行了?](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485352&idx=1&sn=4bb8b9273b7cc8b5eb0365032eb9141f&chksm=fd1f2e62ca68a7741c43ad3f9b9dfdd91b19323bf52ad09fa99d900e6cbaba6115623280de05&token=1806469695&lang=zh_CN#rd)
- [爬虫识别，从此天下再无真假李逵！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485327&idx=1&sn=8c9d9f22f6684fae042a965daddb2cb5&chksm=fd1f2e45ca68a753308e22cbe434fdfd4ebd7194d13043f049dc4f859cde08204b0bd2d6d605&token=1806469695&lang=zh_CN#rd)
- [Automa插件之js脚本小技巧：在浏览器环境下轻松判断操作系统](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485303&idx=1&sn=c1313f02dd5d5fe026c0df24ea993fc0&chksm=fd1f2ebdca68a7ab1857dada18197666db99d0dc8c2311faa5505fd871da62eb04765629b483&token=1806469695&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=1806469695&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`




