# 环境搭建

## 环境搭建和 `IDE` 的安装使用

- `windows` 开发环境搭建与设置
  * `go` 下载安装
  * `goroot` ,`gopath` 设置和注意点
  * `go` 语言目录结构介绍
- 命令行工具介绍
- `GoLand` 编辑器选择和配置

## `windows` 开发环境搭建与设置

### `go` 下载安装

> 下载地址: [https://golang.org/dl/](https://golang.org/dl/)

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
