# GoAccess爬虫黑名单

![微信公众号「雪之梦技术驿站」](https://s2.loli.net/2024/07/23/CHsWfznEuPXTOJZ.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

> 偷偷溜进文章的小广告，别害羞，点进去瞅瞅，说不定能发现什么宝藏呢！文末那个也别错过，说不定是通往秘密花园的钥匙哦！

## 前言

最近服务器安装了`GoAccess`分析日志,每天都有新发现,看到`Crawler`占比有点大,还是要搞清楚哪些是非法爬虫,那些是可以接受的爬虫.

**操作系统**

> 操作系统排序按 [点击量, 平均响应时, 总共响应时, 最高响应时]

![](https://files.mdnice.com/user/71390/d12f338a-43b7-4484-ba74-48c889c87e4a.png)

**浏览器**

> 浏览器排序按 [点击量, 平均响应时, 总共响应时, 最高响应时]

![](https://files.mdnice.com/user/71390/2cb5f755-6cf4-4563-8e3c-c2cb206c5789.png)

通过上述面板均可发现有不少`Crawler`爬虫类,点开还能看到具体的明细,这样就好办了.看谁不爽拉黑谁!

![](https://files.mdnice.com/user/71390/495357fa-19e7-40c6-aab4-c92aa0a7dfff.png)

## 思路

结合自身真实数据分析以及搜索引擎二次确认,归类总结了以下爬虫,简单分类了两种: **有用爬虫**和**无用爬虫**

### 确定黑名单用户代理

重点需要关注**无用爬虫**,屏蔽拉黑减少无用流量.

> 值得注意的是,需要再次确认这些爬虫访问的url是否恶意来最终确认是否要拉黑!

**有用爬虫**

> 搜索类爬虫

- Baiduspider/2.0 百度爬虫

![Baiduspider](https://files.mdnice.com/user/71390/f419cea7-847a-4cda-a5ae-ab27bb140601.png)

```bash
Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)
```

- Baiduspider-render/2.0 百度

![Baiduspider-render](https://files.mdnice.com/user/71390/f419cea7-847a-4cda-a5ae-ab27bb140601.png)

```bash
Mozilla/5.0 (compatible; Baiduspider-render/2.0; +http://www.baidu.com/search/spider.html)
```

- Bytespider 字节跳动爬虫

![Bytespider](https://files.mdnice.com/user/71390/a499f937-1b72-46c4-b3e4-aa05b21c50ae.png)

```bash
Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; https://zhanzhang.toutiao.com/)
```

- Sogou 搜狗

![Sogou web spider](https://files.mdnice.com/user/71390/54eeec06-7b13-42ac-846c-831ba76196d7.png)

```bash
Sogou web spider/4.0(+http://www.sogou.com/docs/help/webmasters.htm#07)
```

- bingbot/2.0 必应爬虫

![bingbot](https://files.mdnice.com/user/71390/240cb29f-0a86-4be4-b961-136a4de3de25.png)

- Googlebot/2.1 谷歌

![Googlebot](https://files.mdnice.com/user/71390/ff20581d-1f8f-48d1-8279-b20d9b33cf37.png)

```bash
Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
```

- Googlebot-Image/1.0 谷歌图片

![Googlebot-Image](https://files.mdnice.com/user/71390/ff20581d-1f8f-48d1-8279-b20d9b33cf37.png)

- GoogleOther 谷歌其他

![GoogleOther](https://files.mdnice.com/user/71390/ff20581d-1f8f-48d1-8279-b20d9b33cf37.png)

```bash
Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.6478.182 Mobile Safari/537.36 (compatible; GoogleOther)
```

- AppEngine-Google 谷歌PaaS开发平台

![GoogleOther](https://files.mdnice.com/user/71390/ff20581d-1f8f-48d1-8279-b20d9b33cf37.png)

- Applebot/0.1 苹果

![Applebot](https://files.mdnice.com/user/71390/de4336b8-160c-482b-a510-8487e61adc61.png)

```bash
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)
```

- Amazonbot/0.1 亚马逊

![Amazonbot](https://files.mdnice.com/user/71390/69a6d214-be36-4f9e-8765-803e263630d1.png)

```bash
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)
```

- GPTBot/1.2 GPT

![GPTBot](https://files.mdnice.com/user/71390/9406d5a1-ced1-44ef-be25-448fedeb831b.png)

```bash
Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.2; +https://openai.com/gptbot)
```

**无用爬虫**

> 扫描类爬虫

- CensysInspect/1.1 漏洞扫描平台

![CensysInspect](https://files.mdnice.com/user/71390/193aa368-9a01-4868-b01a-47d0960ea4d0.png)

```bash
Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)
```

- SemrushBot/7~bl 营销竞争情报平台

![SemrushBot](https://files.mdnice.com/user/71390/9c922e87-636f-4d8e-a6eb-456473f873db.png)

```bash
Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)
```

- InternetMeasurement/1.0 待定

![InternetMeasurement](https://files.mdnice.com/user/71390/0468acc7-8fb2-461d-a332-ec67e0a4d862.png)

```
Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)
```

- DotBot/1.2 反向链接爬虫

![DotBot](https://files.mdnice.com/user/71390/f03029f8-516d-4f8f-99bd-8142f3595377.png)

```bash
Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)
```

- Unknown 未知

> `Unknown` 指的是未知用户代理

```bash
Java/22.0.2
curl/8.1.2
Custom-AsyncHttpClient
YisouSpider
Engine
python-requests
KrebsOnSecurity
axios/0.27.2
```

假如`nginx`日志格式如下:

```
# nginx 日志格式
log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                  '$status $body_bytes_sent "$http_referer" '
                  '"$http_user_agent" "$http_x_forwarded_for"';
```

那么可以拿来即用: `awk -F '"' '{print $6}' access.log` 查看全部用户代理,再经过上述统计出来的异常浏览器,可以查看到具体的请求日志.

```bash
# 查看全部用户代理并统计次数 http_user_agent
awk -F '"' '{print $6}' access.log | sort | uniq -c | sort -rn

# 查看全部状态码并统计次数 status
awk '{print $9}' access.log | sort | uniq -c | sort -rn

# 查看全部请求地址并统计次数 request
awk -F '"' '{print $2}' access.log | sort | uniq -c | sort -rn
```

### 实现拉黑ip操作

禁止黑名单用户代理访问,可以使用`nginx`实现拒绝访问也可以系统防火墙直接拉黑.接下来采用第一张`nginx`直接返回`403`状态码.

```bash
InternetMeasurement
SemrushBot
CensysInspect
YisouSpider
Engine
KrebsOnSecurity
DotBot
Custom-AsyncHttpClient
python-requests
axios
curl
```

> `InternetMeasurement|SemrushBot|CensysInspect|YisouSpider|Engine|KrebsOnSecurity|DotBot|Custom-AsyncHttpClient|python-requests|axios|curl`

![](https://files.mdnice.com/user/71390/1c862c3d-3d2c-4fb4-8288-9fa25ae316a8.png)

针对上述`http_user_agent`进行拉黑,利用`nginx`的`map`指令在`http`指令块定义黑名单指令`limit_access `,然后在`server`块或`location`块引用该变量`limit_access `.

```bash
http {  
    # 定义黑名单ua规则limit_access
    map $http_user_agent $limit_access {
        ~*(InternetMeasurement|SemrushBot|CensysInspect|YisouSpider|Engine|KrebsOnSecurity|DotBot|Custom-AsyncHttpClient|python-requests|axios|curl) 1;
        default 0;
    }
    
    server {  
        ...  
  
        location / {  
            if ($limit_access) {
                return 403;
            }  
  
            # 其他处理逻辑  
            try_files $uri $uri/ /index.html;  
        }
  
        ...  
    }  
}
```

`nginx -t` 检测通过后，通过 `service nginx reload` 或者 `nginx -s reload` 刷新配置就可以生效了.

```bash
# 模拟curl请求: 被拉黑403
$ curl -I https://blog.snowdreams1006.cn
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   153    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0HTTP/1.1 403 Forbidden
Server: nginx/1.21.5
Date: Thu, 01 Aug 2024 06:27:11 GMT
Content-Type: text/html
Content-Length: 153
Connection: keep-alive


# 模拟百度爬虫: 正常200
$ curl -I -A "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/sear" https://blog.snowdreams1006.cn
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   99k    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0HTTP/1.1 200 OK
Server: nginx/1.21.5
Date: Thu, 01 Aug 2024 06:29:23 GMT
Content-Type: text/html
Content-Length: 101390
Connection: keep-alive
Vary: Accept-Encoding
Last-Modified: Mon, 29 Jul 2024 07:06:14 GMT
ETag: "66a73f66-18c0e"
Accept-Ranges: bytes

```

如果知道异常ip也可以使用防火墙级别拉黑,推荐使用`ufw`取代`iptable`命令,这里不再赘述.

> [Nginx反爬虫攻略：禁止某些User Agent抓取网站](https://blog.csdn.net/slovyz/article/details/73243926 "Nginx反爬虫攻略：禁止某些User Agent抓取网站")
>
> [Nginx 解决error.log和access.log日志的改善总结](https://cloud.tencent.com/developer/article/2223141 "Nginx 解决error.log和access.log日志的改善总结")

## 总结

本文主要介绍了如果利用`GoAccess`分析出异常浏览器,识别出爬虫分类,基于互联网公开资料有选择性拉黑某些恶意爬虫.

最后利用`nginx`的转发规则,将用户代理`http_user_agent`正则匹配`~*`那些恶意浏览器,拒绝访问`403`.

思考一下: 有些代理可能善于伪装用户代理,还可以根据状态码进行辅助判断,出现非`2XX`的尤其需要关注.

![](https://files.mdnice.com/user/71390/0d68c192-a3bd-48a1-8323-f86417de7daf.png)

嘿，小伙伴们，你们知道吗？这字儿可不是白码的，每一颗键帽下的汗水都能浇出一朵花来！所以，要是看得开心，就请大方地撒点阳光——评论点赞转发走一波，让我这花园更加灿烂！

![](https://s2.loli.net/2024/07/23/gidnr39eTmzqvDY.webp)

## 往期精彩文章

- [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s/CcbhNsdorentS9jHTwAOMQ)
- [GoAccess中配置geoip支持ip地理位置](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HArebnqO4mbeqKrubRMmUIqSqlwjekBCPRKSH5bmrwrxcP3pDPPAoUg2kxZjPVpDUIlyjFo#rd)
- [GoAccess中配置websocket支持实时日志](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484441&idx=1&sn=12996994a835aba76076d0b749ef9aaf&chksm=fd1f2dd3ca68a4c5417ff3b2d02cedf1f6f721db1616f2f8824b9824c000a28226901888f6b5&token=1667898534&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](https://s2.loli.net/2024/07/23/G1JLeUsXThgWFwP.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`