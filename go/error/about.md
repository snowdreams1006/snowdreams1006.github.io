# 错误管理

## 出入成双有始有终

日常开发编程中,有些操作总是成双成对出现的,有开始就有结束,有打开就要关闭,还有连续依赖关系需要处理.

一般来说,我们需要控制结束语句,在合适的位置和时机结束,保证程序有始有终.

最常见的拷贝文件操作大致流程如下:

1. 打开源文件

```go
srcFile, err := os.Open("fib.txt")
if err != nil {
	t.Error(err)
	return
}	
```

2. 创建目标文件

```go
dstFile, err := os.Create("fib.txt.bak")
if err != nil {
	t.Error(err)
	return
}
```

3. 拷贝源文件到目标文件

```go
io.Copy(dstFile, srcFile)
```

4. 关闭目标文件

```go
dstFile.Close()
	srcFile.Close()
```

5. 关闭源文件

```go
srcFile.Close()
```

值得注意的是: 这种拷贝文件的操作需要特别注意操作顺序而且不能忘记释放资源,比如先打开再关闭等等!

```go
func TestCopyFileWithoutDefer(t *testing.T) {
	srcFile, err := os.Open("fib.txt")
	if err != nil {
		t.Error(err)
		return
	}

	dstFile, err := os.Create("fib.txt.bak")
	if err != nil {
		t.Error(err)
		return
	}

	io.Copy(dstFile, srcFile)

	dstFile.Close()
	srcFile.Close()
}
```

> 上述代码逻辑还是清晰简单的,可能不会忘记释放资源也能保证操作顺序,但是逻辑代码复杂的情况就有一定的难度了!

可能是为了简化类似代码的逻辑,`Go` 语言引入了 `defer` 关键字,创造了"**延迟函数**"的概念.

- 无 `defer` 的文件拷贝

```go
func TestCopyFileWithoutDefer(t *testing.T) {
	if srcFile, err := os.Open("fib.txt"); err != nil {
		t.Error(err)
		return
	} else {
		if dstFile,err := os.Create("fib.txt.bak");err != nil{
			t.Error(err)
			return
		}else{
			io.Copy(dstFile,srcFile)
	
			dstFile.Close()
			srcFile.Close()
		}
	}
}
```

- 有 `defer` 的文件拷贝

```go
func TestCopyFileWithDefer(t *testing.T) {
	if srcFile, err := os.Open("fib.txt"); err != nil {
		t.Error(err)
		return
	} else {
		defer srcFile.Close()

		if dstFile, err := os.Create("fib.txt.bak"); err != nil {
			t.Error(err)
			return
		} else {
			defer dstFile.Close()

			io.Copy(dstFile, srcFile)
		}
	}
}
```

上述示例代码简单展示了 `defer` 关键字的基本使用方式,显著的好处在于 `Open/Close` 是一对操作,不会因为写到最后而忘记 `Close` 操作,而且连续依赖时也能正常保证延迟时机.

简而言之,如果函数内部存在连续依赖关系,也就是说创建顺序是 `A->B->C` 而销毁顺序是 `C->B->A`.这时候使用 `defer` 关键字最合适不过. 

## 懒人福音延迟函数

> 官方文档相关表述见 [Defer statements](https://golang.google.cn/ref/spec#Defer_statements) 

如果没有 `defer` 延迟函数前,普通函数正常运行:

```go
func TestFuncWithoutDefer(t *testing.T) {
	// 「雪之梦技术驿站」: 正常顺序
	t.Log("「雪之梦技术驿站」: 正常顺序")

	// 1 2
	t.Log(1)
	t.Log(2)
}
```

当添加 `defer` 关键字实现延迟后,原来的 `1` 被推迟到 `2` 后面而不是之前的 `1 2` 顺序.

```go
func TestFuncWithDefer(t *testing.T) {
	// 「雪之梦技术驿站」: 正常顺序执行完毕后才执行 defer 代码
	t.Log(" 「雪之梦技术驿站」: 正常顺序执行完毕后才执行 defer 代码")

	// 2 1
	defer t.Log(1)
	t.Log(2)
}
```

如果存在多个 `defer` 关键字,执行顺序可想而知,越往后的越先执行,这样才能保证按照依赖顺序依次释放资源.

```go
func TestFuncWithMultipleDefer(t *testing.T) {
	// 「雪之梦技术驿站」: 猜测 defer 底层实现数据结构可能是栈,先进后出.
	t.Log(" 「雪之梦技术驿站」: 猜测 defer 底层实现数据结构可能是栈,先进后出.")

	// 3 2 1
	defer t.Log(1)
	defer t.Log(2)
	t.Log(3)
}
```

相信你已经明白了多个 `defer` 语句的执行顺序,那就测试一下吧!

```go
func TestFuncWithMultipleDeferOrder(t *testing.T) {
	// 「雪之梦技术驿站」: defer 底层实现数据结构类似于栈结构,依次倒叙执行多个 defer 语句
	t.Log(" 「雪之梦技术驿站」: defer 底层实现数据结构类似于栈结构,依次倒叙执行多个 defer 语句")

	// 2 3 1
	defer t.Log(1)
	t.Log(2)
	defer t.Log(3)
}
```

初步认识了 `defer` 延迟函数的使用情况后,我们再结合文档详细解读一下相关定义.

- 英文原版文档

> A "**defer**" statement invokes a function whose execution **is deferred to** the moment the surrounding function returns,either because the **surrounding function** executed a **return** statement,reached the **end** of its function body,or because the corresponding goroutine is **panicking**.

- 中文翻译文档 

> "**defer**"语句调用一个函数,该函数的执行**被推迟到**周围函数返回的那一刻,这是因为**周围函数**执行了一个**return**语句,到达了函数体的**末尾**,或者是因为相应的协程正在**惊慌**.

具体来说,延迟函数的执行时机大概分为三种情况:

### 周围函数执行return

> because the **surrounding function** executed a **return** statement

`return` 后面的 `t.Log(4)` 语句自然是不会运行的,程序最终输出结果为 `3 2 1` 说明了 `defer` 语句会在周围函数执行 `return` 前依次逆序执行.

```go
func funcWithMultipleDeferAndReturn() {
	defer fmt.Println(1)
	defer fmt.Println(2)
	fmt.Println(3)
	return
	fmt.Println(4)
}

func TestFuncWithMultipleDeferAndReturn(t *testing.T) {
	// 「雪之梦技术驿站」: defer 延迟函数会在包围函数正常return之前逆序执行.
	t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数正常return之前逆序执行.")

	// 3 2 1
	funcWithMultipleDeferAndReturn()
}
```

### 周围函数到达函数体

> reached the **end** of its function body

周围函数的函数体运行到结尾前逆序执行多个 `defer` 语句,即先输出 `3` 后依次输出 `2 1`.
最终函数的输出结果是 `3 2 1` ,也就说是没有 `return` 声明也能保证结束前执行完 `defer` 延迟函数.

```go
func funcWithMultipleDeferAndEnd() {
	defer fmt.Println(1)
	defer fmt.Println(2)
	fmt.Println(3)
}

func TestFuncWithMultipleDeferAndEnd(t *testing.T) {
	// 「雪之梦技术驿站」: defer 延迟函数会在包围函数到达函数体结尾之前逆序执行.
	t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数到达函数体结尾之前逆序执行.")

	// 3 2 1
	funcWithMultipleDeferAndEnd()
}
```

### 当前协程正惊慌失措

> because the corresponding goroutine is **panicking**

周围函数万一发生 `panic` 时也会先运行前面已经定义好的 `defer` 语句,而 `panic` 后续代码因为没有特殊处理,所以程序崩溃了也就无法运行.

函数的最终输出结果是 `3 2 1 panic` ,如此看来 `defer` 延迟函数还是非常尽忠职守的,虽然心里很慌但还是能保证老弱病残先行撤退!

```go
func funcWithMultipleDeferAndPanic() {
	defer fmt.Println(1)
	defer fmt.Println(2)
	fmt.Println(3)
	panic("panic")
	fmt.Println(4)
}

func TestFuncWithMultipleDeferAndPanic(t *testing.T) {
	// 「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.
	t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.")

	// 3 2 1
	funcWithMultipleDeferAndPanic()
}
```

通过解读 `defer` 延迟函数的定义以及相关示例,相信已经讲清楚什么是 `defer` 延迟函数了吧?

简单地说,延迟函数就是一种未雨绸缪的规划机制,帮助开发者编程程序时及时做好收尾善后工作,提前做好预案以准备随时应对各种情况.



## 延迟函数应用场景

- Open/Close

> file对象打开后的自动关闭

```go
func CopyFile(dstName, srcName string) (written int64, err error) {
    src, err := os.Open(srcName)
    if err != nil {
        return
    }
    defer src.Close()

    dst, err := os.Create(dstName)
    if err != nil {
        return
    }
    defer dst.Close()

    // other codes
    return io.Copy(dst, src)
}
```

在打开输入文件输出文件后,不管后面的代码流程如何影响,这两个文件能够被自动关闭.

- Lock/Unlock

> mutex对象锁住后的自动释放

```go
func foo(...) {
    mu.Lock()
    defer mu.Unlock()

    // code logic
}
```

确保mu锁能够在函数foo退出之后自动释放。

- PrintHeader/PrintFooter

## 延伸阅读参考文档

- [go语言的defer语句](https://www.jianshu.com/p/5b0b36f398a2)

## 总结以及下节预告

### defer 调用

- 确保调用在函数结束时发生
- 参与在defer语言时计算
- defer列表为后进先出

## 何时使用 defer 调用