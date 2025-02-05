# selenium免登录剔除爬虫特征

> selenium 免登录打开 Chrome 浏览器

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/e79021b9-082f-48cb-a98b-91d9b388e94b.gif)

## 引言

在 Windows/Mac 上启动 Chrome 时追加参数是一种常用的技巧，可以帮助你自定义启动行为，比如无界面模式、指定配置文件、禁用某些功能等。

## 场景

selenium 爬虫模拟人工操作可能会被某些网站识别出爬虫行为,或者抓取某些需要登录后才能访问的数据不想登录,就可以使用已登录的浏览器进行打开,这样就能避免上述行为.

例如: 人工访问爬虫识别网站[https://bot.sannysoft.com/](https://bot.sannysoft.com/ "https://bot.sannysoft.com/")

![](/assets/picgo/cd5dc873f5d6ca7c72bd9e5c6941bac2.png)

如果是简单的 selenium 打开上述网站,检测结果如下:

```python
from selenium import webdriver

driver = webdriver.Chrome()
# 反机器人检测
driver.get('https://bot.sannysoft.com')
driver.maximize_window()
time.sleep(random.randint(10, 30))
```

![](/assets/picgo/8ecceff9ea09432ade6b24f225b207ad.png)

如果使用已打开的 Chrome 浏览器,selenium 自动化打开爬虫识别网站,检测通过!

![](/assets/picgo/980c79e38c10e6039e085a4b721cf3a6.png)

## 自定义 Chrome 浏览器启动行为

下面就详细说一下如何做到的,seleium 使用已打开的 Chrome 浏览器自动化.

思路: 提前打开 Chrome 浏览器(添加自定义启动行为),selenium 再连接到刚才的浏览器即可实现免登录真人工操作.

### 第一步: 找到`Google Chrome`二进制文件

应用程序 > Google Chrome.app > 右键:显示包内容

![](/assets/picgo/4a741f1a07557d2564b9ee78fd10b04c.png)

Contents > MacOS > Google Chrome

![](/assets/picgo/a7a803b9299f14df76b12f8b65df3d89.png)

### 第二步: 添加启动参数自定义启动行为

如果是 windows 平台可参考下面命令自定义浏览器启动参数:

```bash
"C:\Program Files\Google\Chrome\Application\chrome.exe" --remote-debugging-port=9500 --user-data-dir="C:\Users\Administrator\AppData\Local\google\Chrome\selenium"
```

如果是 Mac 平台可找到二进制文件,自定义参数定义浏览器启动行为:

```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9500 --user-data-dir="/Users/snowdreams1006/Documents/develop/chrome/selenium"
```

最后,提供一份`selenium`连接远程浏览器的源码,仅供学习参考如下:

![](/assets/picgo/f002f59c78bcf1a942bbb4e20dc93e98.png)

## 总结

在使用 selenium 做浏览器自动化的过程中,经常性遇到被某些网站识别成爬虫而拒绝服务,或者某些登录网站比较麻烦,能直接连接到已登录的浏览器就能解决这类问题.

![](/assets/picgo/d6a06d03e8634bcd2c358a8c7c31ec3c.gif)

## 推荐

- [python 源码-好宝贝母婴每日签到赚积分](https://mp.weixin.qq.com/s/ws-E1gIXuN-WCqDAX1tVIg?token=724152766&lang=zh_CN)
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
