# 个性化定制专属deepseek应用

> DeepSeek 太爆火总是服务太拥挤?手把手教你零成本私有化部署云服务,每月 10000 分钟免费额度!

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.

现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/e79021b9-082f-48cb-a98b-91d9b388e94b.gif)

## 什么是`Ollama`

Ollama 是一个专为简化大型语言模型部署和服务而设计的工具.

> 官网链接: [https://ollama.com/](https://ollama.com/)

![](/assets/picgo/e40a6fea5584e703699f6b5d3deab27a.png)

- 安装配置参考如下:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

安装成功后命令行运行`ollama -v`验证安装是否成功!

- 创建用户和组

```bash
sudo useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
sudo usermod -a -G ollama $(whoami)
```

- 编辑配置文件:

llama 服务默认只允许 127.0.0.1:11434 访问,在配置文件中追加下面配置:

```bash
vim /etc/systemd/system/ollama.service
```

`Environment="OLLAMA_HOST=0.0.0.0:11434"`

![](/assets/picgo/96ae8c9b615d2d943bedb784f7395a7a.png)

```bash
echo 'export OLLAMA_HOST="http://0.0.0.0:11434"' >> ~/.bashrc
source ~/.bashrc

# export OLLAMA_HOST=http://0.0.0.0:6399
```

- 重启 Ollama 服务

启动`Ollama`服务: `/usr/local/bin/ollama serve`

```bash
sudo systemctl daemon-reload
sudo systemctl stop ollama
sudo systemctl start ollama
sudo systemctl enable ollama
sudo systemctl restart ollama
```

验证服务是否启动成功:

```bash
curl localhost:11434
```

> Ollama is running

![](/assets/picgo/28e7f8eff716a80e696735d2648b010b.png)

腾讯云编辑器自带的“AI 代码助手”给我们生成一个调用“deepseek-r1”的程序例,例如我们可以用 ai 助手这么问:

```
我现在已经用ollama本地部署了deepseek-r1的大模型，现在写一段测试代码，直接通过ollama调用本地大模型环境，输入 “你是谁”，并生成结果，格式是这样的 curl http://0.0.0.0:11434/api/chat -d '{
  "model": "deepseek-r1:8b",
  "messages": [
    { "role": "user", "content": "你是谁" }
  ]
}'
```

![](/assets/picgo/299e181d14e1c4829a9e4b71650ac1f2.png)

```python
import requests
import json

url = "http://0.0.0.0:6399/api/chat"
data = {
    "model": "deepseek-r1:8b",
    "messages": [
        { "role": "user", "content": "你是谁" }
    ]
}
headers = {'Content-Type': 'application/json'}
response = requests.post(url, data=json.dumps(data), headers=headers)
result = response.json()
print(result)
```

- http 接口服务

```bash
# 调用生成接口
curl http://0.0.0.0:6399/api/generate -d '{
  "model": "deepseek-r1:8b",
  "prompt": "你是谁"
}'

# 调用聊天接口
curl http://0.0.0.0:6399/api/chat -d '{
  "model": "deepseek-r1:8b",
  "messages": [{ "role": "user", "content": "你是谁" }]
}'
```

- ollama 常用命令

```bash
# 启动 Ollama 服务，是后续操作的基础。
ollama serve
# 从模型文件创建模型，适用于自定义模型或本地已有模型文件的情况。
ollama create
# 显示模型信息，可查看模型架构、参数等详细信息，辅助模型分析。
ollama show
# 运行模型，例如运行名为 'qwen2' 的模型，若本地无该模型会自动下载并运行，可用于快速测试模型。
ollama run qwen2
# 从注册表中拉取模型，例如拉取名为 'llama3' 的模型，方便获取官方或其他来源的模型。
ollama pull llama3
# 将模型推送到注册表，便于共享模型。
ollama push
# 列出本地已有的模型，方便管理和选择。
ollama list
# 复制模型，可用于备份或创建模型副本。
ollama cp
# 删除模型，释放存储空间。
ollama rm
# 获取任何命令的帮助信息，方便用户快速查询命令用法。
ollama help
```

## 内网穿透对外提供服务

### 内网穿透暴露到公网

```bash
# 安装工具包
apt update && apt install lsof -y
pip install gradio-tunneling gradio

# 查看 ollama 端口
lsof -i -P -n | grep "ollama"
# 启动内网穿透(注意替换为你的ollama端口)
/root/miniforge3/bin/gradio-tun --port 6399

# 自动配置内网穿透端口
PORT=$(lsof -i -P -n | grep "ollama" | awk '{print $9}' | cut -d':' -f2) && /root/miniforge3/bin/gradio-tun --port $PORT
```

> 公网访问地址：https://***.gradio.live
>
> 这个共享链接将在 72 小时后过期，此程序将在 72 小时后关闭。

```bash
# 每天0点自动重启
crontab -e
0 0 * * * /root/miniforge3/bin/gradio-tun --port 6399
```

### 电脑/手机/网页访问该模型

- 电脑端

例如可以使用[Cherry Studio](https://cherry-ai.com/)这种服务,配置自己 AI 模型就能提供对外服务.

![](/assets/picgo/cdb68783bf3863fce4672f79372d11a6.png)

本地模型无需填写 API 秘钥,其余地址按照提示填写,如图所示:

![](/assets/picgo/d03e68ea6d32be0cd0d5da7599b35e40.png)

默认模型选择刚才配置的自定义模型`deepseek-r1:8b`

![](/assets/picgo/23bc3701d1394702d00442682d058a68.png)

对话中测试"你是谁?"

![](/assets/picgo/0403e14d76fa9ad13f90343712db9959.png)

- 移动端

或者[Chatbox](https://chatboxai.app/zh) 是一款 AI 客户端应用和智能助手,支持众多先进的 AI 模型和 API，可在 Windows、MacOS、Android、iOS、Linux 和网页版上使用.

![](/assets/picgo/df707b694435a336126f23497fe43d6f.png)

左下角设置:

![](/assets/picgo/a7979795c59fbf6b0066b8511a635ed1.png)

模型提供方选择 OllamaApi:

> 填写 api 域名以及模型名称(`deepseek-r1:8b`)

![](/assets/picgo/1ad480350dad5a1b425d5f5a026748cc.png)

聊天对话框就能调用该模型:

![](/assets/picgo/c343fd2de9011f9ccf4b982d359bffeb.png)

- 类似推荐

**电脑端演示如下:**

> 官网地址: [BotGem](https://botgem.com/)

![](/assets/picgo/b02b9b033565264d62206831e9563321.png)

同样的设置 api 域名:

![](/assets/picgo/cb3905c36d7d24e64c15fd75bf5310e2.png)

设置模型名称:

![](/assets/picgo/dd9e22bfcfc7eadd06e007b4aa8b36e9.png)

开始对话测试:

![](/assets/picgo/c05b0dec479d696ec926d0d9099b56d2.png)

**手机端演示如下:**

第一步: 底部操作栏设置 > OpenAI 设置: 设置 api 域名

![](/assets/picgo/2097cb4022ebf061c2a34df146acd18a.png)

添加 API Server

![](/assets/picgo/c798675c5506aa13316c339971ce61cd.png)

添加成功后再次点击该域名,选中后使用该 api 地址
:

![](/assets/picgo/fa6061e40011a9d392e916e5310318f2.png)

第二步: 底部操作栏设置 > 对话设置: 设置模型名称

![](/assets/picgo/f3b5edab05135a0d2367948c7d8d53c2.png)

同样的,添加自定义模型名称:

![](/assets/picgo/9637aa8c08a967c343e889d99e188fc2.png)

再次点击选中后使用该模型:

![](/assets/picgo/144d2b4f38123a72d8f47bc9c69ed0d5.png)

第三步: 开始对话

![](/assets/picgo/afdd01203e40f97fbad0205dbcab1bde.png)

## 总结

本文主要介绍了本地已部署了 AI 大模型的后续操作,首先通过开启远程访问端口,再利用内网穿透技术暴露到公网,对外提供了 api 服务.

![](/assets/picgo/0c656e5b8e78f141f0118132ee88a3dc.png)

然后,将上述得到的公网地址和模型名称整合到第三方 ai 应用就能实现自己的 ai 对话客户端,介绍了三款相关应用,推荐第一个`Cherry Studio`颜值好看!

![](/assets/picgo/26eaec361e3f974996ea6fce0b967089.png)

> 新年快乐！
>
> 愿新的一年带给您健康、幸福和财运亨通！无论是通过投资、创业、副业，还是其他让人发财的方法，愿每一位阅读过文章的朋友都能在这一年里实现自己的财务目标，收获满满！祝愿您在新的一年里，事业蒸蒸日上，生活如意！

`tips`：虽然每个月赠送 1 万分钟,但是 24 小时开机基本维持一周左右.

如果用完之后,可以回到首页直接点击关机即可!

![](/assets/picgo/5279a5b4518713358dcb7b186de3121a.png)

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
