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

```
$ gitbook init
```

### 启动 `gitbook` 项目

启动本地服务,程序无报错则可以在浏览器预览电子书效果: [http://localhost:4000]( http://localhost:4000)

```
$ gitbook serve
```

### 构建 `gitbook` 静态网页

构建静态网页而不启动本地服务器,默认生成文件存放在 `_book/` 目录,当然输出目录是可配置的,暂不涉及,见高级部分.

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

### `README.md` 首页文件

### `SUMMARY.md` 概括文件

### `_book` 输出目录

### `book.json` 配置文件

### `GLOSSARY.md` 词汇表文件

### 章节小结






