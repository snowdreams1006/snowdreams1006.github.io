# 无浏览器环境下测试网速

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.
  
现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/478bce29701d85c60553d9ddc3d1afea.gif)

## 浏览器环境

如果你想知道自己所处环境的网速如何,那么最直接的办法就是测网速,刚好就有这么一个网址可以测试当前环境网速.

> 测速网: [https://www.speedtest.cn/](https://www.speedtest.cn/)

![](/assets/picgo/9057651786a881684e4ee832eafdec6a.png)

只要用浏览器打开,点击**测试**耐心等待测试结果

![](/assets/picgo/9d69e2303730e668bbb879fa7348ed80.png)

如果你有多个办公环境,用浏览器测试一下就能得到不同环境的网速.

## 纯脚本环境

如果没有浏览器环境,那么就不能使用上述办法,推荐一款适合脚本环境中测速的工具包.

> 测试命令行: [Speedtest® CLI](https://www.speedtest.net/zh-Hans/apps/cli)

![](/assets/picgo/f626d5310ef57155e429cb80ba1aadac.png)

支持各类操作系统,包括linux服务器,下面以`centos`服务器为例演示:

```bash
## If migrating from prior bintray install instructions please first...
# sudo rm /etc/yum.repos.d/bintray-ookla-rhel.repo
# sudo yum remove speedtest
## Other non-official binaries will conflict with Speedtest CLI
# Example how to remove using yum
# rpm -qa | grep speedtest | xargs -I {} sudo yum -y remove {}
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
sudo yum install speedtest
```

安装成功后,运行`speedtest`开始测速,等待一段时间出现测速报告.

![](/assets/picgo/08b4ff57e69acc69f07d1230aed70489.png)

## 总结

如果当前环境有浏览器可以直接在线测网速,只有纯脚本环境的话也可以使用`speedtest`来检测网络状况,简单易上手,这一点还是很不错的工具呢!

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


