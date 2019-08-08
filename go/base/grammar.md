# 基础语法

希望学习 `Go` 语言的爱好者至少拥有其他语言的编程经验,如果是完全零基础的小白用户,可能并不适合,站在其他语言的角度学习新的语言,理解 `Go` 语言,进而写出真正的 `Go` 程序.

现在让我们开始 `Go` 语言的学习之旅吧,本教程涉及到的源码已托管于 `github`,如需获取源码,请直接访问 [https://github.com/snowdreams1006/learn-go](https://github.com/snowdreams1006/learn-go)

![go-base-grammar-go.png](../images/go-base-grammar-go.png)

## 第一个 `Go` 程序

学习编程语言的第一件事就是编写出 `Hello World`,现在让我们用 `Go` 语言开发出第一个可运行的命令行程序吧!

> 环境前提准备可以参考 [走进Goland编辑器](https://mp.weixin.qq.com/s/IB7RTDJPFH-Ssjfo_usWvw)

新建 `main` 目录,并新建 `hello_world.go` 文件,其中文件类型选择 `Simple Application` ,编辑器会帮助我们创建 `Go` 程序骨架.

![go-base-grammar-new-go-application.png](../images/go-base-grammar-new-go-application.png)

首先输入 `fmt` 后触发语法提示选择 `fmt.Println` ,然后会自动导入 `fmt` 包.

![go-base-grammar-go-application-prompt.png](../images/go-base-grammar-go-application-prompt.png)

完整内容如下,仅供参考:

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello World")
}
```

点击左侧绿色启动按钮,可以直接运行程序或者利用程序自带的 `Terminal` 终端选项卡运行程序,当然也可以用外部命令行工具运行程序.

![go-base-grammar-go-application-run.png](../images/go-base-grammar-go-application-run.png)

`go run` 命令直接运行,而 `go build` 命令产生可执行文件,两种方式都能如愿以偿输出 `Hello World` .

![go-base-grammar-go-application-build.png](../images/go-base-grammar-go-application-build.png)

## `GO` 基础语法讲解

- 关键字,标识符,注释,基础结构
- package,import,别名,路径,`.` `_` 的使用说明
- `GO` 变量,函数可见性规则

### 关键字,标识符

- `GO` 中保留关键字只有 `25` 个:

```
break default func interface select
case defer go map struct 
chan else goto package switch
const fallthrough if range type 
continue for import return var
```

> 不必强记,根据平时开发经验来看,都是开发时常用的.

- `GO` 中 `36` 个预定的标识符,其包括基础数据类型和系统内嵌函数:

```
append bool byte cap close complex
complex64 complex128 uint16 copy false float32
float64 imag int int8 int16 uint32 
int32 int64 iota len make new
nil panic uint64 print println real 
recover string TRUE unit unit8 uintprt
```

### 注释,基础结构

- 注释形式
  * //单行注释
  * /*多行注释*/
  * 一般是用单行注释较多
- 基础结构

常量建议大写: `const NAME="imooc"`
`main` 函数外定义的变量时全局变量:  `var name = "global variable"`


