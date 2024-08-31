# 反爬之禁止F12

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！

---

上篇文章发出去还没热乎,突然一条评论吓我一跳: "我提前打开f12请问阁下如何破解"

所以,抓紧时间继续升级一下小破站,发现漏洞及时修复,能防一点是一点.

![](/assets/picgo/69739b02fb077c0f2e76f5d379596bd5.png)

## 前言

> [网站反爬新招：一键封杀右键菜单，让你的网站数据稳如泰山，打造爆款防护秘籍！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485592&idx=1&sn=fd2b78bddddca9727d10bf982316ed6d&chksm=fd1f2152ca68a844b97a3deda3182eff380766c74061b492f628394d86aa8af15a3ec6d82408&token=25054771&lang=zh_CN#rd)

js禁止右键菜单,阻止浏览器默认行为,只能说防君子协定,原来是如此脆弱!

![](/assets/picgo/72afa7c93337fffa9b1c4f2faf469d54.png)

简单回顾一下,核心代码如下:

```js
document.oncontextmenu = function(event) {
    event.preventDefault(); // 阻止默认行为（即显示上下文菜单）
    console.log('别动我的网站,它怕痒!');
    alert('别动我的网站,它怕痒!');
    return false; // 在某些情况下，返回false也可以阻止默认行为
};
```

禁用了右键菜单,可以悄无声息直接`return false`也可以做点什么提示`alert('别动我的网站,它怕痒!')`

既然是`F12`惹的祸,那我就再进一步,禁用`F12`按键事件.

## 思路

> `F12`的按键编码是`123`
>
> 参考[键盘键码keyCode对照表](https://blog.csdn.net/lhkuxia/article/details/123727389)

![](/assets/picgo/53f16a3b581229ebbc4d61c8b814ebcb.png)

当键盘按下`F12`时同样会触发事件,也是`return false`全部禁用,总是没办法打开控制台了吧!

```js
document.onkeydown = document.onkeyup = document.onkeypress = function(event) {
    let e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 123) {
        console.log('F12快捷键已禁用!');
        alert('F12快捷键已禁用!');
        e.returnValue = false;
        return false;
    }
};
```

![](/assets/picgo/73009b686f2be12c469cc6f0e5f4f785.png)

**知识扩展**

- document.onkeydown 按下按键

> 当用户按下键盘上的任意键时触发，但尚未释放该键。这个事件允许你捕获按键的按下动作，但此时并不清楚按键是否会被释放（即，用户是否最终会敲击该键）。这对于实现键盘快捷键或处理连续的按键动作（如游戏控制）特别有用。

- document.onkeyup 抬起按键

> 当用户释放键盘上的键时触发。这个事件与onkeydown相对，用于处理按键释放后的逻辑。它常用于检测用户何时完成了一个按键动作，比如在一个文本输入框中完成了一个单词的输入。
- document.onkeypress 按下并释放按键

> 在用户按下并释放一个可打印的键时触发（即，那些会产生字符的键，如字母、数字键、标点符号键等）。注意，对于某些键（如功能键、箭头键等），onkeypress可能不会被触发。这个事件对于处理文本输入特别有用，因为它提供了关于哪些字符被输入的详细信息。

## 总结

禁用右键并禁用`F12`按键双管齐下,确保不会被打开开发者控制台,哪怕是给偷窥者增加了一点点也是极好的,欢迎访问[https://vip.snowdreams1006.cn/](https://vip.snowdreams1006.cn/)来测试一下能否打开开发者控制台.

![](/assets/picgo/0c7be5c77f3b28b44d56ee3b47f02129.jpg)

> 欢迎本着学习的态度来一起交流哦,网站很小,个人开发不容易,真要测试还请轻点~


![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 推荐

- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484509&idx=1&sn=ab610cdda5a19e6d93584eb47e1ca90b&chksm=c34ad19f34396970754c7c675842c376c463517d186ca0a2625d0f5e1c93fba1294ffbfbe2b1&mpshare=1&scene=1&srcid=0830xWe7y9ghVDMQCa1Nc1Aa&sharer_shareinfo=7bd783bffb92c8b1f5b6300d76562b33&sharer_shareinfo_first=7bd783bffb92c8b1f5b6300d76562b33#rd)
- [新手如何注册微信公众号,保姆级教程包教包会!](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484434&idx=1&sn=4f191bd630bd06ae53ef2dd5a8120279&chksm=c3292dc627b98ff6680297c5495728cc9b02024dd7dc21e962bae509b7ba73380e8307381f0e&mpshare=1&scene=1&srcid=08302Jhut5oR0QOYaZMvCljq&sharer_shareinfo=6c0725658775d67efbf2a0c9fe09a4f0&sharer_shareinfo_first=6c0725658775d67efbf2a0c9fe09a4f0#rd)
- [男人的魅力密码：价值至上的情感攻略](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484248&idx=1&sn=b79b518d3088cc024ac39a91310ea958&chksm=c353888e7c7b3cfae8b4f52ab48f43e685e935e00c36d36a012a3b685448ee75ccf3cd1a8f1f&mpshare=1&scene=1&srcid=08307fmhatFivTVzHEeRDWJU&sharer_shareinfo=aed074a1f25052634a60f95b5ae3c9f4&sharer_shareinfo_first=aed074a1f25052634a60f95b5ae3c9f4#rd)
- [恋爱年龄差背后的秘密](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484177&idx=1&sn=bb9e916c34bfaa9c4559a556df295d48&chksm=c30b07c3785069ef293685431536f6980ab083ff9a9997922ba77bfeff953602dd918da3a441&mpshare=1&scene=1&srcid=0830kW3N6E9n6m9CvUMtz6xy&sharer_shareinfo=3157cb2d91d2beb388e316441831982c&sharer_shareinfo_first=3157cb2d91d2beb388e316441831982c#rd)

![](/assets/picgo/33e4b08a5627c640882495f1267f9318.jpg)

## 欢迎扫码关注

"你在互联网的路上匆匆而来,雪之梦技术驿站助你满载而去"

                  ---「雪之梦技术驿站」

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
