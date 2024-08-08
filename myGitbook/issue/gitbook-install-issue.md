# gitbook安装出错

> 参考资料: [gitbook init报TypeError [ERR_INVALID_ARG_TYPE]](https://blog.csdn.net/qq_33641175/article/details/122508473)

> C:\Users\Administrator\.gitbook\versions\3.2.3\lib\init.js

![](https://files.mdnice.com/user/71390/46d72532-8045-426a-8fa7-42db446e75be.png)

解决方案:

```
// Write summary
.then(function() {
    var filePath = path.join(rootFolder, summaryFilename);

    return fs.ensureFile(filePath)
    .then(function() {
        logger.info.ln('create ' + path.basename(filePath));
        // return fs.writeFile(filePath, summary.toText(extension));
        return summary.toText(extension).then(stx=>{return fs.writeFile(filePath, stx);})
    });
})
```

![](https://files.mdnice.com/user/71390/818374bd-c7bf-4934-afe9-7aecddbd426f.png)
