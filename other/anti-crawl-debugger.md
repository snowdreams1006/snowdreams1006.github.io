# 反爬之禁止开发者控制台

![微信公众号「雪之梦技术驿站」](/assets/picgo/6f3b53a1d54f77563e71b92645f520a7.gif)

> **致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标 ★ ” 加上星标，就不会找不到我啦！

> 劝你别这样JS开发者控制台,非不信?无限 debugger 总算老实了吧!

## 引言

开发 js 的过程中或多或少使用过`debugger`调试功能,当打开开发者控制台时会自动进入调试模式,中断用户操作,基于此可以用于作为反爬措施之一.

![](/assets/picgo/368e3c85f72768497360d0037e6c26c5.png)

> [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
>
> [网站反爬新招：一键封杀右键菜单，让你的网站数据稳如泰山，打造爆款防护秘籍！
> ](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485592&idx=1&sn=fd2b78bddddca9727d10bf982316ed6d&chksm=fd1f2152ca68a844b97a3deda3182eff380766c74061b492f628394d86aa8af15a3ec6d82408&token=440466482&lang=zh_CN#rd)

## 效果

由于之前已经禁用了鼠标右键菜单和 F12,所以现在想要进入开发者控制台,只剩下提前打开这条路.

![](/assets/picgo/18309428a5ff9b6aa34155dc8734b8ad.gif)

打开并进入[https://vip.snowdreams1006.cn/](https://vip.snowdreams1006.cn/)可以看到自动进入无限循环的 debugger 调试模式,而且每次都是在新文件打开匿名函数.

```js
(function anonymous(
) {
debugger
})
```

接下来,让我们一起探索这种方式能起什么作用吧!

## 实验

基于闭包逻辑自动执行代码块,同时设置延时`debugger`逻辑,也可以死循环直接搞崩溃浏览器.

```js
(() => {
    function ban() {
      setInterval(() => {
        debugger;
      }, 50);
    }
    try {
      ban();
    } catch (err) { }
})();
```

然后你将收获点不完的下一步,这是最直观的效果.

![](/assets/picgo/debb7d7b1a9195f923f7c50111fb5c1a.gif)

其实,破解这种方式也很简单,因为是断点 debugger 在作祟,那就禁用或者忽略断点调试功能即可.

- 禁用断点`Deactivate breakpoints(Ctrl + F8)`

![](/assets/picgo/ff1d051628837aab545d3f031eca366e.png)

亲测有效,这也是最简单直接的破解方式,禁用断点调试,可以破解绝大部分这类的反爬手段.

- 添加日志断点`Add logpoint`

![](/assets/picgo/838cd21e3fdc53044353a82efe5438e7.png)

![](/assets/picgo/1ab079188bcc437beb643bcdf56202e0.png)

- 在这从不暂停`Never pause here`

![](/assets/picgo/f1dd545fc09c42a683c36330e5286e46.png)

- 加入到忽略脚本列表`Add script to ignore list`

![](/assets/picgo/52b01237759b34272f40df83d79c681b.png)

加入忽略列表后,`Source`源码选项卡底部会有忽略列表配置项提示也可以移除忽略列表.

![](/assets/picgo/cb0f310813887c6bf073cf3d8a55b2c0.png)

通过上述方式禁用断点再点击 `Resume Script Execution(F8)` 按钮继续脚本执行,然后即使再次刷新网站,也不会无限`debugger`断点调试了.

> 除了第一个禁用断点全局生效,其他方式只针对单个`debugger`有用!

![](/assets/picgo/dd575a88069681febff9ee35938d0616.png)

```js
(() => {
  function ban() {
    setInterval(() => { debugger; }, 50);
  }
  try {
    ban();
  } catch (err) { }
})();
```

## 升级

通过上述的实验,我们发现有很多种方式都可以跳出无限 debugger 的怪圈.

那就继续想办法升级改造,继续在`debugger`身上动脑筋,具体来说.

**解决方案**: 将 `debugger` 替换成 `Function('debugger')()`

这种`Function`构造器生成的 `debugger` 会在每一次执行时开启一个**临时 js 文件**

```js
(() => {
  function ban() {
    setInterval(() => {
      Function('debugger').call();
    }, 50);
  }
  try {
    ban();
  } catch (err) { }
})();
```

![](/assets/picgo/b6255cd2be74dfc6b879bc2be93e9681.gif)

> 这种方式只有禁用断点`Deactivate breakpoints(Ctrl + F8)`一种方式可以破解,其余在断点位置右键菜单选项均失效!

## 总结

从简单的`debugger`引起重视,到闭包自执行逻辑改造成无限`debugger`模式,最后到临时文件中打开匿名函数.

这种升级改造不能说没什么用,只能算是用处不大,单一的方式不足以做到反爬,还是要全方位考虑.

![](/assets/picgo/27a7c5cd2c46a6334faa7a6f8bc55c45.png)

最后,由于本人才疏学浅,暂时只能想到这么三种方式禁止打开开发者控制台,组合在一起还是能发挥一定作用的!

![](/assets/picgo/712cfa5327f57766ce92cc83c7ab2569.png)

如果你有什么好的想法和思路,欢迎在评论区留言,大家一起交流!

> 放心留言,开启了自动留言精选,保证上墙哟~

![](/assets/picgo/cd9f7e9d2938f5974adc667be85e1c78.png)

## 往期精彩文章

- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [网站反爬新招：一键封杀右键菜单，让你的网站数据稳如泰山，打造爆款防护秘籍！
  ](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485592&idx=1&sn=fd2b78bddddca9727d10bf982316ed6d&chksm=fd1f2152ca68a844b97a3deda3182eff380766c74061b492f628394d86aa8af15a3ec6d82408&token=440466482&lang=zh_CN#rd)
- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484509&idx=1&sn=ab610cdda5a19e6d93584eb47e1ca90b&chksm=c34ad19f34396970754c7c675842c376c463517d186ca0a2625d0f5e1c93fba1294ffbfbe2b1&mpshare=1&scene=1&srcid=0830xWe7y9ghVDMQCa1Nc1Aa&sharer_shareinfo=7bd783bffb92c8b1f5b6300d76562b33&sharer_shareinfo_first=7bd783bffb92c8b1f5b6300d76562b33#rd)

![](/assets/picgo/31f9180b2c2601eb166e885a92d804e3.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
