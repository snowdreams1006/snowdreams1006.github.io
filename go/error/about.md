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

- 英文原版文档

> A "**defer**" statement invokes a function whose execution **is deferred to** the moment the surrounding function returns,either because the **surrounding function** executed a **return** statement,reached the **end** of its function body,or because the corresponding goroutine is **panicking**.

- 中文翻译文档 

> "**defer**"语句调用一个函数,该函数的执行**被推迟到**周围函数返回的那一刻,这是因为**周围函数**执行了一个**return**语句,到达了函数体的**末尾**,或者是因为相应的协程正在**惊慌**.


### 包围函数正要结束

### 当前协程惊慌失措

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