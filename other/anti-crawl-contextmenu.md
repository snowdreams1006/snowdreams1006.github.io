# 反爬之禁止右键菜单

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标 ★ ” 加上星标，就不会找不到我啦！

![](/assets/picgo/30828e0c0c66020557a08b7b107c07bc.png)

## 引言

最近正在使用`uniapp`开发小程序,是一种跨平台技术,一次开发可以部署到多种环境,于是也顺手部署了`h5`网页版.

![](/assets/picgo/0c7be5c77f3b28b44d56ee3b47f02129.jpg)

但是,突然想到那背后脆弱的接口设计,又不禁冒出一阵冷汗,也欢迎大家学习研究(结尾附网站地址)!

所以为了防止别有用心好奇宝宝窥探我的网站秘密,必须要做点什么整活,正在写文章的时候发现了右键菜单功能,给我提供了灵感.

![](/assets/picgo/0bd026fd6af40bfc0a66ee8158a668d7.png)

我也可以这么玩的呀?不能右键也不影响我网页的功能,不影响用户体验,那我就直接禁用右键菜单就好了啊!

## 前提

查询了资料发现 js 的 `document.oncontextmenu` 定义了用户网页上**击鼠标右键**时触发的行为,通过重写处理逻辑就可以实现有趣的自定义行为.

例如默认情况下,当用户右键点击网页上的任何元素时,浏览器会显示一个包含如"查看页面源代码"等选项的上下文菜单.

![](/assets/picgo/3657f46ccf8e066d71897ddafec23463.png)

但是,通过 Js 自定义`document.oncontextmenu`事件处理函数,可以阻止这个默认行为并替换为自定义行为.

![](/assets/picgo/19d385eb312064eaa3d8281f6bb37c56.png)

## 实现

下面是一个简单的示例,展示了如何阻止右键菜单的显示,并在控制台中输出一条消息:

```js
document.oncontextmenu = function(event) {
    event.preventDefault(); // 阻止默认行为（即显示上下文菜单）
    console.log('别动我的网站,它怕痒!');
    alert('别动我的网站,它怕痒!');
    return false; // 在某些情况下，返回false也可以阻止默认行为
};
```

![](/assets/picgo/19d385eb312064eaa3d8281f6bb37c56.png)

> 注意事项: 上述行为直接限制鼠标右键菜单,可能会降低用户体验,请仔细考虑其利弊.

在一些情况下,你可能希望在**某些特定元素上允许右键菜单**,而在其他元素上阻止.

这时，你可以通过为这些特定元素添加 `oncontextmenu` 事件监听器来实现,而不是为整个文档`document`添加.

![](/assets/picgo/4f64eb4269eda2a0b2db5c48add5dc80.png)

本着学习的心态,继续研究目标网站,果然发现了关于`contextmenu`事件的蛛丝马迹.

![](/assets/picgo/8c0725f21051f2ac5bb64e8db9dc9c42.png)

于是我们也可以模拟实现这种自定义右键菜单行为,通过将`document`对象替换成具体的元素既可.

```js
document.querySelector("编辑器元素的CSS选择器").oncontextmenu = function(event) {
    event.preventDefault(); // 阻止默认行为（即显示上下文菜单）
    console.log('别动我的网站,它怕痒!');
    alert('别动我的网站,它怕痒!');
    return false; // 在某些情况下，返回false也可以阻止默认行为
};
```

![](/assets/picgo/f47aaf02b7039386b95ed89bab334ffe.png)

非常简单实现了,自定义右键鼠标的行为,这样就可以拦截右键弹窗,当然也可以自定义右键菜单.

## 总结

本文主要介绍了在 js 中如何自定义鼠标右键的行为,不仅可以对整个网页生效也可以针对特殊元素定制右键行为.

![](/assets/picgo/8bc7627abd896e8072a6487683b6dd0c.png)

但是,不得不说一点,简单粗暴禁止右键菜单的行为虽然拦截了默认的**检查**或者说**查看网页源码**等选项,但是并不保险,只能勉强算是一定程度上反爬措施吧!

时间也不早了,先上线再说,等有时间再继续研究,有兴趣的朋友[下手轻点](https://vip.snowdreams1006.cn/ "下手轻点")~

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 往期精彩文章

- [谁家爬虫这么明目张胆?连 UserAgent 都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=1806469695&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [解锁 Nginx 日志的宝藏：GoAccess——你的实时、交互式 Web 日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&chksm=fd1f2a06ca68a3105e948e6a1db7098fadd6e5e74fe0cbb87ce736af749611df9611db9216fe&token=312545539&lang=zh_CN#rd)
- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484698&idx=1&sn=c874dbfa2f3550b4ea1e88854d4ef80d&chksm=fd1f2cd0ca68a5c6dffa5bf67da755a09aee73d26bb97e67f42d18e0463d3cad2a2fe9e1703f&token=312545539&lang=zh_CN#rd)
- [恋爱年龄差背后的秘密](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484177&idx=1&sn=bb9e916c34bfaa9c4559a556df295d48&chksm=c21502f2f5628be4149cf91a652d500b23b1c1da2279fd6a09990c1967c0f8a52d3a5995bb5c&token=658409695&lang=zh_CN#rd)
- [每天一道美味佳肴《糖醋排骨》](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484315&idx=2&sn=dc77fadf4cd5dd3a22bf055b3fee300f&chksm=c2150278f5628b6eb64dd78ebef9d0dda668bdef2a5d73214a1f622235a00212dbcae7058092&token=658409695&lang=zh_CN#rd)

![](/assets/picgo/33e4b08a5627c640882495f1267f9318.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
