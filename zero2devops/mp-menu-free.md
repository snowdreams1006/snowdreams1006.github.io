# 免费找回自定义菜单

> 只需要三步,你的公众号也能像我这样免费同时拥有自定义菜单和接入开发权限

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
