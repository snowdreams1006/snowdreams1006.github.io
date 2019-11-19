# 延迟函数

## 温故知新不忘延迟基础

![go-error-defer-learn-from-old.jpg](../images/go-error-defer-learn-from-old.jpg)

```
A "defer" statement invokes a function whose execution is deferred to the moment the surrounding function returns, either because the surrounding function executed a return statement, reached the end of its function body, or because the corresponding goroutine is panicking.
```

延迟函数的**运行时机**一般有三种情况:

- 周围函数遇到返回时

```go
func funcWithMultipleDeferAndReturn() {
    defer fmt.Println(1)
    defer fmt.Println(2)
    fmt.Println(3)
    return
    fmt.Println(4)
}
```

> 运行结果: `3 2 1` .
> 
> 「雪之梦技术驿站」: `defer fmt.Println(1)` 和 `defer fmt.Println(2)` 两个语句由于前面存在 `defer` 关键字,因此均**被延迟**到正常语句 `return` 前.当多个 `defer` 语句均被延迟时,倒序执行延迟语句,这种特点非常类似于数据结构的**栈**(先入后出).所以依次输出 `fmt.Println(3)` ,`defer fmt.Println(2)` ,`defer fmt.Println(1)` .

- 周围函数函数体结尾处

```go
func funcWithMultipleDeferAndEnd() {
    defer fmt.Println(1)
    defer fmt.Println(2)
    fmt.Println(3)
}
```

> 运行结果: `3 2 1` .
>
> 「雪之梦技术驿站」: 比 `funcWithMultipleDeferAndReturn` 示例简单一些,虽然包围函数 `funcWithMultipleDeferAndEnd` 并没有显示声明 `return` 语句,但是当函数运行结束前依然不会忘记执行延迟语句.所以 `fmt.Println(3)` 执行完后,程序并没有立即结束而是紧接着执行延迟语句 `defer fmt.Println(2)` 和 `defer fmt.Println(1)`.

- 当前协程惊慌失措中

```go
func funcWithMultipleDeferAndPanic() {
    defer fmt.Println(1)
    defer fmt.Println(2)
    fmt.Println(3)
    panic("panic")
    fmt.Println(4)
}
```

> 运行结果: `3 2 1` .
>
> 「雪之梦技术驿站」: 和 `funcWithMultipleDeferAndReturn` 示例有点类似,只不过由原来的 `return` 语句换成了 `panic("panic")`. 我们知道延迟语句 `defer fmt.Println(1)` 和 `defer fmt.Println(2)` 肯定会被延迟执行,所以并不会先输出 `1,2` 而是先执行了 `fmt.Println(3)` ,下一步就遇到了 `panic("panic")` ,此时顾不上惊慌失措,先让已存在的 `defer` 语句先执行再说!
> 同时,`defer` 是倒序执行的,因而先输出 `defer fmt.Println(2)` 再输出 `defer fmt.Println(1)` ,最后完成使命,光荣挂掉,至于 `fmt.Println(4)` 就无法执行了!

关于这一句话的详细解读,请参考 [go 学习笔记之解读什么是defer延迟函数](https://mp.weixin.qq.com/s/XttOuCEk7kgySKLOCqVMRQ),示例源码见 [snowdreams1006/learn-go/tree/master/error](https://github.com/snowdreams1006/learn-go/tree/master/error)

如果你真的试图去理解 `defer` 的**执行时机**,最好看一下**汇编代码**的具体实现,推荐一下大佬的 [defer关键字](https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.4.html)

关于 `defer` 关键字相关解释,摘录如下: 

> 当函数包含 `defer` 语句,则汇编代码:

> c
> call runtime.deferreturn，
> add xx SP
> return

> `goroutine` 的控制结构中,有一张表记录 `defer` ,调用 `runtime.deferproc` 时会将需要 `defer` 的表达式记录在表中,而在调用 `runtime.deferreturn` 的时候，则会依次从 `defer` 表中出栈并执行。

但是,从语义上理解会更加简单,问一下自己为什么需要 `defer` 关键字,到底解决了什么问题?

![go-error-defer-question.png](../images/go-error-defer-question.png)

一旦理解了 `defer` 关键字的实现意图,那么自然而然就能大概猜出有关执行顺序,所以何必深究实现细节呢?

简而言之,`defer` 关键字是确保程序一定会执行的代码逻辑,不管程序是正常 `return` 还是意外 `panic` ,包围函数一旦存在 `defer` 关键字就要保证延迟函数一定执行!

当存在多个 `defer` 关键字时,意味着有多个紧急任务需要处理,时间紧迫,当然是事故发生点最近的优先执行,离`return` 或 `panic` 越远的越晚执行.

所以**以防万一和就近原则**是理解 `defer` 执行时机的最佳途径: 万一哪天发生火灾,第一反应自然是就近救人啊!

![go-error-defer-fire-and-save.jpg](../images/go-error-defer-fire-and-save.jpg)

## 支持什么又不支持哪些

```
The expression must be a function or method call; it cannot be parenthesized. Calls of built-in functions are restricted as for expression statements.
```

- 支持函数调用

```go
func funcCallWithDefer() {
    fmt.Println("funcInvokeWithDefer function is called")
}

func TestFuncCallWithDefer(t *testing.T) {
    // 「雪之梦技术驿站」: defer 语句可以是函数调用.
    fmt.Println(" 「雪之梦技术驿站」: defer 语句可以是函数调用.")

    defer funcCallWithDefer()

    fmt.Println("TestFuncInvokeWithDefer function call has ended")
}
```

- 支持方法调用

```go
type Lang struct {
    name    string
    website string
}

func (l *Lang) ToString() {
    fmt.Printf("Lang:[name = %s,website = %s] \n", l.name, l.website)
}

func TestMethodCallWithDefer(t *testing.T) {
    // 「雪之梦技术驿站」: defer 语句也可以是方法调用.
    fmt.Println(" 「雪之梦技术驿站」: defer 语句也可以是方法调用.")

    var l = new(Lang)
    l.name = "Go"
    l.website = "https://snowdreams1006.github.io/go/"

    defer l.ToString()

    fmt.Println("TestMethodCallWithDefer method call has ended")
}
```

- 不可以被括号包裹

![go-error-defer-parenthesized-fail.png](../images/go-error-defer-parenthesized-fail.png)

- 内建函数和表达式一样受限

|函数名|说明|说明|
|:-:|:-:|:-:|
|close|关闭channel|仅用于channel通讯|
|delete|从map中删除实例|map操作|
|len|返回字符串，slice和数组的长度|可用于不同的类型|
|cap|返回容量|可用于不同的类型|
|new|内存分配|用于各种类型|
|make|内存分配|仅用于chan/slice/map|
|copy|复制slice|slice操作|
|append|追加slice|slice操作|
|panic|报告运行时问题|异常处理机制|
|recover|处理运行时问题|异常处理机制|
|print|内建打印函数|主要用于不引入fmt的时候的调试，实际使用时建议使用标准库fmt|
|println|内建打印函数|主要用于不引入fmt的时候的调试，实际使用时建议使用标准库fmt|
|complex|构造复数类型|复数操作|
|real|抽出复数的实部|复数操作|
|imag|抽出复数的虚部|复数操作|

```go
func TestBuiltinFuncCallWithDefer(t *testing.T) {
    // 「雪之梦技术驿站」: defer 语句不可以被括号包裹.
    fmt.Println(" 「雪之梦技术驿站」: defer 语句不可以被括号包裹.")

    arr := new([10]int)
    arr[4] = 5
    arr[7] = 8

    // defer discards result of len(arr)
    defer len(arr)
    defer println("Calls of built-in functions are restricted as for expression statements.")

    fmt.Println("TestBuiltinFuncCallWithDefer function call has ended")
}
```

## 咬文嚼字深入理解延迟

```
Each time a "defer" statement executes, the function value and parameters to the call are evaluated as usual and saved anew but the actual function is not invoked. Instead, deferred functions are invoked immediately before the surrounding function returns, in the reverse order they were deferred. That is, if the surrounding function returns through an explicit return statement, deferred functions are executed after any result parameters are set by that return statement but before the function returns to its caller. If a deferred function value evaluates to nil, execution panics when the function is invoked, not when the "defer" statement is executed.
```

### 打蛇打七寸

![go-error-defer-emphasis.jpeg](../images/go-error-defer-emphasis.jpeg)

> Each time a "defer" statement executes, **the function value and parameters to the call are evaluated as usual and saved anew but the actual function is not invoked**.

```go
func trace(funcName string) func(){
    start := time.Now()
    fmt.Printf("function %s enter at %s \n",funcName,start)

    return func(){
        fmt.Printf("function %s exit at %s(elapsed %s)",funcName,time.Now(),time.Since(start))
    }
}

func foo(){
    fmt.Printf("foo begin at %s \n",time.Now())

    defer trace("foo")()
    time.Sleep(5*time.Second)

    fmt.Printf("foo end at %s \n",time.Now())
}

func TestFoo(t *testing.T) {
    foo()
}
```

`trace` 函数实现了**函数计时**功能,而 `foo` 函数则是包围函数用于演示 `defer` 关键字的逻辑,`TestFoo` 是测试函数,输出测试结果.

测试结果如下:

> === RUN   TestFoo
> foo begin at 2019-11-18 23:12:38.519097 +0800 CST m=+0.000735902 
> function foo enter at 2019-11-18 23:12:38.519287 +0800 CST m=+0.000926011 
> foo end at 2019-11-18 23:12:43.524445 +0800 CST m=+5.005934027 
> function foo exit at 2019-11-18 23:12:43.524549 +0800 CST m=+5.006038281(elapsed > 5.005112612s)--- PASS: TestFoo (5.01s)
> PASS
> 
> Process finished with exit code 0

记得官方文档中关于 `defer` 描述的第一句话就介绍了执行时机,原文如下:

```
A "defer" statement invokes a function whose execution is deferred to the moment the surrounding function returns, either because the surrounding function executed a return statement, reached the end of its function body, or because the corresponding goroutine is panicking.
```

但是如果按照这句话来解释此次示例的运行结果,显然是解释不通的!


这一点也是我最大的疑惑,以至于根本无法真正理解 `Each time a "defer" statement executes, the function value and parameters to the call are evaluated as usual and saved anew but the actual function is not invoked.` ,那么原因到底出现在哪里呢?


### 第二句

> Instead, **deferred functions are invoked immediately** before the surrounding function returns, **in the reverse order they were deferred**.

### 第三句

> That is, if the **surrounding function** returns through an **explicit return statement**, **deferred functions** are executed **after any result parameters are set by** that return statement but **before the function returns** to its caller.

### 第四句

> If a **deferred function** value **evaluates to nil**, **execution panics when the function is invoked**, not when the "defer" statement is executed.

## 理论加实践才是硬道理

```
For instance, if the deferred function is a function literal and the surrounding function has named result parameters that are in scope within the literal, the deferred function may access and modify the result parameters before they are returned. If the deferred function has any return values, they are discarded when the function completes. (See also the section on handling panics.)
```

### 第一句

> For instance, if the **deferred function** is a **function litera**l and the **surrounding function** has **named result parameters** that are in scope within the literal, **the deferred function may access and modify the result parameters before they are returned**.

### 第二句

> If the **deferred function** has any **return values**, they are **discarded** when the function completes. (See also the section on handling panics.)

## 公布答案以及总结全文

## 阅读延伸以及参考文档

- [Defer_statements](https://golang.google.cn/ref/spec#Defer_statements)
- [Built-in_functions](https://golang.google.cn/ref/spec#Built-in_functions)
- [Go语言规格说明书 之 内建函数（Built-in functions）](https://www.cnblogs.com/luo630/p/9669966.html)
- [go语言快速入门：内建函数(6)](https://blog.csdn.net/liumiaocn/article/details/54804074)
- [你知道defer的坑吗？](https://www.jianshu.com/p/9a7364762714)
