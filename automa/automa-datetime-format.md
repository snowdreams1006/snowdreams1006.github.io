# Automa 系列教程之 Javascript Code 日期时间格式化

> Automa插件之js脚本小技巧：零依赖的日期时间格式化,亲测好用!

![微信公众号「雪之梦技术驿站」](/assets/picgo/6f3b53a1d54f77563e71b92645f520a7.gif)

> **致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标 ★ ” 加上星标，就不会找不到我啦！

## 背景

![](/assets/picgo/1fc32408008db50a9dff99976278ad2b.png)

在使用 Automa 插件自动下载文件时,有时候需要根据当前时间重新命名文件,如果是时间戳的话倒是也可以防重复文件命名,只不过那样的话,没有了时间可读性.

![](/assets/picgo/0251dc441c583a8d476f833ffaf9c1bd.png)

所以需要日期时间格式化,分享一个一直在用的纯 js 格式化日期脚本,可实现简单的日期格式化.

> 文末附完整代码,直接复制开箱即用,只要是纯 js 环境都适用!

## 实战

打开浏览器内置控制台,输出`new Date()`获取当前日期,或者`new Date().toLocaleString()`能够获取本地化日期时间字符串.

如果不在乎`'2024/10/10 23:45:45'`这种形式的话,内置方法已经可以满足要求了,但是我更习惯`'2024-10-10 23:45:45'`这种格式,可能是`Java`日期格式化的影响吧!

![](/assets/picgo/583ca3243e4d593180af84d0742c7dd3.png)

测试上述代码片段,支持常见的各种格式:

```js
format(new Date(), 'yyyy-MM-dd HH:mm:ss')

format(new Date(), 'yyyy/MM/dd HH:mm:ss')
```

在`Automa`插件浏览器自动化中使用也很简单,模糊搜索`Javascript`定位到代码块,将其拖到到编辑器再双击编辑`Js`代码,这里就以开头的下载文件自定义命名为例.

![](/assets/picgo/f6c6531282769da5e39f2c162d6a3a13.png)

这里是根据当前时间自定义下载文件名称,从而能够根据文件名称直观看出了当初的下载时间.

![](/assets/picgo/717e190c744f4e76b74b25a7b8d64dbf.png)

## 总结

本文主要介绍了在使用`Automa`浏览器插件自动化开发的过程中,遇到日期时间格式化的需求,分享了亲测好用的脚本,当然也不仅仅是`Automa`环境,能运行`Js`的地方都可用,零依赖,很好用!

![](/assets/picgo/cd9f7e9d2938f5974adc667be85e1c78.png)

## 往期精彩文章

- [正在寻找 ToDesk 的平替,不妨试试这款免费好用的远程控制软件](https://mp.weixin.qq.com/s/xWDu1rzRgrarFuuIMzRD4w?token=966863382&lang=zh_CN)
- [劝你别这样 JS 开发者控制台,非不信?无限 debugger 总算老实了吧!](https://mp.weixin.qq.com/s/OCrYP6W42aB-RSPqA6-A9A?token=966863382&lang=zh_CN)
- [Automa 插件之 js 脚本小技巧：在浏览器环境下轻松判断操作系统](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485303&idx=1&sn=c1313f02dd5d5fe026c0df24ea993fc0&chksm=fd1f2ebdca68a7ab1857dada18197666db99d0dc8c2311faa5505fd871da62eb04765629b483&token=1806469695&lang=zh_CN#rd)

![](/assets/picgo/31f9180b2c2601eb166e885a92d804e3.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`

![](/assets/picgo/5b049d5aab84c068fdc306ca90006bf7.jpg)
