# gitbook-cli 命令行操作

`gitbook` 生成电子书主要有三种方式:

- `gitbook-cli` 命令行操作,简洁高效,适合从事软件开发的相关人员.
- `gitbook-editor` 编辑器操作,可视化编辑,适合无编程经验的文学创作者.
- `gitbook.com` 官网操作,在线编辑实时发布,适合无本地环境且科学上网的体验者.

本文主要讲解第一种 `gitbook-cli` 命令行操作流程,其他两种见另外两篇教程.

## `gitbook` 的一些常用命令

### 安装 `gitbook-cli` 脚手架工具

本机已安装 `node.js` 开发环境,安装完成后运行 `gitbook -V` 能够打印出版本信息,则表示安装成功.

```
$ sudo npm install -g gitbook-cli
```

> 关于安装配置相关问题请参考 [环境要求](https://snowdreams1006.github.io/myGitbook/preparation/environmental-requirements.html)

### 初始化 `gitbook` 项目

初始化项目,按照 `gitbook` 规范会自动创建 `README.md` 和 `SUMMARY.md` 两个文件,具体用途见下文.

其实 `SUMMARY.md` 是电子书的章节目录,`gitbook` 会初始化相应的文件目录结构,所以主要是用于**开发初始阶段**.

```
$ gitbook init
```

### 启动 `gitbook` 项目

启动本地服务,程序无报错则可以在浏览器预览电子书效果: [http://localhost:4000]( http://localhost:4000)

由于能够实时预览电子书效果,并且大多数开发环境搭建在本地而不是远程服务器中,所以主要用于**开发调试阶段**.

```
$ gitbook serve
```

### 构建 `gitbook` 静态网页

构建静态网页而不启动本地服务器,默认生成文件存放在 `_book/` 目录,当然输出目录是可配置的,暂不涉及,见高级部分.

输出静态网页后可打包上传到服务器,也可以上传到 `github` 等网站进行托管,因而主要用于**发布准备阶段**.

```
$ gitbook build
```

### 章节小结

- `gitbook init` 初始化 `README.md` 和 `SUMMARY.md` 两个文件.
- `gitbook build` 本地构建但不运行服务,默认输出到 `_book/` 目录.
- `gitbook serve` 本地构建并运行服务,默认访问 `http://localhost:4000` 实时预览.
 
```
# 创建 `gitbook` 演示项目
$ mkdir gitbook-demo

# 初始化项目
$ gitbook init
warn: no summary file in this book 
info: create README.md 
info: create SUMMARY.md 
info: initialization is finished 

# 启动本地服务器
$ gitbook serve
Live reload server started on port: 35729
Press CTRL+C to quit ...

info: 7 plugins are installed 
info: loading plugin "livereload"... OK 
info: loading plugin "highlight"... OK 
info: loading plugin "search"... OK 
info: loading plugin "lunr"... OK 
info: loading plugin "sharing"... OK 
info: loading plugin "fontsettings"... OK 
info: loading plugin "theme-default"... OK 
info: found 1 pages 
info: found 0 asset files 
info: >> generation finished with success in 1.2s ! 

Starting server ...
Serving book on http://localhost:4000

# 查看当前目录结构
$ tree
.
├── README.md
├── SUMMARY.md
└── _book
    ├── gitbook
    │   ├── fonts
    │   │   └── fontawesome
    │   │       ├── FontAwesome.otf
    │   │       ├── fontawesome-webfont.eot
    │   │       ├── fontawesome-webfont.svg
    │   │       ├── fontawesome-webfont.ttf
    │   │       ├── fontawesome-webfont.woff
    │   │       └── fontawesome-webfont.woff2
    │   ├── gitbook-plugin-fontsettings
    │   │   ├── fontsettings.js
    │   │   └── website.css
    │   ├── gitbook-plugin-highlight
    │   │   ├── ebook.css
    │   │   └── website.css
    │   ├── gitbook-plugin-livereload
    │   │   └── plugin.js
    │   ├── gitbook-plugin-lunr
    │   │   ├── lunr.min.js
    │   │   └── search-lunr.js
    │   ├── gitbook-plugin-search
    │   │   ├── lunr.min.js
    │   │   ├── search-engine.js
    │   │   ├── search.css
    │   │   └── search.js
    │   ├── gitbook-plugin-sharing
    │   │   └── buttons.js
    │   ├── gitbook.js
    │   ├── images
    │   │   ├── apple-touch-icon-precomposed-152.png
    │   │   └── favicon.ico
    │   ├── style.css
    │   └── theme.js
    ├── index.html
    └── search_index.json

11 directories, 27 files
$ 
```

![gitbook-serve.gif](../images/gitbook-serve.gif)

## `gitbook` 的目录结构说明

既然要书写一本电子书,那么起码的章节介绍和章节详情自然是必不可少的.

当然还有标题,作者和联系方式等个性化信息需要指定,如果不指定的话,一旦采用默认配合,八成不符合我们的预期,说不定都会变成匿名电子书?所以配置文件一般也是需要手动设置的!

真正可选的文件要数词汇表了,毕竟不是每一本电子书都有专业词汇需要去解释说明.如果在章节详情顺便解释下涉及到的专业词汇,那么自然也就不需要词汇表文件了.

简单解释下各个文件的作用:

- `README.md` 是默认首页文件,相当于网站的首页 `index.html` ,一般是介绍文字或相关导航链接.
- `SUMMARY.md` 是默认概括文件,主要是根据该文件内容生成相应的目录结构,同 `README.md` 一样都是被`gitbook init` 初始化默认创建的重要文件.
- `_book` 是默认的输出目录,存放着原始 `markdown` 渲染完毕后的 `html` 文件,可以直接打包到服务器充当**静态网站**使用.
- `book.json` 是配置文件,用于个性化调整 `gitbook` 的相关配置,如定义电子书的标题,封面,作者等信息,是执行 `gitbook build` 或 `gitbook serve` 自动生成的.
- `GLOSSARY.md` 是默认的词汇表,主要说明专业词汇的详细解释,这样阅读到专业词汇时就会有相应提示信息,和 `book.json` 一样是手动创建并且是可选的.

### `README.md` 首页文件[必须]

编辑 `README.md` 文件,随便写点内容并启动本地服务(`gitbook serve`)实时预览效果.

![gitbook-experience-cli-readme.png](../images/gitbook-experience-cli-readme.png)

### `SUMMARY.md` 概括文件[必须]

先停止本地服务,编辑章节目录结构,然后重新再初始化(`gitbook init`)自动创建相应目录.

![gitbook-experience-cli-summary.gif](../images/gitbook-experience-cli-summary.gif)

### `_book` 输出目录[可选]

执行 `gitbook build` 或 `gitbook serve` 命令后会自动生成静态网页.

```
# 构建电子书
$ gitbook build
info: 7 plugins are installed 
info: 6 explicitly listed 
info: loading plugin "highlight"... OK 
info: loading plugin "search"... OK 
info: loading plugin "lunr"... OK 
info: loading plugin "sharing"... OK 
info: loading plugin "fontsettings"... OK 
info: loading plugin "theme-default"... OK 
info: found 5 pages 
info: found 0 asset files 
info: >> generation finished with success in 0.7s ! 

# 查看输出目录
$ tree _book/
_book/
├── first
│   ├── 01.html
│   └── 02.html
├── first.html
├── gitbook
│   ├── fonts
│   │   └── fontawesome
│   │       ├── FontAwesome.otf
│   │       ├── fontawesome-webfont.eot
│   │       ├── fontawesome-webfont.svg
│   │       ├── fontawesome-webfont.ttf
│   │       ├── fontawesome-webfont.woff
│   │       └── fontawesome-webfont.woff2
│   ├── gitbook-plugin-fontsettings
│   │   ├── fontsettings.js
│   │   └── website.css
│   ├── gitbook-plugin-highlight
│   │   ├── ebook.css
│   │   └── website.css
│   ├── gitbook-plugin-lunr
│   │   ├── lunr.min.js
│   │   └── search-lunr.js
│   ├── gitbook-plugin-search
│   │   ├── lunr.min.js
│   │   ├── search-engine.js
│   │   ├── search.css
│   │   └── search.js
│   ├── gitbook-plugin-sharing
│   │   └── buttons.js
│   ├── gitbook.js
│   ├── images
│   │   ├── apple-touch-icon-precomposed-152.png
│   │   └── favicon.ico
│   ├── style.css
│   └── theme.js
├── index.html
├── search_index.json
└── second.html

10 directories, 28 files
$ 
```

### `book.json` 配置文件[可选]

在根目录下新建 `book.json` 配置文件,完整的支持项请参考[官方文档](https://toolchain.gitbook.com/config.html),下面仅列举常用的一些配置项.

![gitbook-experience-cli-book-config.png](../images/gitbook-experience-cli-book-config.png)

#### `title` 标题

> 书籍的标题

示例:

```
"title": "雪之梦技术驿站"
```

#### `author` 作者

> 书籍的作者

示例:

```
"author": "snowdreams1006"
```

#### `description` 描述

> 书籍的简要描述

示例:

```
  "description": "雪之梦技术驿站又名snowdreams1006的技术小屋.主要分享个人的学习经验,一家之言,仅供参考."
```

#### `isbn` 国际标准书号

> 书籍的国际标准书号

示例:

```
  "isbn": "978-0-13-601970-1"
```

> 选填,请参考 [ISBN Search](https://isbnsearch.org/)

#### `language` 语言

> 支持语言项: 默认英语(`en`),设置成简体中文(`zh-hans`)

```
en, ar, bn, cs, de, en, es, fa, fi, fr, he, it, ja, ko, no, pl, pt, ro, ru, sv, uk, vi, zh-hans, zh-tw
```

示例:

```
"language": "zh-hans"
```

#### `direction` 阅读顺序

> 阅读顺序,支持从右到左(`rtl`)或从左到右(`ltr`),默认值取决于语言值.

示例:

```
"direction" : "ltr"
```

#### `gitbook` 版本

> 指定 `gitbook` 版本,支持[SemVer规范](http://semver.org/),接受类似于 `>=3.2.3` 的条件.

示例:

```
"gitbook": "3.2.3"
```

#### `root` 根目录

#### `links` 侧边栏链接

#### `styles` 自定义样式

#### `plugins` 插件

#### `pluginsConfig` 插件配置

#### `structure` 目录结构配置

### `GLOSSARY.md` 词汇表文件[可选]

### 章节小结






