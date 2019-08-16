# 基础语法

在上篇文章中,我们动手亲自编写了第一个 `Go` 语言版本的 `Hello World`,并且认识了 `Go` 语言中有意思的变量和不安分的常量.

相信通过上篇文章的斐波那契数列,你已经初步掌握了 `Go` 语言的变量和常量与其他主要的编程语言的异同,为了接下来更好的学习和掌握 `Go` 的基础语法,下面先简单回顾一下变量和常量相关知识.

## 有意思的变量和不安分的常量

- 变量默认初始化有零值

```go
func TestVariableZeroValue(t *testing.T) {
    var a int
    var s string

    // 0
    t.Log(a, s)
    // 0 ""
    t.Logf("%d %q", a, s)
}
```

> `int` 类型的变量初始化默认零值是零 `0`,`string` 类型的变量默认初始化零值是空字符串 ` `,其他类型也有相应的零值.

- 多个变量可以同时赋值

```go
func TestVariableInitialValue(t *testing.T) {
    var a, b int = 1, 2
    var s string = "hello Go"

    // 1 2 hello Go
    t.Log(a, b, s)
}
```

> 其他主要的编程语言大多支持多个变量初始化,但极少数有像 `Go` 语言这样,不仅支持同时初始化,还可以同时赋值.

- 多个变量可以用小括号 `()` 统一定义

```go
func TestVariableShorter(t *testing.T) {
    var (
        a int    = 1
        b int    = 2
        s string = "hello go"
    )

    // 1 2 hello Go
    t.Log(a, b, s)
}
```

> 用小括号 `()` 方式,省略了相同的 `var` 关键字,看起来更加统一

- 变量类型可以被自动推断

```go
func TestVariableTypeDeduction(t *testing.T) {
    var a, b, s = 1, 2, "hello Go"

    // 1 2 hello Go
    t.Log(a, b, s)
}
```

> `Go` 语言可以根据变量值推测出变量类型,所以可以省略变量类型,再一次简化了变量定义,但是变量类型仍然是强类型,并不像 `Js` 那样的弱类型.

- 变量可以用 `:=` 形式更加简化

```go
func TestVariableTypeDeductionShorter(t *testing.T) {
    a, b, s := 1, 2, "hello Go"

    // 1 2 hello Go
    t.Log(a, b, s)

    s = "hello golang"

    // 1 2 hello golang
    t.Log(a, b, s)
}
```

> 省略了关键字 `var`,转而使用 `:=` 符号声明并初始化变量值且利用自动类型推断能力进一步就简化变量定义,再次赋值时不能再使用 `:=` 符号.

- 变量 `var` 声明作用域大于变量 `:=` 声明

```go
var globalTestId = 2
// globalTestName := "type_test" is not supported
var globalTestName = "type_test"

func TestVariableScope(t *testing.T) {
    // 2 type_test
    t.Log(globalTestId, globalTestName)

    globalTestName = "TestVariableScope"

    // 2 TestVariableScope
    t.Log(globalTestId, globalTestName)
}
```

> `var` 声明的变量可以作用于函数外或函数内,而 `:=` 声明的变量只能作用于函数内,`Go` 并没有全局变量的概念,变量的作用范围只是针对包而言.

- 常量的使用方式和变量一致

```go
func TestConstant(t *testing.T) {
    const a, b = 3, 4
    const s = "hello Go"

    // 3 4 hello Go
    t.Log(a, b, s)
}
```

> 常量声明关键字 `const`,常量和变量的使用方式一致,具备类型推断能力,也存在多种简化常量定义的形式.

- 虽然没有枚举类型,但可以用 `iota` 配合常量来实现枚举

```go
func TestConstant2Enum(t *testing.T) {
    const (
        java = iota
        golang
        cpp
        python
        javascript
    )
    // 0 1 2 3 4
    t.Log(java, golang,cpp,python,javascript)
}
```
 
> `iota` 在一组常量定义中首次出现时,其值为 `0`,应用到下一个常量时,其值为开始自增 `1`,再次遇到`iota` 恢复 `0` .效果非常像 `for` 循环中的循环索引 `i`,明明是常量,偏偏玩出了变量的味道,也是我觉得 `iota` 不安分的原因.

- 常量 `iota` 有妙用,还可以进行位运算

```go
func TestConstantIotaBitCalculate(t *testing.T){
    const (
        Readable = 1 << iota
        Writable
        Executable
    )
    // 0001 0010 0100 即 1 2 4
    t.Log(Readable, Writable, Executable)

    // 0111 即 7,表示可读,可写,可执行
    accessCode := 7
    t.Log(accessCode&Readable == Readable, accessCode&Writable == Writable, accessCode&Executable == Executable)
}
```

> 定义二进制位最低位为 `1` 时表示可读的,左移一位表示可写的,左移两位表示可执行的,按照按位与运算逻辑,目标权限位若拥有可读权限,此时和可读常量进行按位与运算之后的结果一定是可读的,由此可见,`iota` 非常适合此类操作.

总体来说,`Go` 语言中的变量很有意思,常量 `iota` 不那么安分,从上述归纳总结中不难看出,`Go` 语言和其他主流的编程语言还是有很大不同的,学习时要侧重于这些特殊之处.

> 如果想要回顾本节知识点,可以关注公众号[雪之梦技术驿站]找到[go 学习笔记之有意思的变量和不安分的常量](https://mp.weixin.qq.com/s/FBlMixqUjZ76CgMPg8fl6w) 这篇文章进行查看.

## 简洁的类型中格外关照了复数

在学习 `Go` 语言中的变量和常量时,虽然没有特意强调变量或常量的类型,但是大多数编程语言的类型基本都是差不多的,毕竟大家所处的现实世界是一样的嘛!

光是猜测是不够的,现在我们要梳理一遍 `Go` 语言的类型有哪些,和其他主流的编程语言相比有什么不同?

`Go` 语言的变量类型大致可以分为以下几种:

- `bool` 

> 布尔类型 `bool`,表示真假 `true|false`

- `(u)int` ,`(u)int8` , `(u)int16`, `(u)int32`,`(u)int64`,`uintptr`

> `int` 类型表示整数,虽然不带位数并不表示没有位数,`32` 位操作系统时长度为 `32` 位,`64` 位操作系统时长度为 `64` 位.最后一个 `uintptr` 是指针类型.

- `byte(uint8)` ,`rune(int32)`,`string`

> `byte` 是字节类型,也是 `uint8` 的别名,而 `rune` 是 `Go` 中的字符类型,也是 `int32` 的别名.

- `float32` ,`float64` ,`complex64` ,`complex128`

> 只有 `float` 类型表示小数,没有 `double` 类型,类型越少对于开发者而言越简单,不是吗? `complex64=float32+float32` 是复数类型,没错!就是高中数学书本上的复数,`3+4i` 那种奇怪的数字!

`Go` 的类型还是比较简单的,整数,小数,复数,字节,字符和布尔类型,相同种类的类型没有继续细分不同的名称而是直接根据类型长度进行命名的,这样是非常直观的,见名知意,根据数据大小直接选用类型,不费脑!

作为一种通用的编程语言,`Go` 内建类型中居然格外关照了复数这种数学概念类型,是一件有意思的事情,是不是意味着 `Go` 在工程化项目上做得更好?就像 `Go` 天生支持并发一样?

既然为数不多的类型中格外关照了复数类型,那我们简单使用下复数类型吧,毕竟其他类型和其他主流的编程语言相差不大.

```go
func TestComplex(t *testing.T) {
    c := 3 + 4i

    // 5
    t.Log(cmplx.Abs(c))
}
```

> 生命苦短,直接利用变量类型推断简化变量声明,求出复数类型 `c` 的模(绝对值)

既然学习了复数,怎么能少得了欧拉公式,毕竟是"世界上最美的公式",刚好用到了复数的相关知识,那我们就简单验证一下吧!

![go-base-grammar-complex-euler.png](../images/go-base-grammar-complex-euler.png)

```go
func TestEuler(t *testing.T) {
    // (0+1.2246467991473515e-16i)
    t.Log(cmplx.Pow(math.E, 1i*math.Pi) + 1)

    // (0+1.2246467991473515e-16i)
    t.Log(cmplx.Exp(1i*math.Pi) + 1)

    // (0.000+0.000i)
    t.Logf("%.3f", cmplx.Exp(1i*math.Pi)+1)
}
```

> 由于复数 `complex` 是使用 `float` 类型表示的,而 `float` 类型无论是什么编程语言都是不准确的,所以欧拉公式的计算结果非常非常接近于零,当只保留小数点后三位时,计算结果便是 `(0.000+0.000i)` ,复数的模也就是 `0`,至此验证了欧拉公式.

## 看过复数还是要研究类型特点

复数很重要,但其他类型也很重要,简单了解过复数的相关知识后,我们仍然要把注意力放到研究这些内建类型的特殊之处上或者说这些类型总体来说相对于其他主流的编程语言有什么异同.

- 只有显示类型转换,不存在隐式类型转换

```go
func TestExplicitTypeConvert(t *testing.T) {
    var a, b int = 3, 4
    var c int
    c = int(math.Sqrt(float64(a*a + b*b)))

    // 3 4 5
    t.Log(a, b, c)
}
```

> 已知勾股定理的两条直角边计算斜边,根据勾股定理得,直角边长度的平方和再开根号即斜边长度,然而 `math.Sqrt` 方法接收的 `float64` 类型,返回的也是 `float64` 类型,可实际值全是 `int` 类型,这种情况下并不会自动进行类型转换,只能进行强制类型转换才能得到我们的期望值,这就是显示类型转换.


