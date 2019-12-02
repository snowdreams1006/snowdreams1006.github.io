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


## 阅读更多

- [酒香也怕巷子深，教你一招，轻松让百度收录你的个人站点](https://blog.csdn.net/Mculover666/article/details/101756755)