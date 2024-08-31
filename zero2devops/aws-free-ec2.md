# 白嫖一年亚马逊 aws-ec2 服务器

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！

---

保姆级教程带你一步一步注册亚马逊云账号,申请免费中国区域套餐,最终领取你的专属服务器!

![](/assets/picgo/9241607dcdbf5dcaf737692f6cf7ad3c.png)

亲自体验下来,整个流程非常丝滑顺畅,而且中间无需人工审核环节等待,强烈推荐申请 12 个月的免费服务器.

![](/assets/picgo/89b65d39fe19cf3dc1fd23abb2053f94.png)

> 文章结尾处附有免费套餐申请链接,手把手教学包申请通过的哦!

## 前言

这样白嫖 12 个月免费亚马逊服务器`Amazon EC2`不香吗?

![](/assets/picgo/4aeefcdae12364c807506a6cfe168367.png)

如果你想问什么是`Amazon EC2`服务器?那我只好祭出官方文档 [什么是 Amazon EC2？](https://docs.amazonaws.cn/AWSEC2/latest/UserGuide/concepts.html "什么是 Amazon EC2？")

其实简单的这样说,白嫖的服务器基本配置如下,搭建简单服务足够了,反正我是冲了!

![](/assets/picgo/a84f06f09418c448fb770f3072414093.png)

如果你不想要服务器,也有很多其他免费套餐可供选择,像是什么数据库存储计算之类的,也有免费试用套餐!

![](/assets/picgo/e9a7d79805e6974485e5b8b2abcb6bdb.png)

## 前提

申请亚马逊云科技中国区域免费套餐,需要提供以下资料:

- 手机和邮箱
- 企业营业执照
- 负责人的有效身份证件

## 注册

看完免费套餐详情信息,能让我心动的还得是 12 个月的免费服务器.

所以我选择注册中国区域,也有海外区域,不过暂时用不到海外服务器,所以就没有继续研究.

> **前提准备**: 您需要提供企业注册证照和网络安全负责人的有效身份证件进行账户注册

**注册邮箱**

准备能正常接收验证码的邮箱,如果不想被骚扰也可以用[临时邮箱](https://10-minutemail.com/ "临时邮箱"),不过建议最好还是用个人邮箱吧!

![](/assets/picgo/bc015e166203eac6343219969a39388e.png)

**设置用户名密码**

建议保存好用户名和密码,注册成功后登录时需要用到(还有注册成功后的 id),也可以使用浏览器的记住密码功能.

![](/assets/picgo/b84555e627620fac51c08207c12e3964.png)

**联系人信息**

联系人的姓名和身份证号码以及公司全称和地址.

![](/assets/picgo/246e3ed49e609ed063d13a6304fc2db8.png)

**企业信息验证**

上传企业的营业执照和联系人的手机号码以及身份证等资料准备验证.

![](/assets/picgo/ad2a2aee10dffe74e745ea0aab6cfcc0.png)

**身份验证**

输入手机验证码完成验证

![](/assets/picgo/ea3ec57b284792e867c33dfd0d6d6343.png)

已成功验证您的身份

![](/assets/picgo/6b604350b4d16462fa2443d0f44c286b.png)

**选择支持计划**

选择基本计划,免费服务,将白嫖进行到底!

![](/assets/picgo/dd3f33cefe14d73e82abe9692288ea74.png)

**注册成功**

整个注册流程还是很顺利的,提供企业负责人信息以及企业营业执照即可自助注册完成,中间无需审核等待.

![](/assets/picgo/85c9e4c9b76b831888254d6b39d153f2.png)

**亚马逊云科技微信小程序**

注册成功后邮箱收到了一封欢迎邮件,实测下来小程序似乎没有绑定注册账号,更像是营销小程序,无管理服务器等基本功能,可忽略.

![](/assets/picgo/92c17ccd17973c31493482b5574796e2.png)

## 白嫖

还记得刚开始的**开始免费试用 Amazon EC2 服务器吗?**

> 免费套餐： 第一年包括每月 Free Tier AMI 上的 750 小时 t2.micro（或者，在未推出 t2.micro 的区域中是 t3.micro）实例用量、每月 750 小时的公有 IPv4 地址用量、30GiB EBS 存储、200 万个输入和输出、1GB 快照，以及 1GB 互联网带宽。

![](/assets/picgo/b0c8c706057b6a1bccc80f0ab6f7cf55.png)

**登录控制台**

既然已经注册成功,那么接下来让我们开始正式白嫖服务器之旅,`Amazon EC2`服务器我来了!

![](/assets/picgo/104556d43c0ae839001c794240fed0c6.png)

现在登录控制台,跟着我的教程继续申请一台自己的专属服务器吧!

**启动实例**

点击启动实例,开始创建服务器,设置服务器的操作系统以及存储等个性化配置.

![](/assets/picgo/57ab7d5c029773bce4f94a4edd63cfaf.png)

**名称和标签**

自定义服务器的描述名称,例如: `aws`

![](/assets/picgo/645d5eab1aeeef7019eefb3d8d280fd7.png)

**应用程序和操作系统映像（亚马逊机器映像）**

选择服务器的操作系统,这里根据自己的实际情况操作,也有`window`服务器!

![](/assets/picgo/490fefef5f9e08120596b3775fe441fd.png)

**实例类型**

默认,符合条件的免费套餐.

![](/assets/picgo/2f1ac343fd5498b6bb6bacd5e4e23805.png)

**密钥对（登录）**

创建密钥对,建议重新生成,等下会下载私钥到本地,这是唯一一次保存的机会!

![](/assets/picgo/e25d847f18a1c7ee72ad1bb117b8c474.png)

**网络设置**

建议重新创建安全组,因为我选择是`ubuntu`操作系统,等下登录要开放`22`端口,这个后续也可以再手动修改安全组规则,问题不大.

![](/assets/picgo/3b00a6bc028e0237a8792a27471cfdce.png)

**存储（卷）**

默认`8GB`,如果只申请一台服务器,建议直接拉满到`30GB`的存储配置.

> 有资格使用免费套餐的客户最多可获得 30GB 的通用型 (SSD) 或磁存储空间

![](/assets/picgo/245fae03cc27c61f84bf5cc32f114f02.png)

**高级详细信息**

随便点开看一眼就算了,能看懂就修改,看不懂就不用动.

![](/assets/picgo/13c4d1d7d13c20edf8088207b83fc112.png)

**启动实例**

左侧的配置选好之后,右侧面板摘要信息,可以选择**启动实例**,等待创建服务器...

![](/assets/picgo/a5c2aac74d45962c30c7afe643d2c7ff.png)

**创建实例中**

不到一分钟的时间就很快创建成功,差一点都来不及截图了呢!

![](/assets/picgo/f593877c034771032b02675672614a69.png)

**已成功创建**

至此已经大功告成,**恭喜你成功获取一年的白嫖服务器!**

![](/assets/picgo/d1b2264c089a56c3fb0aa3d02e413f23.png)

**创建账单和免费套餐使用量提醒**

根据提示创建提醒,省的一年后忘记了什么时候到期以及超额的事情,这里用到的邮箱就需要是正常使用的邮箱而不能是临时邮箱了哦!

![](/assets/picgo/1990b8d0a4cbac6f98a2a86fe2bf5706.png)

**连接到您的实例**

根据服务器的操作系统不同,登录方式也不一样,以我申请的`ubuntu`服务器为例,演示一下登录过程.

![](/assets/picgo/8101473ff6320f7f86e30df36a0ac337.png)

**登录成功**

默认情况下,选择第一个选项`Ec2 instance Connect`实例连接就能在浏览器控制台登录到服务器.

如果连接失败,检查一下申请服务器一定要选择创建新的密钥对,否则删除该实例重新申请即可!

> `Welcome to Ubuntu 24.04 LTS (GNU/Linux 6.8.0-1010-aws x86_64)`

![](/assets/picgo/a3ee0c71475a117164373c7047074930.png)

**正在运行**

成功进入到服务器,剩下的事情交给你的专业能力,例如开放`root`账号在本地 ssh 客户端秘钥登录并设置基本信息等等.

![](/assets/picgo/89b65d39fe19cf3dc1fd23abb2053f94.png)

## 连接

如果您是跟着我的教程一步步申请的`Ubuntu`服务器,那么还能接着看到最后,这里提供了关于登录服务器的官方文档.

> [连接到您的 Linux 实例](https://docs.amazonaws.cn/AWSEC2/latest/UserGuide/connect-to-linux-instance.html "连接到您的 Linux 实例")
>
> [管理 Linux 实例上的系统用户](https://docs.amazonaws.cn/AWSEC2/latest/UserGuide/managing-users.html "管理 Linux 实例上的系统用户")

创建密钥对时系统会自动为您创建私钥并下载到本地,在本地电脑找到你的私钥文件位置,按照如下设置,可实现本地 ssh 客户端登录服务器.

```bash
# 设置私钥权限
chmod 400 ~/.ssh/aws.pem

# 根据私钥登录服务器
ssh -i ~/.ssh/aws.pem ubuntu@ec2-******.cn-north-1.compute.amazonaws.com.cn
```

当然,这也是默认提供的 ssh 客户端登录方式,肯定好用!

![](/assets/picgo/4adb2e3edacb321b7b4e5362c07ab5c9.png)

假设你已经成功登录到服务器,接下来可以个性化设置将其他公钥上传到服务器实现快捷登录.

```bash
ssh -i ~/.ssh/aws.pem ubuntu@ec2-******.cn-north-1.compute.amazonaws.com.cn
```

改动成这样:

```bash
ssh aws
```

核心思路: 将本地客户端默认生成的公钥(注意不是刚刚生成的 aws.pem 私钥文件)到上传到服务器`~/.ssh/authorized_keys`文件.

不懂的话可以参考我之前的文章: [云服务器上手指南之从登录服务器开始](https://blog.snowdreams1006.cn/zero2devops/login-and-logout.html "云服务器上手指南之从登录服务器开始")

## 总结

本文主要介绍了如何白嫖一年的亚马逊云服务器,当然中国区免费套餐不仅仅包括服务器还是有数据库等其他产品.

综合考虑下来还是`Amazon EC2`云服务器最能吸引我,只需要提供企业营业执照和联系人信息即可全程实现自助申请,整个过程体验下来非常丝滑顺畅,哪怕是新手小白也能顺利领取!

最后强调一下,启动实例的时候一定要创建ssh密钥对并保存到电脑,否则可能会遇到登录问题.

> 亚马逊`Amazon EC2`云服务器申请链接: [https://www.amazonaws.cn/free/](https://www.amazonaws.cn/free/ "https://www.amazonaws.cn/free/")

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 往期精彩文章

- [这么小而美的取关功能为什么无法实现呢?为了它,我决定入坑开发微信公众号!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485083&idx=1&sn=edeb79ba4dfe1d838e48bd1f1efd034a&chksm=fd1f2f51ca68a647fc8dcea35f6973dd36bcc0d50687a6dd2aa5761700e281dcf5c007f0d49e&token=156946282&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484698&idx=1&sn=c874dbfa2f3550b4ea1e88854d4ef80d&chksm=fd1f2cd0ca68a5c6dffa5bf67da755a09aee73d26bb97e67f42d18e0463d3cad2a2fe9e1703f&token=312545539&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)
- [恋爱年龄差背后的秘密](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484177&idx=1&sn=bb9e916c34bfaa9c4559a556df295d48&chksm=c21502f2f5628be4149cf91a652d500b23b1c1da2279fd6a09990c1967c0f8a52d3a5995bb5c&token=658409695&lang=zh_CN#rd)
- [每天一道美味佳肴《糖醋排骨》](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484315&idx=2&sn=dc77fadf4cd5dd3a22bf055b3fee300f&chksm=c2150278f5628b6eb64dd78ebef9d0dda668bdef2a5d73214a1f622235a00212dbcae7058092&token=658409695&lang=zh_CN#rd)

![](/assets/picgo/33e4b08a5627c640882495f1267f9318.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`