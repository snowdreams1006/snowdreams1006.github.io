# gitbook安装出错

> [Gitbook大揭秘！从崩溃到丝滑运行，一键解决TypeError难题，你也能成为代码修复大师！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485189&idx=1&sn=e4ba7b0ad77ee2a6320360e1cb5fb6c3&chksm=fd1f2ecfca68a7d95b0f996696991aabc78d8e5efa1268e8e1434ca797c95c9bdddb5719d0ba&token=1910690302&lang=zh_CN#rd)


![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/cdf074dc-564e-4016-aaa5-4517826bf9c2.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 前言

由于之前个人[博客网站](https://blog.snowdreams1006.cn/)是采用`Gitbook`技术搭建静态网站.

想要继续发布文章,需要重新装相关环境,重新踩坑总比未知的坑更容易吧!

可如今,早已时过境迁,遇到的这些坑都是新坑,可见`nodejs`版本更新太快,`gitbook`早已不再更新兼容.

![](https://files.mdnice.com/user/71390/dc125b59-2181-49c9-a9cb-34590c70ef06.png)

## 问题

`Gitbook`安装成功后,运行`gitbook init`初始化文档大纲,遇到了下面的报错:

**报错提示**

```
TypeError [ERR_INVALID_ARG_TYPE]: The "data" argument must be of type string or an instance of Buffer, TypedArray, or DataView. Received an instance of Promise
```

于是,翻遍了互联网终于找到了解决方法,于是特意记录下来.

> 报错文件位置: C:\Users\Administrator\.gitbook\versions\3.2.3\lib\init.js

![](https://files.mdnice.com/user/71390/46d72532-8045-426a-8fa7-42db446e75be.png)

**解决方案**

修改代码中第72行的内容,亲测好用:

```
// Write summary
.then(function() {
    var filePath = path.join(rootFolder, summaryFilename);

    return fs.ensureFile(filePath)
    .then(function() {
        logger.info.ln('create ' + path.basename(filePath));
        // return fs.writeFile(filePath, summary.toText(extension));
        return summary.toText(extension).then(stx=>{return fs.writeFile(filePath, stx);});
    });
})
```

![](https://files.mdnice.com/user/71390/818374bd-c7bf-4934-afe9-7aecddbd426f.png)

## 总结

本文讨论了在使用`Gitbook`时遇到的一个常见问题：安装成功后，相关命令无法正常运行，涉及“data”参数类型不正确，错误地接收了Promise实例。

通过直接定位并修改出错位置，成功解决了问题，使`Gitbook`能够正常运行。

![](https://files.mdnice.com/user/71390/44ab1fd4-0495-4a66-9259-f83e57dc0e76.png)

## 往期精彩文章

- [微信公众号开发入门](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485083&idx=1&sn=edeb79ba4dfe1d838e48bd1f1efd034a&chksm=fd1f2f51ca68a647fc8dcea35f6973dd36bcc0d50687a6dd2aa5761700e281dcf5c007f0d49e&token=110724280&lang=zh_CN#rd)
- [申请测试微信公众号](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485114&idx=1&sn=0eb97f345505bb868e0c2b29c50ba577&chksm=fd1f2f70ca68a666e7e0ed08c7662b36d77617eb02d43f6014fffe0dadb1f7cd941984df3cb5&token=110724280&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/2f6cef19-53af-4934-aa53-1e91924b3364.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`