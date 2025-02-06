# 超算互联网上线了DeepSeek

## 前言

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/e79021b9-082f-48cb-a98b-91d9b388e94b.gif)

最近 DeepSeek 官网很火爆,不能稳定运行,于是折腾出来了腾讯云`Cloud Studio`高性能工作空间部署 DeepSeek 应用.

> 提供 GPU 算力，能够即开即用使用 AI 框架、AI 模型、AI 应用

原本是在每月赠送 10000 分钟的诱惑下,想着**随用随取**白嫖云部署 ai,资源紧张的问题依然不可避免,需要用的时候竟然遇到了"**当前暂无算力，请稍后重试**"导致无法开机!

![](/assets/picgo/4237252f0c9d733f5ae2f65096787795.gif)

转头看着`DeepSeek`官网一直正在加载中,**请稍后重试**的提示又很崩溃,只能继续寻找替代品.

![](/assets/picgo/db68f31c91670c6a77229b404f529aba.gif)

不信你看看 deepseek 网站监控状态,总是会服务繁忙,请稍后重试.

> 查看 DeepSeek 状态的网站: [https://status.deepseek.com/#](https://status.deepseek.com/#)

![](/assets/picgo/ba2ecbaaab5a13564c2653347b9e5834.png)

> 监控网站状态的可基于`uptime`项目部署,可参考: [告别网站宕机烦恼！Uptime Kuma：你的 24 小时运行监控神器](https://mp.weixin.qq.com/s/fjaxNTvKnIe79Nm4bQt3EA?token=867981677&lang=zh_CN)

## 替代方案

### 国家超算互联网

就在刚刚国家队出手了,国家超算互联网平台上线了 DeepSeek,赶紧体验一波!

> 国家超算互联网平台: [https://chat.scnet.cn/#/home](https://chat.scnet.cn/#/home)

![](/assets/picgo/db70fbec7c30730ecffbdc1c18eabccd.png)

优点是免注册可直接上手体验,缺点是不如 DeepSeek 官网的操作便捷,差强人意,不是特别惊艳!

### 硅基流动 API 接口

因为 SiliconCloud 邀请别人注册,您与好友均可获赠 2000 万 Tokens(14 元平台配额),再配合一些第三方支持配置 API 的软件,就可以直接用上满血版本的 DeepSeek 了,相信可以撑到 DeepSeek 官网稳定运行的那一刻!

- 第一步: 通过手机号注册账号

> 官网链接: [https://cloud.siliconflow.cn/i/HNRkZhiy](https://cloud.siliconflow.cn/i/HNRkZhiy)

也可以扫码识别,注册的时候输入邀请码: `HNRkZhiy`

![](/assets/picgo/2f9808b34403d40899adf97b8833cdf3.png)

![](/assets/picgo/a2e46af60f22062301466dda2bb22565.png)

模型广场有很多大模型,可以点击看看里面的介绍,这里以第一个为例: `deepseek-ai/DeepSeek-R1`

![](/assets/picgo/2dce0c950e9d7ac1f529a338d4644d04.png)

也可以点击链接直达该模型: [https://cloud.siliconflow.cn/models?target=deepseek-ai/DeepSeek-R1](https://cloud.siliconflow.cn/models?target=deepseek-ai/DeepSeek-R1)

![](/assets/picgo/39b568a67df9a1255a6847bf3793a3c9.png)

- 第二步: 生成 api 密钥

**新建 API 密钥**,输入描述,**新建密钥**,生成并复制密钥.

![](/assets/picgo/994e32c7b536c1dba41ecad53df91156.png)

![](/assets/picgo/7915a0ff3bbf0e7a137ac0db1e8e6823.png)

- 第三步: 配置大模型客户端应用

上一步得到的 api 密钥可通过编程的方式调用各个大模型,具体对接需要自行编程实现,而市面上也有一些开放的大模型应用帮助我们实现这一点,无需编程就能够实现直接对话效果.

其中[`Cherry Studio`](https://cherry-ai.com/download)就是跨平台的一款应用,接下来就用它演示.

> Cherry Studio 应用参考: [DeepSeek 这个春节也太火爆了,现在就教你如何私有化部署云端 AI 大模型!](https://mp.weixin.qq.com/s/mdu-pbNqiO0kJPhDXbYe5Q?token=867981677&lang=zh_CN)

![](/assets/picgo/78f563e59370d21bfa036c6041c3bb80.png)

**模型服务**

左下角**设置** > **API 密钥**(复制刚才生成的密钥粘贴进来)

![](/assets/picgo/2ff31c33d5be106070b87c07536ea473.png)

点击**模型** > **管理** > 添加要使用的模型 id: `deepseek-ai/DeepSeek-R1`

![](/assets/picgo/58b6f454adcd7752b8563d01d72907ad.png)

点击 api 密钥旁边的检测,选择模型,等待测试连接是否正常.

![](/assets/picgo/97664b2830b4940dddd657b28132a48b.gif)

等待一段时间后提示"**连接成功**"

![](/assets/picgo/5e849c1fda602f5fad85789182dfbeeb.png)

**默认模型**

设置默认模型助手/话题命名模型/翻译模型

![](/assets/picgo/7d806ccb311d6ce247c16d0c2f1626d7.png)

其余设置自行按需配置,接下来就是体验 ai 对话的时刻了!

![](/assets/picgo/8c0a0b5f8edbf5efe996106741da1935.png)

在体验了对话功能后,再次登录硅基流动官网可以查看剩余额度.

![](/assets/picgo/c420a31137e52c53981ae002079bbac9.png)

## 总结

本文提供了两种方式应对 deepseek 官网服务不可用的情况,其中国家超算互联网中心可免注册直接使用,较为稳定,还有一种是第三方平台申请 api 接口再配合大数据模型应用搭建对话窗口.

> 国家超算互联网平台: [https://chat.scnet.cn/#/home](https://chat.scnet.cn/#/home)
>
> 硅基流动 API 官网: [https://cloud.siliconflow.cn/i/HNRkZhiy](https://cloud.siliconflow.cn/i/HNRkZhiy)

![](/assets/picgo/d6a06d03e8634bcd2c358a8c7c31ec3c.gif)

## 推荐

- [python 如何防止多开重复启动相同 exe 应用](https://mp.weixin.qq.com/s/mewaWmL2Q3FXUXPUp5DDgg?token=1820404257&lang=zh_CN)
- [DeepSeek 这个春节也太火爆了,现在就教你如何私有化部署云端 AI 大模型!](https://mp.weixin.qq.com/s/mdu-pbNqiO0kJPhDXbYe5Q?token=1641852498&lang=zh_CN)
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
