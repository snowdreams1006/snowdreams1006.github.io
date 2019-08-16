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




