# 重启deepseek快速恢复

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/e79021b9-082f-48cb-a98b-91d9b388e94b.gif)

## 引言

云服务每月赠送了 10000 分钟的免费时长,连续 24 开机只能用一周左右,本着节省的原则即开即用,不浪费时间.

![](/assets/picgo/86bff8a970c1fc9da0708f54ae8c2366.png)

所以总结出了快速上手 ai 的小妙招,细水长流,省点用!

> 腾讯云 Cloud Studio: [https://ide.cloud.tencent.com/dashboard/gpu-workspace](https://ide.cloud.tencent.com/dashboard/gpu-workspace)

![](/assets/picgo/91a4bdb55001c53241dbbc12e17b87c0.png)

## 现象

工作空间关机后重新开启,内网穿透已失效,`Ollama`服务仍然还在正常运行!

```bash
ollama serve
#Error: listen tcp 0.0.0.0:6399: bind: address already in use

# Ollama is running(base)
curl localhost:6399
```

关机前的开启的内网穿透公网 ip 已失效: [https://4024c15876f0c76757.gradio.live/](https://4024c15876f0c76757.gradio.live/)

![](/assets/picgo/e05b41e92f94a650d349dd59f396eff2.png)

## 解决

所以重新生成公网 ip 即可,也可以直接指定默认端口`6399`或者动态识别`ollama`端口:

```bash
# 自动配置内网穿透端口
PORT=$(lsof -i -P -n | grep "ollama" | awk '{print $9}' | cut -d':' -f2) && /root/miniforge3/bin/gradio-tun --port $PORT
```

重新生成新的动态公网 ip:

![](/assets/picgo/149ea90745310c2617a7c5454f2d7a29.png)

现在使用浏览器可直接访问该临时公网 ip:

![](/assets/picgo/63831de84c0a8aeb9dca4752283f07a6.png)

千万记得一定要保存好自己的公网 ip,不要轻易暴露出去,可以自用也可以配置 ai 服务!

## 应用

现在可以通过编程的方式访问我们自己部署好的 ai 服务,也可以集成到对话框中可视化问答使用.

- 接口调用

```bash
curl -X POST "https://替换成自己的公网ip.gradio.live/v1/chat/completions" \
-H "Content-Type: application/json" \
-d '{
  "model": "deepseek-r1:8b",
  "messages": [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "你是谁!"}
  ],
  "stream": false
}'
```

![](/assets/picgo/619bba7c3b7ba62fcb4b4e395e9e44f9.png)

- ai 对话

可以对接 Cherry Studio 这类 ai 助手应用,如果又不懂的地方,参考上一篇文章: [DeepSeek 这个春节也太火爆了,现在就教你如何私有化部署云端 AI 大模型!
](https://mp.weixin.qq.com/s/mdu-pbNqiO0kJPhDXbYe5Q?token=1641852498&lang=zh_CN)

![](/assets/picgo/721cbeecdece0027611a6358e526509d.png)

ai 对话连续思考能力展示:

![](/assets/picgo/9fe06efb52d3e26257331fa229b56661.png)

## 总结

本文主要介绍了如何在尽可能节省免费时长的前提下,重新开启 ai 服务以及简单使用示例,仅供学习交流使用!

```bash
ollama serve
#Error: listen tcp 0.0.0.0:6399: bind: address already in use

# Ollama is running(base)
curl localhost:6399

# 自动配置内网穿透端口
PORT=$(lsof -i -P -n | grep "ollama" | awk '{print $9}' | cut -d':' -f2) && /root/miniforge3/bin/gradio-tun --port $PORT

# 普通curl请求
curl -X POST "https://替换成自己的ip.gradio.live/v1/chat/completions" \
-H "Content-Type: application/json" \
-d '{
  "model": "deepseek-r1:8b",
  "messages": [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "你是谁!"}
  ],
  "stream": false
}'
```

![](/assets/picgo/44fcdac5af8896d3d2142b1fb6944e75.png)

下次遇到"服务器繁忙"这种提示,有了腾讯云 Cloud Studio 我们就可以开启专属 AI 服务了,想怎么用就怎么用,关键还免费不限制请求频率!

![](/assets/picgo/d6a06d03e8634bcd2c358a8c7c31ec3c.gif)

## 推荐

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
