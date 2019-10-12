# TODO清单

- [nodejs-操作文件系统读取写入文件](https://blog.csdn.net/songmaolin_csdn/article/details/52910771)
- [10分钟教你撸一个nodejs爬虫系统](https://www.jianshu.com/p/56ce4f3f0060?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)
- [NodeJs+Request+Cheerio 采集数据](https://www.cnblogs.com/zqzjs/p/5487348.html)
- [nodejs模拟登录-request模块](https://blog.csdn.net/zzwwjjdj1/article/details/77472398)
- [GitHub Wiki 页面的添加和设置](https://juejin.im/post/5a3216c8f265da43333e6b54)
- [Kingfisher](https://github.com/onevcat/Kingfisher)



```bash
$ npm version patch
```

```bash
$ git tag
```

```bash
$ git push origin v0.0.2
```



```bash
$ npm install -g cnpm --registry=https://registry.npm.taobao.org
```

> https://johnnyting.github.io/posts/%E4%BD%BF%E7%94%A8%E5%91%BD%E4%BB%A4%E5%BF%AB%E9%80%9F%E7%94%9F%E6%88%90readmegitignore%E6%96%87%E4%BB%B6/

```bash
readme
```

> https://github.com/kefranabg/readme-md-generator

- https://github.com/github/gitignore/
- http://www.gitignore.io/

```json
"engines": {
    "gitbook": ">=2.4.3"
  },
  "gitbook": {
    "properties": {
      "blogId": {
        "type": "string",
        "required": true,
        "description": "Openwrite blogId."
      },
      "name": {
        "type": "string",
        "required": true,
        "description": "Blog name."
      },
      "qrcode": {
        "type": "string",
        "required": true,
        "description": "Wechat qrcode."
      },
      "keyword": {
        "type": "string",
        "required": true,
        "description": "Wechat keyword."
      }
    }
  }
```

INFO  Install dependencies
npm WARN deprecated core-js@1.2.7: core-js@<2.6.8 is no longer maintained. Please, upgrade to core-js@3 or at least to actual version of core-js@2.
npm ERR! code EACCES
npm ERR! syscall open
npm ERR! path /Users/sunpo/.npm/_cacache/index-v5/51/d3/7697273802dffa158119427da833e251b88e0e9d4c73d8f5f964476884f4
npm ERR! errno -13
npm ERR! 
npm ERR! Your cache folder contains root-owned files, due to a bug in
npm ERR! previous versions of npm which has since been addressed.
npm ERR! 
npm ERR! To permanently fix this problem, please run:
npm ERR!   sudo chown -R 501:20 "/Users/sunpo/.npm"

npm ERR! A complete log of this run can be found in:
npm ERR!     /Users/sunpo/.npm/_logs/2019-10-09T01_40_58_136Z-debug.log
WARN  Failed to install dependencies. Please run 'npm install' manually!

sunpodeMacBook-Pro:hexo-plugin-readmore sunpo$ sudo chown -R 501:20 "/Users/sunpo/.npm"
Password:
sunpodeMacBook-Pro:hexo-plugin-readmore sunpo$ npm install
npm notice created a lockfile as package-lock.json. You should commit this file.
up to date in 1.429s
found 0 vulnerabilities
