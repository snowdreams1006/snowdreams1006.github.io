# 常见问题

- 热加载失败

> `gitbook serve` 命令报错,修复文件位置: `~/.gitbook/versions/[version]/lib/cli/serve.js`

```js
/* 代码首行 */
const fs=require("fs");

/* 任意空白位置 */
function deleteFolder(path) {
    let files = [];
    if( fs.existsSync(path) ) {
        files = fs.readdirSync(path);
        files.forEach(function(file,index){
            let curPath = path + "/" + file;
            if(fs.statSync(curPath).isDirectory()) {
                deleteFolder(curPath);
            } else {
                fs.unlinkSync(curPath);
            }
        });
        fs.rmdirSync(path);
    }
}
```

> 找到函数体 `generateBook` ,在 `var outputFolder = getOutputFolder(args);` 下面另起一行写入:

```js
if (server.isRunning()) deleteFolder(outputFolder)
```

- [Gitbook的实用技巧专栏](https://juejin.im/post/6844903991814406158)

- `Error: Missing required argument #1`

`gitbook install` 安装插件失败,建议尝试直接使用 `npm install gitbook-plugin-*` 安装插件.

> `npm install gitbook-plugin-mygitalk` 安装出错插件后,再次运行 `gitbook install` 安装所需插件,重复该过程直至全部安装成功.

```bash
info: install plugin "mygitalk" (*) from NPM with version 0.2.6
C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\node_modules\aproba\index.js:25
    if (args[ii] == null) throw missingRequiredArg(ii)
                          ^

Error: Missing required argument #1
    at andLogAndFinish (C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\fetch-package-metadata.js:31:3)
    at fetchPackageMetadata (C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\fetch-package-metadata.js:51:22)
    at resolveWithNewModule (C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\install\deps.js:490:12)
    at C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\install\deps.js:491:7
    at C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\node_modules\iferr\index.js:13:50
    at C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\fetch-package-metadata.js:37:12
    at addRequestedAndFinish (C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\fetch-package-metadata.js:67:5)
    at returnAndAddMetadata (C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\fetch-package-metadata.js:121:7)
    at pickVersionFromRegistryDocument (C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\lib\fetch-package-metadata.js:138:20)
    at C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\node_modules\iferr\index.js:13:50
```

- `ENOENT: no such file or directory`

> `gitbook serve` 启动服务命令报错,修复文件位置: `~/.gitbook/versions/3.2.3/lib/output/website/copyPluginAssets.js`

搜索并全部替换: 将 `confirm: true` 全部替换为 `confirm: false` (无需询问,直接操作)

```bash
Error: ENOENT: no such file or directory, stat 'F:\dev\snowdreams1006.github.io\
_book\gitbook\gitbook-plugin-edit-link-plus\plugin.js'
```

- `internal/streams/legacy.js:57`

> `gitbook pdf` 导出pdf命令报错,更改为 `gitbook pdf --log=debug` 定位离出错位置最近的 `markdown` 源文件,二分法定位不支持的语法.

```bash
internal/streams/legacy.js:57
      throw er; // Unhandled stream error in pipe.
      ^

Error: ENOENT: no such file or directory, open 'C:\Users\Administrator\AppData\Local\Temp\tmp-1347263bR7fdRUaDK\fbb7753c.io?style=social'


Error: ENOENT: no such file or directory, open 'C:\Users\Administrator\AppData\Local\Temp\tmp-57481QhkMFHfkZyo\5ad938ff.svg?style=shield'

```

经过二分法不断定位出错位置,最终发现部分html标签语法不支持,仅供参考:

```html
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub followers" src="https://img.shields.io/github/followers/snowdreams1006?style=social">
</a>
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub forks" src="https://img.shields.io/github/forks/snowdreams1006/snowdreams1006.github.io?style=social">
</a>
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub stars" src="https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io?style=social">
</a>
 <a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub watchers" src="https://img.shields.io/github/watchers/snowdreams1006/snowdreams1006.github.io?style=social">
</a>
```

`<img alt="GitHub stars" src="https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io?style=social">` 去掉 `?style=social` 即可,修成后的html如下:

```html
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub followers" src="https://img.shields.io/github/followers/snowdreams1006">
</a>
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub forks" src="https://img.shields.io/github/forks/snowdreams1006/snowdreams1006.github.io">
</a>
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub stars" src="https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io">
</a>
<a href="https://github.com/snowdreams1006/snowdreams1006.github.io" target="_blank">
  <img alt="GitHub watchers" src="https://img.shields.io/github/watchers/snowdreams1006/snowdreams1006.github.io">
</a>
```

- `gitbook pdf` 导出pdf命令出错,重新安装 `svgexport`

> 先使用 `npm uninstall svgexport -g` 卸载旧版本,再使用 `npm install --unsafe-perm -g svgexport` 安装新版本.

```bash
Error: Error with command "svgexport"
```

- `Error: Client network socket disconnected before secure TLS connection was established`

> 确认上网环境正常后多尝试几次

```bash
error: error while generating page "devops/README.md":

Error: Client network socket disconnected before secure TLS connection was established
```

- `Error: read ECONNRESET`

> 多次尝试恢复正常

```
error: error while generating page "other/anti-withdrawback-wechat.md":

Error: read ECONNRESET
```

- `Error: EPERM: operation not permitted` 无权操作

> 暂未寻找到更好的解决办法,有时候重试几次就正常了.

```
events.js:174
      throw er; // Unhandled 'error' event
      ^

Error: EPERM: operation not permitted, open 'F:\dev\snowdreams1006.github.io\_book\gitbook\images\favicon.ico'
Emitted 'error' event at:
    at errorOrDestroy (internal/streams/destroy.js:107:12)
    at WriteStream.onerror (_stream_readable.js:734:7)
    at WriteStream.emit (events.js:198:13)
    at C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\node_modules\graceful-fs\graceful-fs.js:202:14
    at C:\Users\Administrator\.gitbook\versions\3.2.3\node_modules\npm\node_modules\graceful-fs\graceful-fs.js:232:16
    at F:\nodejs\node_global\node_modules\gitbook-cli\node_modules\_npm@5.1.0@npm\node_modules\graceful-fs\graceful-fs.js:241:16
    at F:\nodejs\node_global\node_modules\gitbook-cli\node_modules\_npm@2.15.12@npm\node_modules\graceful-fs\graceful-fs.js:232:16
    at FSReqWrap.args [as oncomplete] (fs.js:140:20)
```

- 网站置灰

> 特殊纪念日全站置灰

```json
    "styles": {
        "website": "assets/css/mourn.css",
        "ebook": "assets/css/mourn.css",
        "pdf": "assets/css/mourn.css",
        "mobi": "assets/css/mourn.css",
        "epub": "assets/css/mourn.css"
     }
```