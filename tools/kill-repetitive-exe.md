# python防止多开重复启动应用

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/e79021b9-082f-48cb-a98b-91d9b388e94b.gif)

## 引言

自己开发的应用有时候是不希望被用户重复运行的,例如监控 http 请求的抓包软件,重复启动会占用相同的端口引起不必要的麻烦,为了解决这种问题就需要在运行前确保没重复启动.

![](/assets/picgo/c118046fd171bb9141da1d3acbe7e691.jpg)

## 实现

运行新的任务时检测是否已有正在进行的任务,全部杀死指定名称的进程后再开启新任务.

于是基于 python 写了个根据进程名杀死重复应用的程序,可在需要的时候检测,注意先后顺序别把最后一次运行的程序干掉了!

![](/assets/picgo/7bf83b774b9c533974fccb37636aaa35.png)

## 总结

打扫干净卫生再请客,这样就能防止重复启动相同的应用,造成不必要的麻烦,也能定时启动程序,不用担心同一个应用被启动多次而提示错误.

![](/assets/picgo/c1524863c9a5aec68b204610d5ab3b2c.jpg)

最后实现效果:

启动新的应用时会自动关闭原来已正在运行的程序,这样就能保证同时只有一个最新进程正在运行.

![](/assets/picgo/04218c5e0141e0414769e94010fac7fa.jpg)

## 推荐

- [良心活动,无需实名,直接照抄答案就行,懂点 python 就能每天白嫖现金红包](https://mp.weixin.qq.com/s/HhYL34fcZeMbwRMOwNxIZw?token=724152766&lang=zh_CN)
- [懒人速成一分钟教你私人定制专属红包封面](https://mp.weixin.qq.com/s/3tt72GnnvCrvlTImGss7KA)
- [C 盘爆满飘红不用怕,教你三招搞定它,轻松释放几十 G 的磁盘空间!](https://mp.weixin.qq.com/s/fzhPp_9Nze5znnJdOlT6-g?token=327782893&lang=zh_CN)
- [Mac 版本 Burpsuite 下载安装超详细教程,专业版中文激活教程(附下载)](https://mp.weixin.qq.com/s/CqBcQpZYLY33iF0DdWrdiA?token=327782893&lang=zh_CN)
- [Burpsuite 下载安装超详细教程,社区版永久有效,专业版汉化激活到 2099 年,不看会后悔系列,亲测好用!](https://mp.weixin.qq.com/s/lQuBxUPPwx0cFdhGo9YWEg?token=327782893&lang=zh_CN)
- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连 UserAgent 都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)

## 关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
