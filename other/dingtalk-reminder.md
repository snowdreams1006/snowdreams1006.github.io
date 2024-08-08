# 钉钉签到提醒

本文主要介绍了如何利用现成软件快速实现钉钉自动签到功能,核心思路非常简单,甚至无任何编程基础的小白也能轻松实现定时自动打卡功能.

通过本节课程,你将学习到以下内容:

- 怎么开启钉钉极速打卡功能;
- 如何唤醒手机中的知名软件;
- 如何自己给自己发推送提醒;
- 怎么运行24h不间断定时程序.

## 大纲

![dingtalk-reminder-simple-mind-map.png](./images/dingtalk-reminder-simple-mind-map.png)

## 前言

**关键词**

```mardown
+ 提醒闹钟
+ 极速打卡
```

如今钉钉早已经成为全国性的 app,不仅正在工作中的上班族离不开就连小学生也不逃不开被操控的宿命,不得不说钉钉真的是让人又爱又恨!

例如: 功能非常简单也是使用频率相当高的打卡签到功能就让我忍不住吐槽,提醒方式只有两种而且还是单选,要么设置闹钟要么设置极速打卡!

当然还有第三种方式: 你也可以选择关闭提醒,呵呵.

![dingtalk-reminder-setting-preview.png](./images/dingtalk-reminder-setting-preview.png)

所以最简单操作流程如下:

![dingtalk-reminder-before-flow.png](./images/dingtalk-reminder-before-flow.png)

上述流程中让我觉得不爽的是每次除了打开 app 响应时间过长之外,还有就是每次打卡都要**自己心里盘算着打卡时间**,浪费了为数不多的脑细胞.

因此需要一种更加傻瓜式操作流程来解放大脑,最好能实现自动打卡或者去掉打卡功能也可以,让我沉浸在工作的海洋中吧!

## 效果

上下班时间定时推送打卡通知,点击确认后自动完成打卡操作,省心省力不用记忆打卡时间,交给程序处理吧!

![dingtalk-reminder-dingtalk-preview.gif](./images/dingtalk-reminder-dingtalk-preview.gif)

## 原理

**关键词**

```mardown
+ 极速打卡
+ URL Scheme
+ 定时唤醒
```

由于钉钉签到打卡只有两种快捷方式可供选择,相比于提醒闹钟个人更偏爱极速打卡方式,因此开启极速打卡功能后,只要在打卡时间段内打开 app 就会自动打卡,所以只要简化某些流程就能实现傻瓜式打卡签到.

在众多唤醒手机中知名 app 的解决方案中有一种比较简单的方式,那就是 `URL Scheme` 方案.

**自定义 URL Scheme 协议**

> [常用的URL Scheme](https://www.cnblogs.com/guoshaobin/p/11163919.html)

`URL Scheme` 是一种页面跳转协议,类似于网页中的 `url` 链接,常用于 h5 网站引流到 app 应用的跳转访问,不同于普通 `url` 的`http/https` 协议,`URL Scheme` 一般由 app 自定义协议头,例如 `dingtalk` .

例如: 钉钉的跳转协议是 `dingtalk://具体什么内容由钉钉自主规定` ,如果是普通的 `url` 链接用户点击就会跳转到指定网页,而 `URL Scheme` 链接点击后就会跳转到相应的 app 界面.

- `url` 链接演示 : [https://snowdreams1006.tech/](https://snowdreams1006.tech/)

- `URL Scheme` 链接演示 : [dingtalk://snowdreams1006.tech/](dingtalk://snowdreams1006.tech/)

所以只要在浏览器中访问到类似于 [dingtalk://snowdreams1006.tech/](dingtalk://snowdreams1006.tech/) 这样的链接就能实现自动跳转到钉钉 app 中,既然已经解决了**如何打开** app 的问题,那么接下来的事情就是**什么时候访问链接**的问题了.

**不知疲倦的crontab定时程序**

> [Linux crontab 命令](https://www.runoob.com/linux/linux-comm-crontab.html)

对于编程开发者来说,实现定时程序的最简单方式之一当属于 `crontab` 命令了,属于 `linux` 环境的基本命令之一,可用来执行定时程序,类似于日常生活中的日程表的功能.

```bash
# 早上 8 点半和下午 5 点半运行 dingtalk.sh 脚本文件并将运行结果写入到 dingtalk.log 文件
30 08,17 * * * sudo ~/reminder/dingtalk.sh >> ~/reminder/dingtalk.log
```

现在搞定了**定时运行脚本程序**的问题,接下来的事情就比较简单了,在 24h 不间断运行的服务器上需要定时执行什么命令才能**实现用户实现访问到自定义链接**呢?

**狗吠狼吼bark给自己推送通知**

> Bark is an iOS App which allows you to push customed notifications to your iPhone : [https://github.com/Finb/Bark](https://github.com/Finb/Bark)

很显然,我们需要一款推送服务,服务器定时下发推送通知给注册手机用户,由**用户主动点击确认**后跳转到自定义协议网页,紧接着就会触发钉钉 app 的唤醒操作,从而实现自动打卡功能.

正常来说,手机上的 app 应用绝大多数都具备推送功能,然而推送内容都是由 app 自主控制,**用户只能选择开启或关闭通知功能**,并不能决定通知内容,而 `bark` 却是一款**自己给自己发推送通知的软件**,简单且开源.

```bash
# 点击推送将跳转到url的地址（发送时，URL参数需要编码）
https://api.day.app/yourkey/百度网址?url=https://www.baidu.com 
```

![dingtalk-reminder-bark-preview.png](./images/dingtalk-reminder-bark-preview.png)

只要**访问指定链接就能发送推送通知**给用户手机,进而用户主动点击通知就能跳转到指定网页,从而实现唤醒钉钉 app 的目的.

```bash
# bark 客户端和服务器均开源,可以独立部署也可以使用默认服务.
https://api.day.app/yourkey/钉钉打卡提醒/带我去极速打卡?url=dingtalk://snowdreams1006.tech
```

**命令行curl网络请求神器**

> [curl 的用法指南](http://www.ruanyifeng.com/blog/2019/09/curl-reference.html)

现在已经构造出推送通知请求链接,只需要访问该链接就能完成推送通知,由用户直接操作的话可以复制到浏览器直接回车,但是如果要用程序运行的话就需要使用脚本命令 `curl` 神器.

```bash
curl -i -X GET \
 "https://api.day.app/yourkey/%E9%92%89%E9%92%89%E6%89%93%E5%8D%A1%E6%8F%90%E9%86%92/%E5%B8%A6%E6%88%91%E5%8E%BB%E6%9E%81%E9%80%9F%E6%89%93%E5%8D%A1?url=dingtalk://snowdreams1006.tech"
```

![dingtalk-reminder-bark-push.png](./images/dingtalk-reminder-bark-push.png)

现在总算实现了定时推送通知打开钉钉 app 实现自动签到的功能,其实整个流程并不复杂,解决的是钉钉 app 并没有提供定时自动签到的功能这一问题.

## 总结

**关键词**

```mardown
+ 前提条件
+ 核心重点
+ 实现步骤
+ 主要技术
+ 感谢支持
```

本文的主要目的是解决钉钉上下班签到打卡问题,**提醒闹钟和极速打开只能二者选其一**,并且也没有**定时自动签到**功能,所以本文的解决思路是利用 `URL Scheme` 定时唤醒 app,然后借助**极速打卡**实现自动签到功能.

**前提条件**

- 支持固定上下班时间且开启极速打卡功能

> 只有固定上下班时间才支持极速打卡功能,否则唤醒 app 后还是需要手动打卡岂不是多此一举?

- 拥有至少一台 24h 不间断运行的服务器

> 用于提供定时推送服务,如果有其他手段完成定时访问唤醒链接的任务也可以不需要服务器.

- 下载并注册 bark 软件或者其他类似软件

> 用于接收推送通知,点击推送通知内容确认后进而自动完成签到打卡操作,省去了劳心费神的记忆时间.

**核心重点**

浏览器打开类似于 [dingtalk://snowdreams1006.tech/](dingtalk://snowdreams1006.tech/) 这样的带有 `dingtalk://` 协议的自定义链接即可实现打开钉钉 app 操作.

**实现步骤**

`crontab` 定时推送唤醒链接到注册手机,用户点击推送通知确认后自动打开钉钉 app 进行极速签到,从而**变相实现了自动签到的目的**.

由于不需要心里暗自计算上下班时间,只需要接收到推送后手动点击进行签到确认,所以大大节省了不少脑细胞,剩下的时间又可以愉快敲代码了!

![dingtalk-reminder-after-flow.png](./images/dingtalk-reminder-after-flow.png)

**主要技术**

- 高度自定义的网页跳转协议 : `dingtalk`
- 不知疲倦的定时任务命令: `crontab`
- 命令行下的网络请求命令: `curl`
- 自己给自己发推送通知软件: `bark`

**感谢支持**

如果本文对你有所帮助,欢迎点赞留言告诉我一声,你的支持和鼓励将会是我继续创作的动力!