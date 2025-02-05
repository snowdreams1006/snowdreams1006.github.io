# 私有化部署deepseek服务

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/e79021b9-082f-48cb-a98b-91d9b388e94b.gif)

## 引言

春节这两天国产AI `deepseek` 大模型又给我们大大的震撼!

![](/assets/picgo/5b69bb2f39449bdfa1aff54b845508ee.png)

> 注册链接: [https://chat.deepseek.com/sign_in](https://chat.deepseek.com/sign_in)

![](/assets/picgo/6e44491a29288940b245d84bd6f6325b.png)

遭受了大规模的网络宕机服务,无法体验,得益于开源可以私有化部署!

![](/assets/picgo/dc56648b6339902d879535d7ea5031bc.png)

下面就基于腾讯云教你如何部署自己的开源大模型,跟着教程来,你也能问问: "你是谁?"

> 您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。

## 注册并登录腾讯云 Cloud Studio

首先您需要注册一个腾讯云账号(点击[阅读原文](https://curl.qcloud.com/NfIok2b6 "阅读原文")即可注册).

![](/assets/picgo/8212a21333c7d30127bf54ecbdc8a3a4.jpg)

然后登录腾讯云 Cloud Studio,每月免费时长`10000`分钟的 GPU 算力资源,配置为 16G 显存,32G 内存和 8 核 CPU,足以满足大多数开发需求.

![](/assets/picgo/b60c063a61ac65e8cb973d22f518e8b1.png)

## 部署 `DeepSeek R1` AI 模型

### 终端交互

- 第一步: 新建`Ollama`模版

开始创建工作控件 > 模版创建 > 选择 `Ollama` 模板

![](/assets/picgo/fac8f942399fefd8def3d2bfcab0a922.png)

选择基础型的体验套餐 > 新建

![](/assets/picgo/d8e277d00e47f8fb7ca339a4d41b4c8b.png)

- 第二步: 下载`deepseek-r1:8b`模型

点击工作空间进入云端编辑器,打开终端输入命令: `ollama run deepseek-r1:8b` 部署 `DeepSeek R1` 模型.

![](/assets/picgo/6be0755a1b626cec4595c03925861e84.png)

![](/assets/picgo/11d4abc5e5dd0e2c3e79792cf7ff01af.png)

等待模型下载完成后, `Ollama` 会自动启动 `DeepSeek R1`并进入交互模式.

- 第三步: 终端交互

此时,您可以在终端中直接输入问题或指令,与`DeepSeek R1`进行对话,体验其强大的语言理解和生成能力。

![](/assets/picgo/3f980f16054fd4d65317dba0cf74c689.png)

### 编程交互

经过上一步我们已经在本地部署好了大模型服务,通过`python`编程方式交互.

- 第一步: 配置 `ollama` 环境

```bash
pip3 install ollama
```

- 第二步: 配置 `Python` 环境

在终端中配置系统默认的 Python 解释器:

```bash
rm -f /bin/python3
ln -s /root/miniforge3/bin/python3 /bin/python3
ln -s $(which python3) /bin/python3
```

- 第三步: 新建测试文件`test.py`

在编辑器中点击运行或者在终端命令行中运行: `python3 test.py`

```python
from ollama import chat
from ollama import ChatResponse

response: ChatResponse = chat(model='deepseek-r1:8b',messages=[{'role': 'user', 'content': '你是谁?'},])
print(response['message']['content'])
```

![](/assets/picgo/56ce95201d9e198a7a916b5a5d5177e8.png)

![](/assets/picgo/7eed02fbb627a46a751adc03f0ec2293.png)

![](/assets/picgo/b5cf3a1bf2e6141aacb66f3ff9c70133.png)

> 您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手 DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。

## 总结

现在我们在基于腾讯云私有化部署了自己的云端 AI 大模型,再也不用怕服务拥挤无法体验了,接下来可以将端口暴露出去再配合内网穿透工具等显示服务转发就能做成对外服务网站.

**注意事项**

腾讯云 Cloud Studio 每月提供 10000 分钟的免费时长,请再使用完免费的 GPU 资源后,记得关闭机器以避免不必要的资源浪费.

![](/assets/picgo/d6a06d03e8634bcd2c358a8c7c31ec3c.gif)

## 推荐

- [免费制作红包封面还得是 AI 生成,附赠 AI 智能体提示词](https://mp.weixin.qq.com/s/1VMshLCu_VH5YyJHOWAeog?token=1382871849&lang=zh_CN)
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
