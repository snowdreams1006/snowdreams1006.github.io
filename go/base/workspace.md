# 工作空间

搭建好 `Go` 的基本环境后,现在可以正式开始 `Go` 语言的学习之旅,初学时建议在默认的 `GOPATH` 工作空间规范编写代码,基本目录结构大概是这个样子.

```bash
.
|-- bin
|   `-- hello.exe
|-- pkg
|   `-- windows_amd64
|       `-- github.com
|           `-- snowdreams1006
|               `-- learn-go
|                   `-- strings.a
`-- src
    `-- github.com
        `-- snowdreams1006
            `-- learn-go
                |-- README.md
                |-- hello
                |   `-- hello.go
                `-- strings
                    |-- reverse.go
                    `-- reverse_test.go
```

`Go` 相关的代码保存在工作空间中,而工作空间目录默认情况下是 `GOPATH` 环境变量所指向的目录(例如: `GOPATH=C:\Users\snowdreams006-win7\go`).

工作空间下一般应包括三个一级子目录,分别是 `src`,`pkg` 和 `bin` 目录,其中最重要的就是 `src` 源码目录,其余两个目录都是派生目录.

- `src` 目录是**源代码**目录,是平时写代码的地方.
- `pkg` 目录是**包对象**目录,里面的文件大多以 `.a` 为后缀名,`Go` 工具自动处理,暂时不用关心.
- `bin` 目录是**可执行命令**目录,是最终产出的文件,例如 `Windows` 平台一般会生成 `.exe` 文件.

> 如果你刚刚安装 `Go` 语言或者不是默认形式安装的 `Go`,打开命令行窗口运行 `go env` 查看 `GOPATH` 那一项,`GOPATH` 指代的目录就是工作空间.

![go-base-workspace-go-env.png](../images/go-base-workspace-go-env.png)

## 体验别人的 `Go` 命令

默认情况下,刚刚安装完毕的 `Go` 环境并不会自动创建工作空间目录,可以手动创建也可以运行别人的 `Go` 命令时顺便创建.

```bash
snowdreams1006-win7@WIN-FANS2DDDB06 MINGW64 /
# 初始时工作空间并未创建
$ ls $GOPATH
ls: cannot access 'C:\Users\snowdreams1006-win7\go': No such file or directory

snowdreams1006-win7@WIN-FANS2DDDB06 MINGW64 /
# 下载别人的 `Go` 命令顺便创建了工作空间
$ go get github.com/snowdreams1006/learn-go/hello

snowdreams1006-win7@WIN-FANS2DDDB06 MINGW64 /
# 已经按照标准目录结构创建完毕,目前有src和bin目录就足够了
$ ls $GOPATH
bin/  src/
```

运行完 `go get github.com/snowdreams1006/learn-go/hello` 命令后,工作空间目前已近乎标准目录.

![go-base-workspace-go-get-tree.png](../images/go-base-workspace-go-get-tree.png)

可以看出,`go get` 命令下载了 `hello` 命令所依赖的文件并生成 `bin/hello.exe` 可执行文件,现在终于可以说一声 `Hello world!`

```bash
snowdreams1006-win7@WIN-FANS2DDDB06 MINGW64 ~/go
$ hello
!oG,olleH
```

这个是啥?怎么不是传说中的 `Hello World` ?

![go-base-workspace-go-get-angry.png](../images/go-base-workspace-go-get-angry.png)

> 聪明的你,或许已经发现输出的语句的确不是 `Hello World` 而是 `Hello Go` 反过来写!

## 打造自己的 `Go` 命令

## `Go` 

新建 `GOROOT` `GOPATH` 环境变量,其中`GOPATH`设置`GO` 语言源码存放目录,`GOROOT`设置`GO`安装目录.

`GOPATH` 可以设置多个工作目录,比如`go get` 下载扩展工具时会下载到`GOPATH`第一个.

### `go` 语言目录结构介绍

- `src` 源码目录
- `pkg` 非可执行文件,转换成`.a` 文件
- `bin` 可执行文件

## 命令行工具介绍

- `go build` : 用于编译源码文件,代码包,依赖包
- `go run` : 可以编译并运行 `Go` 源码文件
- `go get` : 主要是用来动态获取远程代码包

```
go build test.go
```

```
go run test.go
```

```
# https://github.com/Caplost/imooc
go get github.com/Caplost/imooc
```

## `GoLand` 编辑器选择和配置

- 常见的 `IDE` : `Sublime text2` ,`liteide` ,`Goland` 等

> 国人开发的 `liteide` ,推荐 `Goland`

- `GOLand` 下载安装(https://www.jetbrains.com/go/)
- `GOLand` 简单配置

打开设置,设置`GOROOT` -> `NO SDK` 更改为`go` 安装位置
`GOPATH` 添加项目路径


