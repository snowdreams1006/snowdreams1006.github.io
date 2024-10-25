# GoAccess设置标签页icon

![微信公众号「雪之梦技术驿站」](/assets/picgo/6f3b53a1d54f77563e71b92645f520a7.gif)

> **致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标 ★ ” 加上星标，就不会找不到我啦！

## 前言

![](/assets/picgo/c2d5265f23bb5a72378054f3f1d2b654.png)

GoAccess 日志大屏的标签页 icon 和标题都是默认设置,没有修改成自定义设置,不符合常识.

## 排查

查看了 Nginx 反向代理能够正常访问 icon 路径,说明 nginx 配置正常.

[https://goaccess.snowdreams1006.cn/favicon.ico](https://goaccess.snowdreams1006.cn/favicon.ico)

```
# goaccess.snowdreams1006.cn
server {
  listen 443 ssl http2;
  server_name  goaccess.snowdreams1006.cn;

  ...

  # favicon.ico
  location ~* /favicon\.ico$ {
    root /usr/share/nginx/html;
    try_files /favicon.ico =404;
  }
}
```

当我打开 F12 检查网站源码时,小伙伴们发现端倪了吗?

```html
<link rel="icon" href="data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAgAAAAAAAAAAAAAAAEAAAAAAAAADGxsYAWFhYABwcHABfAP8A/9dfAADXrwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIiIiIiIiIiIjMlUkQgAiIiIiIiIiIiIiIzJVJEIAAAIiIiIiIiIiIiMyVSRCAAIiIiIiIiIiIiIRERERERERERERERERERERIiIiIiIiIiIgACVVUiIiIiIiIiIiIiIiIAAlVVIiIiIiIiIiIiIiIhEREREREREREREREREREREAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" type="image/x-icon">
```

base64 解码后的图片是这样的:

![](/assets/picgo/0f0d657c3c92ec76fdfb06227113a386.png)

## 解决

所以,想要正确显示自定义的 icon 的做法就是想办法修改 src 的指向,这用 js 很容易实现.

```js
function changeFavicon(src) {
    var link = document.querySelector("link[rel~='icon']");
    if (!link) {
        link = document.createElement('link');
        link.rel = 'icon';
        document.getElementsByTagName('head')[0].appendChild(link);
    }
    link.href = src;
}

changeFavicon('https://www.snowdreams1006.cn/favicon.ico');
```

刚好,上次自定义 js,不懂的可以看这篇: [GoAccess 自定义每日独立访客面板时间格式：利用 html-custom-js 实现日期显示调整](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484696&idx=1&sn=06bb0691a84c3ab3e3a942f1bf05128f&chksm=fd1f2cd2ca68a5c4e0566ce60a92c6d75622e222cf38dd19a3fcb94208ec1ced68731efa072e&token=1024252396&lang=zh_CN#rd)

**核心思路**:

自定义页面 js,css 以及报告标题可以按照下面这样设置:

```bash
--html-custom-css=<path.css>
Specifies a custom CSS file path to load in the HTML report.

--html-custom-js=<path.js>
Specifies a custom JS file path to load in the HTML report.

--html-report-title=<title>
Set HTML report page title and header.
```

请注意,修改 GoAccess 的配置后,记得要重启一下使其生效:

![](/assets/picgo/b1b26adf625a66a7c10d0d19633a70f2.png)

## 总结

本文通过自定义 js 实现了 GoAccess 的标签页,配合`html-report-title`选项可以修改默认的页面标题.

除此之外,还有`html-custom-css`自定义页面样式,总体来说,`GoAccess`还是很有用,是一款不错的日志分析工具.

![](/assets/picgo/cd9f7e9d2938f5974adc667be85e1c78.png)

## 往期精彩文章

- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484698&idx=1&sn=c874dbfa2f3550b4ea1e88854d4ef80d&chksm=fd1f2cd0ca68a5c6dffa5bf67da755a09aee73d26bb97e67f42d18e0463d3cad2a2fe9e1703f&token=312545539&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连 UserAgent 都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)
- [解锁 Nginx 日志的宝藏：GoAccess——你的实时、交互式 Web 日志分析神器！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484364&idx=1&sn=aad6e42c99bacd72322024f9d5e95239&chksm=fd1f2a06ca68a3105e948e6a1db7098fadd6e5e74fe0cbb87ce736af749611df9611db9216fe&token=312545539&lang=zh_CN#rd)
- [恋爱年龄差背后的秘密](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484177&idx=1&sn=bb9e916c34bfaa9c4559a556df295d48&chksm=c21502f2f5628be4149cf91a652d500b23b1c1da2279fd6a09990c1967c0f8a52d3a5995bb5c&token=658409695&lang=zh_CN#rd)
- [每天一道美味佳肴《糖醋排骨》](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484315&idx=2&sn=dc77fadf4cd5dd3a22bf055b3fee300f&chksm=c2150278f5628b6eb64dd78ebef9d0dda668bdef2a5d73214a1f622235a00212dbcae7058092&token=658409695&lang=zh_CN#rd)

![](/assets/picgo/31f9180b2c2601eb166e885a92d804e3.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`

![](https://files.mdnice.com/user/71390/f67052d4-c06c-422f-ac9a-1933a317f09a.jpg)
