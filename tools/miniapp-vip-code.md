# 一键提取小程序token

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.
  
现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/7d1108aa7ae408174561693cb5a269a0.gif)

## 引言

研究微信小程序一段时间了,抓包请求,源码分析一顿操作下来,运行一段时间就会出现`Token已过期，请重新授权!`这样的错误提醒.

```
{'code': 9999, 'msg': 'Token已过期，请重新授权!', 'timestamp': 1731661755000, 'errorMsg': '', 'success': False}

{'code': 9998, 'msg': '请刷新Token!', 'timestamp': 1731574401475, 'errorMsg': '', 'success': False}

{'code': -1, 'msg': '您访问的太频繁了!', 'timestamp': 1731717478073, 'errorMsg': '', 'success': False}
```

显然,需要重新登陆小程序再手动抓包提取token,涉及到手动操作就会显得很繁琐,也不方便没有编程基础的人使用.

所以,化繁为简,研究了三天三夜终于开发一款了适合新手小白的一键提取token工具,一键启动,开启代理监听特定请求,再提取指定token,最后保存到当前目录.

![](/assets/picgo/3c55cc561d96bf108337284b00126ea6.png)

## 一键提取token工具演示

只要小程序能在PC电脑端正常打开就支持最新版本微信,否则请联系小程序开发商反馈,这个可能是和小程序后台设置有关.

![](/assets/picgo/1735fb8018b8139e5eca08f0dba2bc61.png)

是骡子是马,拉出来溜溜,狠起来连自己人都不放过,这里直接拿自己开发的小程序(`神秘开箱`)举例说明工具的使用方法.

![](/assets/picgo/79bc9fc4992ce26cd1181fb41225c8b0.jpg)

由于没有开通微信认证,该小程序不支持搜索和分享功能,所以只能先用手机端扫码识别进入到小程序再添加到我的小程序.

这样在PC端的小程序就可以找到并打开了.

![](/assets/picgo/177a37bd4884fa34dbb7606d6fef5bf4.png)

进入小程序后首页有个获取博客验证码功能,会发送http请求到后台获取验证码,从而解锁博客继续阅读.

![](/assets/picgo/3c11fbe543c973f710cd4dc3acaef2fb.png)

如果你问我什么是否需要这个验证码?那说明你没有看到需要验证码的地方,你也可以访问我的博客试一下:

[https://blog.snowdreams1006.cn/](https://blog.snowdreams1006.cn/)

话不多说,继续回到小程序看一下如何抓包该请求,正常的方法是通过专业的抓包工具分析出属于该小程序的流量,判断并手动提取到其中的token.

![](/assets/picgo/03beb1a2f6cae946022a04689bfb8b9b.png)

上述截图来自于抓包工具`Charles`的操作界面,定位到具体请求再分析不难得到想要的任何暴露在外的api数据.

> 如果你没有该工具可以评论私聊回复: `Charles` 或者 `Burpsuite` 

现在不用那么麻烦了,只要是微信小程序咱可以把上述步骤整理合并到一步操作,运行成功自动复制到当前目录.

![](/assets/picgo/91b8eb3cf3d514b0d1ac9a757a4df995.gif)

等待工具自动提取到token后会复制到粘贴板,同时也会在当前目录下面生成`token.txt`文件.

如果有类似项目感兴趣的话,请评论私聊轻松提取小程序token,适合新手小白用户自动化操作.

```bash
链接：https://pan.quark.cn/s/b44b184c455e
提取码：2Bzt
```

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

