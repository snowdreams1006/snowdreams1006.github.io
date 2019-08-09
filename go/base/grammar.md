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

- 变量类型可以省略,由编译器自动进行类型推断

![go-base-grammar-var-auto-error.jpg](../images/go-base-grammar-var-auto-error.jpg)

> 类似 `Js` 的书写习惯,但本质上仍然是强类型,不会进行不同类型的自动转换,还会说像 `Js` 的变量吗?

- 同一个变量语句可以对不同变量进行同时赋值

仍然以**斐波那契数列**为例,`Go` 官网的示例中使用到的就是变量同时赋值的特性,完整代码如下:

```go
package main

import "fmt"

// fib returns a function that returns
// successive Fibonacci numbers.
func fib() func() int {
	a, b := 0, 1
	return func() int {
		a, b = b, a+b
		return a
	}
}

func main() {
	f := fib()
	// Function calls are evaluated left-to-right.
	fmt.Println(f(), f(), f(), f(), f())
}
```

如果对该特性认识不够清晰,可能觉得这并不是什么大不了的事情嘛!

实际上,俗话说,没有对比就没有伤害,举一个简单的例子: 交换变量

```go
func TestExchange(t *testing.T) {
	a, b := 1, 2
	t.Log(a,b)

	a, b = b, a
	t.Log(a,b)

	temp := a
	a = b
	b = temp
	t.Log(a,b)
}
```

其他语言中如果需要交换两个变量,一般都是引入第三个临时变量的写法,而 `Go` 实现变量交换则非常简单清晰,也符合人的思考而不是计算机的思考.

虽然不清楚底层会不会仍然是采用临时变量交换,但不管怎么说,使用该特性交换变量确实很方便!

> 同时对多个变量进行赋值是 `Go` 特有的语法,其他语言可以同时声明多个变量但不能同时赋值.

- 常量同样很有意思,也有关键字声明 `const`.

有些编程语言对常量和变量没有强制规定,常量可以逻辑上被视为不会修改的变量,一般用全大写字母提示用户是常量,为了防止常量被修改,有的编程语言可能会有额外的关键字进行约束.

幸运的是,`Go` 语言的常量提供了关键字 `const` 约束,并且禁止重复赋值,这一点很好,简单方便.

![go-base-grammar-const-assign-error.jpg](../images/go-base-grammar-const-assign-error.jpg)


```go
func TestConst(t *testing.T) {
	const pi = 3.14
	t.Log(pi)

	// cannot assign to pi
	pi = 2.828
	t.Log(pi)
}
```

除了语言层面的 `const` 常量关键字,`Go` 语言还要一个特殊的关键字 `iota` ,常常和常量一起搭配使用!

当设置一些连续常量值或者有一定规律的常量值时,`iota` 可以帮助我们快速设置.

```go
func TestConstForIota(t *testing.T) {
	const (
		Mon = 1 + iota
		Tue
		Wed
		Thu
		Fri
		Sat
		Sun
	)
	// 1 2 3 4 5 6 7
	t.Log(Mon, Tue, Wed, Thu, Fri, Sat, Sun)
}
```

大多数编程语言中,星期一代表的数字几乎都是 `0`,星期二是 `1`,以此类推,导致和传统认识上偏差,为了校准偏差,更加符合国人习惯,因此将星期一代表的数字 `0` 加一,以此类推,设置初始 `iota` 后就可以剩余星期应用该规律,依次 `1,2,3,4,5,6,7`

如果不使用 `iota` 的话,可能需要手动进行连续赋值,比较繁琐,引入了 `iota` 除了帮助快速设置,还可以进行**比特位**级别的操作.


```go
func TestConstForIota(t *testing.T) {
	const (
		Readable = 1 << iota
		Writing
		Executable
	)
	// 0001 0010 0100 即 1 2 4
	t.Log(Readable, Writing, Executable)
}
```

第一位比特位为 `1` 时,表示文件可读,第二位比特位为 `1` 时,表示可写,第三位比特位为 `1` 时,表示可执行,相应的 `10` 进制数值依次为 `1,2,4` 也就是左移一位,左移两位,左移三位,数学上也可以记成 `2^0,2^1,2^2` .

文件的可读,可写,可执行三种状态代表了文件的权限状态码,从而实现了文件的基本权限操作,常见的权限码有 `755` 和 `644`.

按位与 `&` 运算与编程语言无关,"两位同时为 `1` 时,按位与的结果才为 `1` ,否则结果为 `0` ",因此给定权限码我们可以很方便判断该权限是否拥有可读,可写,可执行等权限.

```go
// 0111 即 7,表示可读,可写,可执行
accessCode := 7
t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)

// 0110 即 6,表示不可读,可写,可执行
accessCode = 6
t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)

// 0100 即 4,表示不可读,不可写,可执行
accessCode = 4
t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)

// 0000 即 0,表示不可读,不可写,不可执行
accessCode = 0
t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)
```

`accessCode&Readable` 表示目标权限码和可读权限码进行按位与运算,而可读权限码的二进制表示值为 `0001` ,因此只要目标权限码的二进制表示值第一位是 `1` ,按位与的结果肯定是 `0001` ,而 `0001` 又刚好是可读权限码,所以 `accessCode&Readable == Readable` 为 `true` 就意味着目标权限码拥有可读权限.

如果目标权限码的二进制位第一个不是 `1` 而是 `0`,则 `0&1=0` ,`(0|1)^0=0`,所以按位与运算结果肯定全是 `0` 即 `0000`,此时 `0000 == 0001` 比较值 `false` ,也就是该权限码不可读.

同理可自主分析,`accessCode&Writing == Writing` 结果 `true` 则意味着可写,否则不可写,`accessCode&Executable == Executable` 结果 `true` 意味着可执行,`false` 意味着不可执行.

熟悉了 `iota` 的数学计算和比特位计算后,我们趁热打铁,用文件大小单位继续练习!

```go
func TestConstForIota(t *testing.T) {
	const (
		B = 1 << (10 * iota)
		Kb
		Mb
		Gb
		Tb
		Pb
	)
	// 1 1024 1048576 1073741824 1099511627776 1125899906842624
	t.Log(B, Kb, Mb, Gb, Tb, Pb)

	// 62.9 KB (64,411 字节)
	size := 64411.0
	t.Log(size, size/Kb)
}
```

字节 `Byte` 与 千字节 `Kilobyte` 之间的进制单位是 `1024` ,也就是 `2^10` ,刚好可以用 `iota` 左移 `10` 位来表示,一次只移动一次,直接乘以 `10` 就好了!

怎么样,`iota` 是不是很神奇?同时是不是和我一样也有点小困惑,`iota` 这货到底是啥? 
 
```go
// iota is a predeclared identifier representing the untyped integer ordinal
// number of the current const specification in a (usually parenthesized)
// const declaration. It is zero-indexed.
const iota = 0 // Untyped int.
```

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


