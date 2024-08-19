# 推送百度收录

> 在线发文: 百度搜索资源平台是废了还是真不行了?

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 引言

忘了有多久没有自动推送站点`sitemap.xml`到百度网站收录平台,与其等待小蜘蛛不知猴年马月去抓取网站,不如主动推送给小蜘蛛.

![](/assets/picgo/392cac323a44c7305439351161712c23.png)

然而,接下来一顿操作猛如虎,连续测试了两头发现一看啥用没有!

## 添加站点

> [百度搜索资源平台](https://ziyuan.baidu.com/site/index#/)

![](/assets/picgo/14872ea1806950feac1bea18a9d9d97c.png)

第一步：输入网站

> 百度资源站[添加站点](https://ziyuan.baidu.com/site/siteadd#/)

![](/assets/picgo/607e556ecd4ab581d79e485204a3325f.png)

第二步：站点属性

![](/assets/picgo/6325f093b06925835159e88f676cefe3.png)

第三步：验证网站

![](/assets/picgo/7c38052a14d7a300503f8d3ebb7ae8dd.png)

**https://www.snowdreams1006.cn验证成功！**

![](/assets/picgo/4d86d4fffaa2904ef0d51ac7e1371092.png)

## 资源提交

**sitemap**

![](/assets/picgo/815e134cf1afe79705d520ff77e2deef.png)

注意看,`sitemap`提交方式最下面有这么一条说明: 填写站点的主体备案号，可以提高每日提交上限。

![](/assets/picgo/4697795fcc548f5f9ff9c58cd6993e04.png)

这里提交了备案号,然后最后那条注意事项确实消失了.

![](/assets/picgo/1507f5eb2e3f505e4d48eeddd82cf608.png)

**手动提交**

先手动提交的方式测试一下能否正常使用,一次性不能超过20条链接,每行一个.

![](/assets/picgo/f6142f8d4f1c5da6e85c5081dffced8b.png)

但是提示了我已到达限额,然而并没有提交过,也没有查到提交记录,哪怕是等到了凌晨12点后的第二天也是如此.

![](/assets/picgo/23dc8b644eb9ccb62f568b9f12fcf5cb.png)

> 您今日的链接提交量已达上限，请改天提交

**API提交**

换成了`API`提交方式,依然不出意外的出现了意外,准备好了`urls.txt`文件.

![](/assets/picgo/980a18ca904d6936d25e78817a1d0e0d.png)

按照`curl`示例请求提交链接,结果返回同样的错误提示: `over quota`

![](/assets/picgo/4e60e1ec3a2df61780568dfba7e1d8cd.png)

> {"error":400,"message":"over quota"}

## 总结

累了,毁灭吧!

普通收录方式中的`sitemap`一次性提交网站链接,不知道是没有权限还是什么问题,输入框不可点击!
而手动收录和`API`收录均提示已超额,更别说快速收录了.

![](/assets/picgo/4176846d256cb28b4450f9a991fdd5c3.png)

经过实测发现,只有[提交非验证站点链接](https://ziyuan.baidu.com/linksubmit/url)这个入口.

![](/assets/picgo/164d9aa230cd5808ace3e02b1ac75415.png)

但是只能一条一条提交,每次还要旋转图片验证就很麻烦,只能说一次一提交,不能批量一次性提交全部链接.

![](/assets/picgo/54c4d88731ca86a706544e15ff92bba0.png)

最终结论就是百度资源搜索平台大概率是废了,注册账号验证资料啥的折腾了一圈然并卵.

如果有哪位小伙伴遇到过相同的问题,还望不吝赐教,不胜感谢!

![](/assets/picgo/fb524850fd21349e361662a5576b4c36.png)

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 往期精彩文章

- [爬虫识别，从此天下再无真假李逵！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485327&idx=1&sn=8c9d9f22f6684fae042a965daddb2cb5&chksm=fd1f2e45ca68a753308e22cbe434fdfd4ebd7194d13043f049dc4f859cde08204b0bd2d6d605&token=1978665065&lang=zh_CN#rd)
- [Automa插件之js脚本小技巧：在浏览器环境下轻松判断操作系统](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485303&idx=1&sn=c1313f02dd5d5fe026c0df24ea993fc0&chksm=fd1f2ebdca68a7ab1857dada18197666db99d0dc8c2311faa5505fd871da62eb04765629b483&token=1978665065&lang=zh_CN#rd)
- [npm包更新发布：从准备到发布的全面指南](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485273&idx=1&sn=8af13a8fa81e35d3d83d557f6976c772&chksm=fd1f2e93ca68a785500e7bfc80da858a88cbc1b1f9313c998e8d4c5abbe21931ac79fdf77617&token=1978665065&lang=zh_CN#rd)
- [解锁微信公众号新技能！一键上传图片秒获URL，永久素材管理全攻略，让内容创作如虎添翼！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485250&idx=1&sn=4d8618568b3cf3a5420d3c7f5225c36b&chksm=fd1f2e88ca68a79eb73aa616059ea465db9770de5bac880c9a2473d0e614467b8919680fbdfd&token=1978665065&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=1978665065&lang=zh_CN#rd)
- [揭秘GitBook神器插件：一键伪装最新发布，SEO收录飙升的秘密武器！让你的内容秒变热门头条！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485192&idx=1&sn=b127c0f69099e5498b0dc914ee298ebd&chksm=fd1f2ec2ca68a7d4d9104c5bd770a7f1b0f83dbc042a37bce8dce7aab0279c3117143c2d550a&token=1978665065&lang=zh_CN#rd)
- [Gitbook大揭秘！从崩溃到丝滑运行，一键解决TypeError难题，你也能成为代码修复大师！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485189&idx=1&sn=e4ba7b0ad77ee2a6320360e1cb5fb6c3&chksm=fd1f2ecfca68a7d95b0f996696991aabc78d8e5efa1268e8e1434ca797c95c9bdddb5719d0ba&token=1978665065&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`