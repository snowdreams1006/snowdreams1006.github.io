# JavaScript code获取操作系统

> Automa插件之js脚本小技巧：在浏览器环境下轻松判断操作系统

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 前提

在咱们日常使用的手机或者电脑上，每个设备和系统都有自己的“身份证”，这个“身份证”就是`navigator.userAgent`。

简单来说，它就像是浏览器在告诉网站：“嘿，我是XX浏览器，运行在XX操作系统上”。

通过这个信息，网站就可以知道你是用什么设备、什么系统来访问的，然后给你提供最适合你的内容或功能。

> Windows 电脑系统信息

![](/assets/picgo/f9f8e7ffbbdb55d633d8406aeaf2c612.png)

> Mac 电脑系统信息

![](/assets/picgo/8eb795ff92cfb95a2f0f2c6c093164ac.png)

下面,让我们看一下在不同的浏览器环境中,上述两种电脑操作系统分别有什么样的用户代理`navigator.userAgent`.

> 选择这两款浏览器是因为自动化浏览器插件`Automa`支持这两款浏览器,其他浏览器其他操作系统通通都不是我所关心的事情,哈哈哈!

![](/assets/picgo/571b74770298d81666541e4502128778.png)

## 实测

### Chrome 谷歌浏览器

> Windows

![](/assets/picgo/8a47c675416a800e517295869be5078a.png)

```js
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
```

> Mac

![](/assets/picgo/40da4fc68149f07f391a94f6445228ce.png)

```js
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
```

经过文本差异比较工具,**Chrome 谷歌浏览器**可以看出来`Windows`和`Mac`客户端浏览器环境下,用户代理`(Windows NT 10.0; Win64; x64)`部分和`(Macintosh; Intel Mac OS X 10_15_7)`不同.

![](/assets/picgo/e1a486f58bccb955b36226ee8c440331.png)

### Firefox 火狐浏览器

> Windows

![](/assets/picgo/c751e17a00d60d64eb357737740d3d86.png)

```js
Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0
```

> Mac

![](/assets/picgo/3dc49691e09bad377f36b1a7ee46b988.png)

```js
Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/116.0
```

同样地,文本差异比较工具能够看到**Firefox 火狐浏览器**,用户代理`(Windows NT 10.0; Win64; x64; rv:109.0)`部分和`(Macintosh; Intel Mac OS X 10.15; rv:109.0)`不同.

![](/assets/picgo/29d0c0521754b5b4161bc6bed40f64c4.png)

因此,在浏览器环境中通过js判断用户代理,可以推测操作系统是`Windows`还是`Mac`,这是可行的方案.

```js
// Windows-Chrome
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
// Windows-Firefox
Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0

// Mac-Chrome
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
// Mac-Firefox
Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/116.0
```

所以,经过分析可知,可以通过判断`navigator.userAgent`是否包含某些特征值来区分操作系统,可以实现如下代码:

```js
function getOperatingSystem() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    // Windows
    if (/windows/i.test(userAgent)) {
        return "Windows";
    }
    // MacOS
    if (/macintosh|mac os x/i.test(userAgent)) {
        return "Mac";
    }
    // Linux
    if (/linux/i.test(userAgent)) {
        return "Linux";
    }
    // 其他
    return "Unknown OS";
}

console.log(getOperatingSystem());
```

![](/assets/picgo/8d9c256aa83db9d6ab74ad0f67fb87bf.png)

## 应用

根据操作系统不同,设置不同的下载路径,从而实现不同操作系统同步时不再需要手动调整配置,一键启动.

简单举例说明一下实际使用起来是多大效果的提升,原来更新配置时经常性需要重新修改`download`下载路径.

![](/assets/picgo/89adbd576346551f64ccef1cd1766d4c.png)

现在可以根据自动化插件运行的浏览器环境而判断出操作系统,就可以不用显示声明下载路径等差异化配置,不用担心同步变更问题.

```js
{
    "download": "C:/Users/Administrator/Downloads/",
    "download-mac": "/Users/snowdreams1006/Downloads/",
    "download-win": "C:/Users/Administrator/Downloads/"
}
```

简单的升级改造实现了自动化机器人更进一步,得益于`js`脚本判断操作系统环境,解放了双手和重复的脑力输出.

![](/assets/picgo/0c2cf62c34797be68dcccef952ba10e0.png)

例如`Windows`编写好插件先上传到云端:

![](/assets/picgo/32e486f443a552c1724e15dd2c7ee6cc.png)

然后,在`Mac`电脑登录相同账号,从云端同步到本地,这样就可以保持最新代码逻辑,不用额外更改路径问题了!

![](/assets/picgo/13e86e7d10102b983da63a2bdb3d36dd.png)

## 总结

本文主要是在浏览器环境下通过编写自动化插件遇到的实际问题中寻找更为简单的解决方案,虽然客户端浏览器不像服务器端那样很简单的获取操作系统信息.

但是,经过实际测试发现,原来用户代理`navigator.userAgent`就能够简单推断出操作系统信息,从而可以根据不同的电脑应用不同的逻辑.

```js
function getOperatingSystem() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    // Windows
    if (/windows/i.test(userAgent)) {
        return "Windows";
    }
    // MacOS
    if (/macintosh|mac os x/i.test(userAgent)) {
        return "Mac";
    }
    // Linux
    if (/linux/i.test(userAgent)) {
        return "Linux";
    }
    // 其他
    return "Unknown OS";
}
```

没想到走到最后,还是自动化操作机器人比较靠谱,藏着掖着的api权限接口折腾人,真不如所见即所得的爬虫技术,想要获取公开数据还是很方便的,哇塞得很!

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