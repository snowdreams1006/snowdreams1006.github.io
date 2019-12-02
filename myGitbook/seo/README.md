# 优化搜索

- [gitbook-plugin-baidu-ziyuan](https://github.com/ainiok/gitbook-plugin-baidu-ziyuan)

```js
require(['gitbook'], function(gitbook){
    gitbook.events.bind("start", function(e,config){
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else {
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    });
});
```

- [gitbook-plugin-siteverification](https://github.com/halaproliu/gitbook-plugin-siteVerification)

```js
var tester = require('gitbook-tester');

tester.builder()
  .withContent('Test baidu and google')
  .withBookJson({ plugins: ['siteVerification'] })
  .withBookJson({ pluginsConfig: { siteVerification: { baidu: '222' } } })
  .create()
  .then(function(result) {
    console.log(result[0].content)
  });
```

## 站点地图

```bash
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
```

- [gitbook-plugin-sitemap-general](https://www.npmjs.com/package/gitbook-plugin-sitemap-general)
- [gitbook-plugin-siteverification](https://www.npmjs.com/package/gitbook-plugin-siteverification)
- [gitbook-plugin-push-bd](https://www.npmjs.com/package/gitbook-plugin-push-bd)
- [hexo-generator-sitemap](https://www.npmjs.com/package/hexo-generator-sitemap)
- [hexo-generator-baidu-sitemap](https://www.npmjs.com/package/hexo-generator-baidu-sitemap)

> [https://github.com/robots.txt](https://github.com/robots.txt)

## 搜索网站提交入口

- [百度搜索](https://ziyuan.baidu.com/linksubmit/url)
- [谷歌搜索](https://www.google.com/webmasters/tools/home?hl=zh-CN)
- [360搜索](http://info.so.360.cn/site_submit.html)
- [搜狗搜索](http://fankui.help.sogou.com/index.php/web/web/index?type=1)
- [必应搜索](https://blogs.bing.com/webmaster/september-2018/Anonymous-URL-Submission-Tool-Being-Retired)
- [神马搜索](https://zhanzhang.sm.cn/)

## 独立博客提交入口

- [百度搜索](http://ping.baidu.com/ping.html)
- [谷歌搜索](http://blogsearch.google.com/ping)

## 站长平台

- [搜狗站长平台](http://zhanzhang.sogou.com/)
- [360站长平台](http://zhanzhang.so.com/)
- [百度搜索资源平台](https://ziyuan.baidu.com/)
- [谷歌](http://www.google.com/webmasters/tools/)

## 阅读更多

- [如何做好个人博客的seo呢](https://cloud.tencent.com/developer/article/1476882)
- [酒香也怕巷子深，教你一招，轻松让百度收录你的个人站点](https://blog.csdn.net/Mculover666/article/details/101756755)
- [hexo干货系列：（六）hexo提交搜索引擎（百度+谷歌）](https://www.cnblogs.com/tengj/p/5357879.html)
- [博客推广——提交搜索引擎](https://selfboot.cn/2014/12/21/add_blog_to_google/)
- [各大搜索引擎提交入口](https://blog.csdn.net/qq_20343517/article/details/80565639)
- [搜索引擎提交入口](http://www.xusseo.com/seogongju/tjrk/)
- [http://www.soshoulu.com/](http://www.soshoulu.com/daohangtijiao/view695.htm)