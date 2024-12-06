# 自动签到

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.
  
现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/478bce29701d85c60553d9ddc3d1afea.gif)

本文以[精易论坛每日签到](https://bbs.125.la/plugin.php?id=dsu_paulsign:sign)功能为例,手把手教你如何对网页的签到功能实现自动化,真的超级简单!

![](/assets/picgo/7ccca226d9d8d214a9d1afae5991046e.png)

## 分析

先看一下手动签到的流程:

首先点击签到按钮,发起请求,定位到具体元素源码

```
<input type="button" id="sign" class="qiandao1" onmouseover="this.className='qiandao2'" onmouseout="this.className='qiandao1'">
```

然后就这样签到成功了,会有弹出框提示:

![](/assets/picgo/74425436f221aa1fab0f6c2b0a6b92b5.png)

接着根据"签到成功"定位到具体的请求,提前抓包或者F12浏览器也能定位到该请求`/plugin.php?id=dsu_paulsign:sign&operation=qiandao&infloat=1`.

![](/assets/picgo/c3c381b86a7ffc64ca43593e81d75389.png)

![](/assets/picgo/13bb6a9f0751c3925de15ba36412ebed.png)

然而,这请求直接返回了html源码不是结构性数据,因此不适合直接抓包复现该请求,同时签到成功后签到按钮消失了.

![](/assets/picgo/e0898843f0f3b483f13b4b18e3f7484e.png)

分析到这一步,多多少少也看出来了"签到"按钮触发的请求比较复杂,为了简单起见,懒得分析具体的请求.

如果能直接启动浏览器,实现上述的点击按钮这一步操作的话,那就直接实现了签到功能.

## 实现

为了实现上述目的,我们可以用`automa`浏览器插件来实现,是一款能自动化执行特定流程的扩展工具,模拟人工操作,包括鼠标点击事件,启动浏览器,打开网页等操作.

> [https://docs.automa.site/](https://docs.automa.site/)

![](/assets/picgo/cb5360ccdad49ee2084916c5d058564c.png)

因此用`automa`来编写一套签到流程,可视化编辑直观高效可靠.

新建签到自动化流程,如下:

![](/assets/picgo/e92a25571c66773669584f6776ecc516.png)

设置cron定时表达式,每天早上7点自动签到: `0 0 7 ? * *`

![](/assets/picgo/fabe4dbe61adc2dcc2e2a33258c33faa.png)

![](/assets/picgo/e2b174b4e81e6f3a24ea274f4df14c94.png)

新打开浏览器窗口并访问指定链接: [签到页面](https://bbs.125.la/dsu_paulsign-sign.html)

![](/assets/picgo/32dea031a44a219f84efa35592ce896f.png)

查找签到按钮并点击`#sign`

![](/assets/picgo/8f32a8f049ae9a2bd2c815f1ccd6787d.png)

签到成功后会弹出对话框,可以点击确定也可以对当前网页进行截图保存.
 
![](/assets/picgo/411afa835c5fe97b35c753de7d507b2d.png)

由于已经签到,再次进入该页面显示已签到,这里测试已签到页面作为模拟签到按钮`div.already>p.continuous`.

```html
<div class="already">
  <img src="source/plugin/dsu_paulsign/img/anniu/yqiandao.png" alt="">
  <p class="tuesday">
    周五  </p>
  <p class="continuous">
    连续签到 1 天
  </p>
</div>
```

![](/assets/picgo/426bed47338f07f4b613926a3a37141d.png)

截图后关闭当前浏览器窗口,高级玩法也可以发送webhook通知签到情况.

![](/assets/picgo/4d257e744ba157b7d7eb6b2cd76c3c84.png)

最后,整理得出如下自动化签到流程,先启动新的浏览器窗口,进入签到页面,如果还没有签到则点击签到按钮,最后截图关闭浏览器.

![](/assets/picgo/47d2d099d81d9c2ad380c4f288a927b9.png)

## 总结

本文通过`automa`浏览器插件实现了网页自动化签到流程,无需复杂的抓包分析请求,直接模拟人工点击的行为就能实现自动签到的目的.

下次如果遇到类似的功能需求,不用抓包分析,直接借助`automa`浏览器插件就能完成自动化工作.

由于代码过于简单就无需私聊获取源码了,一看就会,学了就能做类似的签到操作.
![](/assets/picgo/c1a8f476bb6f8ef95a86575da9fb546e.gif)

## 热门

- [C 盘爆满飘红不用怕,教你三招搞定它,轻松释放几十 G 的磁盘空间!](https://mp.weixin.qq.com/s/fzhPp_9Nze5znnJdOlT6-g?token=327782893&lang=zh_CN)
- [Mac版本Burpsuite下载安装超详细教程,专业版中文激活教程(附下载)](https://mp.weixin.qq.com/s/CqBcQpZYLY33iF0DdWrdiA?token=327782893&lang=zh_CN)
- [Burpsuite下载安装超详细教程,社区版永久有效,专业版汉化激活到2099年,不看会后悔系列,亲测好用!](https://mp.weixin.qq.com/s/lQuBxUPPwx0cFdhGo9YWEg?token=327782893&lang=zh_CN)
- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)

## 关注
                  
![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`

