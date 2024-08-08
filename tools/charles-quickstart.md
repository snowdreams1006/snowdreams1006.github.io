# 【技术干货】一探究竟：揭秘 Charles 让数据“原形毕露”的神器功能！

大家好，今天我们要探讨的是那个让程序猿们梦寐以求的网络调试捕手 —— `Charles`。你是否还在为网页加载慢、APP 数据传输异常这些问题头疼不已？那么，就让 `Charles` 来助你一臂之力，让我们的数据问题迎刃而解！

![](/assets/picgo/edb10194f9ecbf3c5dccf47533f8941d.png)

> 文本有注册码,亲测可用,如果失效后台私信回复`Charles`获取最新下载地址!

Charles 数据抓包全攻略：轻松掌握网络请求的秘密

在这个移动互联网时代，无论是开发 APP 还是进行网络安全测试，能够捕获并分析网络请求都变得尤为重要。Charles，作为一款强大的 HTTP 代理和监视工具，成为了众多开发者和测试人员的首选。今天，我们就来详细解析 Charles 的使用技巧，带你轻松掌握网络请求的秘密。

## 一、Charles 初印象：不只是代理那么简单

Charles 不仅仅是一个 HTTP 代理，它更是一个强大的网络请求监视器。它能够捕获并显示你机器与互联网之间的所有 HTTP 和 SSL/HTTPS 流量，包括请求、响应以及 HTTP 标头（如 cookie 和缓存信息）。这种能力使得 Charles 在移动开发、网络安全测试以及第三方应用通讯协议分析等领域大放异彩。

![](/assets/picgo/95d4c993d4379a8a9f5fa5ad3a5dee05.png)

## 二、快速上手：Charles 的安装与配置

### 下载与安装

访问[`Charles`](https://www.charlesproxy.com/ "`Charles`")官网，根据你的操作系统选择合适的版本进行下载。安装过程简单明了，按照提示操作即可。安装完成后，打开`Charles`，你将看到一个简洁而功能强大的主界面。

点击`更多信息`选择`仍要运行`继续继续安装,跟着安装提示一步步操作既可安装成功.

![](/assets/picgo/192afd0c9b07fcd0c674bb342f272f5c.png)

![](/assets/picgo/f113bfabe0ad0df405ef2eb35f1b42c3.png)

当然安装的过程中也可以更改默认的安装位置,下载最新的安装包会提供`30`天的免费体验服务.

![](/assets/picgo/5a222287ef0179f16ed865f582da9f7c.png)

主要体现在启动画面会有大概`5秒钟`的延迟提醒,有条件的话请支持正版,保护版权.

![](/assets/picgo/0b993f036e6a5204a70c75b0b5816dd5.png)

输入注册码注册成功后会解锁延迟启动画面,享受`vip`抓包待遇,就像这样!

![](/assets/picgo/63758c1238a84aa586d758ff3995f777.png)

## 三、SSL/HTTPS 抓包：解密安全传输的奥秘

如果你正在分析的网络请求是`http`请求,那么正常安装后既可直接使用,不需要关注这一段`SSL`代理服务器的内容.

![](/assets/picgo/08dfa2fd538ce2801b29e0e7ef9c5bdf.png)

遗憾的是,大多数网络请求都携带了`https`证书,因此需要额外的准备安装才能抓取这部分请求,否则的话是看不到具体请求数据的哟!

`harles`通过`SSL`代理功能，让我们能够以纯文本形式查看`SSL/HTTPS`请求和响应。这一过程需要安装`Charles根证书`，并在`SSL Proxying Settings`中启用`SSL代理`。设置完成后，你就可以像查看 HTTP 请求一样轻松查看`HTTPS`请求了。

### 安装 SSL 根证书

这一步是必选操作的步骤,将`Charles`根证书安装到系统受信任的根证书颁发机构,是代理`SSL`的前提!

> `Help --> SSL Proxying`

在顶部菜单栏选择`SSL Proxying` 开始`SSL`的设置:

![](/assets/picgo/898fa4d178ff15d937a07860fabc3ef8.png)

然后点击`Install Charles Root Certificate`安装根证书

![](/assets/picgo/17dbdea371092d031920219cfe0bc5a5.png)

稍后会系统中会出现安装根证书的操作引导步骤,点击`安装证书`.

![](/assets/picgo/718145600788311fa7d3ae9e755f5731.png)

点击`安装证书`,然后`确定`进行下一步.

![](/assets/picgo/867a5623e6ef64c19a3f04a3b422dcc2.png)

在证书存储中选择第二个选项: **`将所有的证书都放入下列存储`**

![](/assets/picgo/ed7d51d61c9b7e12488fe1e962fd7669.png)

选择证书存储**`受信任的根证书颁发机构`**

![](/assets/picgo/18efa18e008c119e4ef3b50830001793.png)

请确保上述安装位置选择了**`受信任的根证书颁发机构`**,如果不是还可以选择**`浏览`**重新选择!

![](/assets/picgo/91c973fd8ef947bb1496e16f3a1b61c4.png)

接下来就已经`完成`根证书的安装信任.

![](/assets/picgo/a4b6d5aca1c8445fc079fc7b41814364.png)

忽略安全警告,点击`是`.

![](/assets/picgo/8ebd2548160f1075f54a3c436f35cf73.png)

直到最后出现`导入成功`的提示框!

![](/assets/picgo/b168cc0a679e0c28bd004bff94e3d87c.png)

对于还残留的系统弹框,选择`确定`关闭即可!

![](/assets/picgo/e226766cfef515274bb34e197d0d3d68.png)

### 配置 SSL 代理

这是可选操作,可以针对请求的特点统一设置,支持`*`通配符模式,也可以对具体的请求单独右键抓取,其实就是设置到这里的.

为了简单省事,对所有的`https`请求一律抓包,设置规则如下:

```bash
*.443
```

> `Proxy --> SSL Proxying Setting`

点击顶部菜单栏的`Proxy`代理,选择`SSL Proxying Setting`.

![](/assets/picgo/bf0419c988d9fc3ad365ab468b762609.png)

在弹出的页面中确保`Enable SSL Proxying`前面的复选框已经`打钩选中状态`.

![](/assets/picgo/35fc653d0a96ffcccbd2aefb93049305.png)

点击`Add`添加按钮后,在`Host`主机输入框输入`*`,`Port`端口输入框输入`443`.这样的设置是抓取全部的`https`请求(`https`默认端口`443`,`http`默认端口`80`)

### 专注当前请求`Focus`

面对众多浏览器请求,信息太杂乱反而增加了干扰,这时候可以聚焦`focus`正在抓包的请求,只需要`右键`选择`Focus`即可将无关请求统一划分到其他类`Other Hosts`.

![](/assets/picgo/f2dd456b2c514ec8fb2109e45e3be551.png)

点击具体请求,在右侧面板中可以看到`请求`和`响应`两部分.

![](/assets/picgo/beb258f800f5255ba3324158ac217f17.png)

```bash
{
    "status": "success",
    "data": {
        "id": "5b8b9572e116fb3714e6faa8",
        "content": "接天莲叶无穷碧，映日荷花别样红。",
        "popularity": 3710000,
        "origin": {
            "title": "晓出净慈寺送林子方",
            "dynasty": "宋代",
            "author": "杨万里",
            "content": ["毕竟西湖六月中，风光不与四时同。", "接天莲叶无穷碧，映日荷花别样红。"],
            "translate": null
        },
        "matchTags": ["白天", "荷花", "夏"],
        "recommendedReason": "",
        "cacheAt": "2024-08-05T15:15:42.750263249"
    },
    "token": "eOvFEyvKqQuK3gWIpTl7ZQHhXf2hybuG",
    "ipAddress": "223.93.63.54",
    "warning": null
}
```

至此,网络抓包神器`Charles`的快速入门级教程即可帮助读者分析网络请求,`https`请求也能轻而易举看到具体的数据了.

## 总结

`Charles`作为一款功能强大的 HTTP 代理和监视工具，在移动开发、网络安全测试以及第三方应用通讯协议分析等领域发挥着重要作用。通过本文的详细解析和实战演练，相信你已经掌握了`Charles`的基本使用技巧和高级功能。

```bash
https://snowdreams1006.github.io
9b26d89cc8ced16f23
```

在未来的工作中，不妨多多利用 Charles 来提升你的开发效率和测试质量吧！

![](/assets/picgo/b7518f03731e67f6c4501f57a1a63ea4.png)
