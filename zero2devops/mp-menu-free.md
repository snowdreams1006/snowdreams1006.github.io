# 只需要三步,你的公众号也能像我这样免费同时拥有自定义菜单和接入开发权限

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.
  
现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/478bce29701d85c60553d9ddc3d1afea.gif)

不知道您是否遇到过这样的问题?公众号没接入开发能力之前可以配置自定义菜单,但是不知道谁取关公众号.

> [这么小而美的取关功能为什么无法实现呢?为了它,我决定入坑开发微信公众号!](https://mp.weixin.qq.com/s/YlWQhzIwPGpk3LQkDcnwoA?token=327782893&lang=zh_CN)

一顿操作猛如虎,好不容易接入了公众号实现了取关拉黑功能,却发现丢失了自定义菜单的权限,想要实现自定义菜单得每年向微信交个300元的认证费.

![](/assets/picgo/95a7e76516b781749353450068aa5c6f.png)

**1. 临时停用开发设置**

> 登录公众号后台,在设置与开发菜单下面找到开发接口管理,停用服务器配置.

![](/assets/picgo/9ca318cad2ec25e577c4b67e7fe4246a.png)

![](/assets/picgo/f49c4a27bf43581ca429a9a911c07d9a.png)

> 停用后拿出手机端测试发现开发配置已生效,此时只剩下了对话框.

![](/assets/picgo/92dee713a99e21d50e3f8cb4bcade108.jpg)

**2. 启用自定义菜单,可视化编辑菜单**

> 在互动管理菜单下面找到自定义菜单,可视化配置好菜单启用.

![](/assets/picgo/44e5aff3d47055e3ec48b2227217e542.png)

![](/assets/picgo/a221f7ea0339f98f43880b1ab9494f51.png)

![](/assets/picgo/d0b829159fc7293e3215a7b76b2a1b8f.png)

**3. 重新启用开发配置**

> 最关键的一部,重新开启服务器配置,这时候就能同时拥有自定义菜单权限和开发权限.

![](/assets/picgo/d8a574139b22549348d4fa6a5a0554f2.png)

![](/assets/picgo/5db90058822808ddf59bb21e017ef103.png)

效果如下: 同时支持自定义菜单和开发配置

![](/assets/picgo/d80fdaa00c79bc4a197783d97a80557e.jpg)

关于公众号开发系列陆陆续续写了好几篇文章,按照时间以及逻辑顺序整理如下:

- [这么小而美的取关功能为什么无法实现呢?为了它,我决定入坑开发微信公众号!](https://mp.weixin.qq.com/s/YlWQhzIwPGpk3LQkDcnwoA?token=327782893&lang=zh_CN)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s/acs0vwo1bJtOib2QqJuFgA?token=327782893&lang=zh_CN)
- [微信公众号开发原来如此简单,这么多高级权限应有尽有!](https://mp.weixin.qq.com/s/RRvt4nYMHkMajgrehUMNPA?token=327782893&lang=zh_CN)
- [解锁微信公众号新技能！一键上传图片秒获URL，永久素材管理全攻略，让内容创作如虎添翼！](https://mp.weixin.qq.com/s/jMgWuuH89g0ScNvwM3EWlA?token=327782893&lang=zh_CN)
- [教你如何使用springboot开发微信公众号之两处改动轻松升级到多公众号](https://mp.weixin.qq.com/s/Wm32wZxuNRIMHk4KLKlJlA?token=327782893&lang=zh_CN)

从0到1接入公众号开发,现在总算实现了既要又要的功能,满足了取关提醒等开发权限,同时又保持了原来的自定义菜单功能,重点是免费!!!

![](/assets/picgo/c1a8f476bb6f8ef95a86575da9fb546e.gif)

## 往期精彩文章

- [C 盘爆满飘红不用怕,教你三招搞定它,轻松释放几十 G 的磁盘空间!](https://mp.weixin.qq.com/s/fzhPp_9Nze5znnJdOlT6-g?token=327782893&lang=zh_CN)
- [Mac版本Burpsuite下载安装超详细教程,专业版中文激活教程(附下载)](https://mp.weixin.qq.com/s/CqBcQpZYLY33iF0DdWrdiA?token=327782893&lang=zh_CN)
- [Burpsuite下载安装超详细教程,社区版永久有效,专业版汉化激活到2099年,不看会后悔系列,亲测好用!](https://mp.weixin.qq.com/s/lQuBxUPPwx0cFdhGo9YWEg?token=327782893&lang=zh_CN)
- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)

## 欢迎扫码关注
                  
![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`

