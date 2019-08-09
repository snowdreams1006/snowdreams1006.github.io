# 基础语法

希望学习 `Go` 语言的爱好者至少拥有其他语言的编程经验,如果是完全零基础的小白用户,可能并不适合,站在其他语言的角度学习新的语言,理解 `Go` 语言,进而写出真正的 `Go` 程序.

现在让我们开始 `Go` 语言的学习之旅吧,本教程涉及到的源码已托管于 `github`,如需获取源码,请直接访问 [https://github.com/snowdreams1006/learn-go](https://github.com/snowdreams1006/learn-go)

![go-base-grammar-go.png](../images/go-base-grammar-go.png)

## 编写第一个 `Hello World` 程序

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

### 知识点归纳

`Go` 应用程序入口的有以下要求:

- 必须是 `main` 包 :`package main`
- 必须是 `main` 方法 : `func main()`
- 文件名任意不一定是 `main.go`,目录名也任意不一定是 `main` 目录.

> 以上规则可以很容易在编辑器中得到验证,任意一条不符合规则,程序都会报错提示,这也是使用编辑器而不是命令行进行学习的原因,能够帮助我们及时发现错误,方便随时验证猜想.

总结来说,`main` 包不一定在 `main` 目录下,`main` 方法可以在任意文件中.

这也意味着程序入口所在的目录不一定叫做 `main` 目录却一定要声明为 `main` 包,虽然不理解为什么这么设计,这一点至少和 `Java` 完全不一样,至少意味着 `Go`文件可以直接迁移目录而不需要语言层面的重构,可能有点方面,同时也有点疑惑?!

![go-base-grammar-main-rule-surprise.png](../images/go-base-grammar-main-rule-surprise.png)

`main` 函数值得注意的不同之处:

- `main` 函数不支持返回值,但可以通过 `os.Exit` 返回退出状态

![go-base-grammar-main-rule-return.png](../images/go-base-grammar-main-rule-return.png)

> `main` 函数,不支持返回值,若此时强行运行 `main` 方法,则会报错: `func main must have no arguments and no return values`

![go-base-grammar-main-rule-exit.png](../images/go-base-grammar-main-rule-exit.png)

> `main` 函数可以借助 `os.Exit(-1)` 返回程序退出时状态码,外界可以根据不同状态码识别相应状态.

- `main` 函数不支持传入参数,但可以通过 `os.Args` 获取参数

![go-base-grammar-main-rule-args.png](../images/go-base-grammar-main-rule-args.png)

> 在 `Terminal` 终端选项卡中运行 `go run hello_world.go snowdreams1006` 命令 `os.Args` 输出命令路径和参数值.

## 在测试用例中边学边练基础语法

> The master has failed more times than the beginner has tried

计算机编程不是理科而是工科,动手亲自实践一遍才能更好地掌握知识技能,幸运的是,`Go` 语言本身内置提供了测试框架,不用加载第三方类库扩展,非常有利于学习练习.

刚刚接触 `Go` 语言,暂时不需要深入讲解如何编写规范的测试程序,毕竟基础语法还没开始正式练习呢!

但是,简单的规则还是要说的,总体来说,只有两条规则:

- 测试文件名以 `_test` 结尾 : `XXX_test.go`

> 命令习惯和不同, `Java` 中的文件名一般是**大驼峰命名法**,相应的测试文件是 `XXXTest`

- 测试方法名以 `Test` 开头 :  `TestXXX` 

> 命名习惯和其他编程语言不同,`Java` 中的测试方法命名是一般是**小驼峰命名法**,相应的测试方法是 `testXXX`

- 测试方法有着固定的参数 : `t *testing.T`

> 其他编程语言中一般没有参数,`Java` 中的测试方法一定没有参数,否则抛出异常 `java.lang.Exception: Method testXXX should have no parameters`

新建 `Go` 文件,类型选择 `Empty File` ,文件名命名为 `hello_world_test` ,编辑器新建一个空白的测试文件.

![go-base-grammar-test-rule-file.png](../images/go-base-grammar-test-rule-file.png)

此时编写测试方法签名,利用编辑器自动提示功能输入 `t.Log` 随便输出些内容,这样就完成了第一个测试文件.

![go-base-grammar-test-rule-log.png](../images/go-base-grammar-test-rule-log.png)

和 `main` 程序一样,测试方法也是可执行的,编辑器窗口的左侧也会出现绿色启动按钮,运行测试用例在编辑器下方的控制台窗口输出 `PASS` 证明测试逻辑正确!

![go-base-grammar-test-rule-pass.png](../images/go-base-grammar-test-rule-pass.png)

测试文件源码示例:

```go
package main

import "testing"

func TestHelloWorld(t *testing.T){
	t.Log("Hello Test")
}
```


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


