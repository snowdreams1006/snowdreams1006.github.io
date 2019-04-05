# 高级进阶

不论是 `gitbook-cli` 命令行还是 `gitbook editor` 编辑器都离不开 `gitbook` 命令的操作使用,所以再次了解下常用命令.

注意 `gitbook-cli` 是 `gitbook` 的脚手架工具,是 `gitbook` 的扩展功能,同时着管理 `gitbook`.

## 查看 `gitbook` 帮助信息

> 语法格式: `gitbook --help`

示例:

```
$ gitbook --help

  Usage: gitbook [options] [command]


  Options:

    -v, --gitbook [version]  specify GitBook version to use
    -d, --debug              enable verbose error
    -V, --version            Display running versions of gitbook and gitbook-cli
    -h, --help               output usage information


  Commands:

    ls                        List versions installed locally
    current                   Display currently activated version
    ls-remote                 List remote versions available for install
    fetch [version]           Download and install a <version>
    alias [folder] [version]  Set an alias named <version> pointing to <folder>
    uninstall [version]       Uninstall a version
    update [tag]              Update to the latest version of GitBook
    help                      List commands for GitBook
    *                         run a command with a specific gitbook version
$
```

## 列出 `gitbook` 可用命令

> 语法格式: `gitbook help`

示例:

```
$ gitbook help
    build [book] [output]       build a book
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)
        --format                Format to build to (Default is website; Values are website, json, ebook)
        --[no-]timing           Print timing debug information (Default is false)

    serve [book] [output]       serve the book as a website for testing
        --port                  Port for server to listen on (Default is 4000)
        --lrport                Port for livereload server to listen on (Default is 35729)
        --[no-]watch            Enable file watcher and live reloading (Default is true)
        --[no-]live             Enable live reloading (Default is true)
        --[no-]open             Enable opening book in browser (Default is false)
        --browser               Specify browser for opening book (Default is )
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)
        --format                Format to build to (Default is website; Values are website, json, ebook)

    install [book]              install all plugins dependencies
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)

    parse [book]                parse and print debug information about a book
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)

    init [book]                 setup and create files for chapters
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)

    pdf [book] [output]         build a book into an ebook file
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)

    epub [book] [output]        build a book into an ebook file
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)

    mobi [book] [output]        build a book into an ebook file
        --log                   Minimum log level to display (Default is info; Values are debug, info, warn, error, disabled)

$ 
```

## 一些常用命令

### `gitbook build` 构建电子书

> 语法格式: `gitbook build [book] [output]`

示例:

```
# 默认输出到 `_book/` 目录
$ gitbook build 

# 指定输出目录 `/Users/sunpo/Desktop/book/`
$ gitbook build ./ /Users/sunpo/Desktop/book/

# 指定输出格式 `json`
$ gitbook build --format=json
```

### `gitbook serve` 启动本地服务器

> 语法格式: `gitbook serve [book] [output]`

示例:

```
# 默认服务端口: `4000`,热部署端口: `35729`
$ gitbook serve 

# 指定输出目录 `/Users/sunpo/Desktop/book/`
$ gitbook serve ./ /Users/sunpo/Desktop/book/

# 指定服务端口: `5000` 和热部署端口: `45729`
$ gitbook serve --port=5000 --lrport=45729
```

### `gitbook install` 安装插件

> 语法格式: `gitbook install [book]`

示例:

```
# 安装当前项目所需插件
$ gitbook install 

# 安装指定项目所需插件 `/Users/sunpo/Desktop/gitbook-demo/`
$ gitbook install /Users/sunpo/Desktop/gitbook-demo/

# 安装当前项目所需插件且指定日志输出级别: `debug`
$ gitbook install --log=debug
```

### `gitbook parse` 解析电子书

> 语法格式: `gitbook parse [book]`

示例:

```
# 解析并输出当前项目的 `debug` 级别日志信息
$ gitbook parse 

# 解析并输出指定项目的 `/Users/sunpo/Desktop/gitbook-demo/` 的 `debug` 级别日志信息
$ gitbook parse /Users/sunpo/Desktop/gitbook-demo/

# 解析并输出当前项目的 `info` 级别日志信息
$ gitbook parse --log=info
```

### `gitbook pdf` 输出 `PDF` 电子书

> 语法格式: `gitbook pdf [book] [output]`

示例:

```
# 默认输出到当前项目
$ gitbook pdf 

# 指定输出文件 `/Users/sunpo/Desktop/book.pdf`
$ gitbook pdf ./ /Users/sunpo/Desktop/book.pdf

# 指定输出日志级别: `debug`
$ gitbook pdf --log=debug
```

> 可能需要安装 `ebook-convert` 相关插件,详情见相关系列教程.

### `gitbook epub` 输出 `epub` 电子书

> 语法格式: `gitbook epub [book] [output]`

示例:

```
# 默认输出到当前项目
$ gitbook epub 

# 指定输出文件 `/Users/sunpo/Desktop/book.epub`
$ gitbook epub ./ /Users/sunpo/Desktop/book.epub

# 指定输出日志级别: `debug`
$ gitbook epub --log=debug
```

> 可能需要安装 `ebook-convert` 相关插件,详情见相关系列教程.

### `gitbook mobi` 输出 `mobi` 电子书

> 语法格式: `gitbook mobi [book] [output]`

示例:

```
# 默认输出到当前项目
$ gitbook mobi 

# 指定输出文件 `/Users/sunpo/Desktop/book.mobi`
$ gitbook mobi ./ /Users/sunpo/Desktop/book.mobi

# 指定输出日志级别: `debug`
$ gitbook mobi --log=debug
```

> 可能需要安装 `ebook-convert` 相关插件,详情见相关系列教程.



