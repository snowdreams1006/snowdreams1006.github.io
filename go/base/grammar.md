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

现在已经学习了两种基本方式,一种是把程序写在 `main` 方法中,另一种是把程序写在测试方法中.

两种方式都可以随时测试验证我们的学习成果,如果写在 `main` 方法中,知识点一般要包装成单独的方法,然后再在 `main` 方法中运行该方法.

如果写在测试方法中,可以单独运行测试方法,而不必在 `main` 方法中一次性全部运行.

当然,这两种方式都可以,只不过个人倾向于测试用例方式.

### 实现 `Fibonacci` 数列

形如 `1,1,2,3,5,8,13,...` 形式的数列就是斐波那契数列,特点是从三个元素开始,下一个元素的值就是前两两个元素值的总和,子子孙孙无穷尽也!

记得学习初中历史时,关于昭君出塞的故事广为人知,王昭君的美貌不是此次讨论的重点,而此次关注点是放到了昭君的悲惨人生.

汉朝和匈奴和亲以换取边境和平,汉朝皇帝不愿意自己的亲闺女远嫁塞北,于是从后宫中挑选了一名普通宫女充当和亲对象,谁成想这名宫女竟长得如此美貌,"沉鱼落雁闭月羞花",堪称古代中国四大美女之一!

昭君担负着和亲重任,从此开始了远离他乡的悲惨生活,一路上,黄沙飞扬,燥热忧伤,情之所至,昭君拿出随性的琵琶,演奏出感人泪下的<<琵琶怨>>!

"千载琵琶作胡语,分明怨恨曲中论",可能情感过于哀伤,竟然连天上的大雁都忘记了飞翔,因此收获**落雁**之美!

![go-base-grammar-fibonacci-zhaojun.jpg](../images/go-base-grammar-fibonacci-zhaojun.jpg)

老单于这个肥波纳了个如花似玉的妾,做梦都能了醒吧,遗憾的是,命不久矣!

如此一来,昭君却满心欢喜,异族老公死了,使命完成了,应该能回到朝思梦想的大汉朝故土了吧?

命运弄人,匈奴文化,父死子继,肥波已逝,但还有小肥波啊,放到汉朝伦理纲常来看,都不能叫做近亲结婚了简直是乱伦好吗!

`小肥波+昭君=小小肥波` ,只要昭君不死,而昭君的现任老公不幸先死,那么小小肥波又会继续纳妾生娃,理论上真的是子子孙孙无穷尽也!

肥波纳妾故事可能长成这个样子:

- `肥波,昭君,小肥波`

> 昭君的第一任老公: `肥波+昭君=小肥波`,此时昭君刚生一个娃

- `肥波,小肥波,昭君,小小肥波`

> 昭君的第二任老公: `小肥波+昭君=小小肥波`,昭君的娃娶了自己的妈?难怪昭君苦楚悲惨,有苦难言,幸运的是,这次昭君没有生娃,两个女孩!

- `肥波,小肥波,小小肥波,昭君`

> 昭君的第三任老公,`小小肥波+昭君=小小小肥波` ,兄终弟及,还是乱伦好吗,这辈分我是算不出来了.

肥波纳妾系列,理论上和愚公移山有的一拼,生命不息,子承父业也好,兄终弟及也罢,数量越来越多,肚子越来越大.

> 以上故事,纯属虚构,昭君出塞是一件伟大的事情,换来了百年和平,值得尊敬.

回归正题,下面让我们用 `Go` 语言实现斐波那契数列吧!

![go-base-grammar-fibonacci-test.jpg](../images/go-base-grammar-fibonacci-test.jpg)

```go
func TestFib(t *testing.T) {
	var a = 1
	var b = 1

	fmt.Print(a)
	for i := 0; i < 6; i++ {
		fmt.Print(" ", b)

		temp := a
		a = b
		b = temp + b
	}
	fmt.Println()
}
```

上述简单示例,展示了变量的基本使用,简单总结如下:

- 变量声明关键字用 `var` ,类型名在前,变量类型在后,其中变量类型可以省略.

```go
// 声明变量a和变量b
var a = 1
var b = 1
```

上述变量语法咋一看像是 `Js` 赋值,严格来说其实并不是那样,上面变量赋值形式只是下面这种的简化

```go
// 声明变量a并指定类型为 int,同理声明变量b并指定类型为int
var a int = 1
var b int = 1
```

第一种写法省略了 `int` 类型,由赋值 `1` 自动推断为 `int` 在一定程度上简化了书写,当然这种形式还可以继续简化.

```go
// 省略相同的 var,增加一对小括号 (),将变量放到小括号里面 
var (
	a = 1
	b = 1
)
```

可能问,还能不能继续简化下,毕竟其余语言的简化形式可不是那样的,答案是可以的!

```go
// 连续声明变量并赋值
var a, b = 1, 1
```

当然,其余语言也有类似的写法,这并不值得骄傲,下面这种形式才是 `Go` 语言特有的精简版形式.

```go
// 省略了关键字var,赋值符号=改成了:=,表示声明变量并赋值 
a, b := 1, 1
```

就问你服不服?一个小小的变量赋值都能玩出五种花样,厉害了,我的 `Go` !

- 

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


