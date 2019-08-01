# 环境搭建

千里之行始于足下,开始 `Go` 语言学习之旅前,首先要搭建好本地开发环境,然后就可以放心大胆瞎折腾了.

`Go` 的环境安装和其他语言安装没什么特别注意之处,下载安装包下一步下一步直到完成,可能唯一需要注意的就是 `$GOPATH` 环境变量的设置问题.

不过,简单起见,目前采用默认配置,等到比较熟悉 `Go` 语言时候再自定义设置也不迟,因此采用喜闻乐见的傻瓜式安装方式吧!

![go-base-setup-index.png](../images/go-base-setup-index.png)

## `Go` 下载安装

由于众所周知的原因,谷歌被墙,因此 `Go` 的国外官网无法访问,好在已提供 `Go` 的中国官网可以正常访问.

![go-base-setup-website.png](../images/go-base-setup-website.png)

- 国外官网: [https://golang.org/](https://golang.org/)
- 国内官网: [https://golang.google.cn/](https://golang.google.cn/)
- Go 语言中文网: [https://studygolang.com/](https://studygolang.com/)

> 除了官网下载,也可以从第三方网站下载,一般速度比较快,下面就以 `Windows` 系统为例演示下载安装过程.

![go-base-setup-download.png](../images/go-base-setup-download.png)

双击下载文件 `go1.12.7.windows-amd64.msi` 按照提示一直下一步直到安装完毕.

![go-base-setup-install.gif](../images/go-base-setup-install.gif)

默认情况下 `Go` 安装到 `C:\Go` 目录,同时设置了 `$GOPATH` 环境变量.

![go-base-setup-install-dir.png](../images/go-base-setup-install-dir.png)

> 如果安装时没有采用默认配置而是自定义安装位置,那么应该自行设置后续相关环境变量.

![go-base-setup-variable-added.png](../images/go-base-setup-variable-added.png)

![go-base-setup-path-modified.png](../images/go-base-setup-path-modified.png)

> 默认情况下,安装 `Go` 语言后新增了 `GOPATH` 和 `PATH` 用户系统变量,同时修改了系统环境变量`PATH` .

默认情况下,`Go` 安装成功后发生了如下改变:

- 增加了用户变量: `GOPATH=%USERPROFILE%\go` 
- 增加了用户变量: `PATH=%USERPROFILE%\go\bin`
- 修改了系统变量: `PATH=%PATH%;C:\Go\bin`

其中 `%USERPROFILE%` 代表的是当前计算机登录用户的家目录,比如我的登录名是 `snowdreams1006-win7`,那么 `%USERPROFILE%` 表示的是 `C` 盘下的 `Users` 目录下的 `snowdreams1006-win7` 目录,即 `%USERPROFILE%=C:\Users\snowdreams1006-win7`

![go-base-setup-explain-userprofile.png](../images/go-base-setup-explain-userprofile.png)


## 环境搭建和 `IDE` 的安装使用

- `windows` 开发环境搭建与设置
  * `go` 下载安装
  * `goroot` ,`gopath` 设置和注意点
  * `go` 语言目录结构介绍
- 命令行工具介绍
- `GoLand` 编辑器选择和配置

## `windows` 开发环境搭建与设置

### 环境变量设置

右击计算机,属性,高级系统设置,高级,环境变量,Path,添加 go\bin .

```bash
$ go version
go version go1.12.4 darwin/amd64
```

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


