# 异常管理

## 资源管理与出错处理

## defer 调用

- 确保调用在函数结束时发生
- 参与在defer语言时计算
- defer列表为后进先出

## 何时使用 defer 调用

- Open/Close
- Lock/Unlock
- PrintHeader/PrintFooter

## 错误处理二

- 如何实现统一的错误处理逻辑

## panic

- 停止当前函数执行
- 一直向上返回,执行每一层的 defer
- 如果没有遇见recover,程序退出

## recover

- 仅在 defer 调用中使用
- 获取 panic 的值
- 如果无法处理,可重新 panic

error vs panic

- 意料之中的:使用 error,如: 文件打不开
- 意料之外的:使用 panic,如: 数组越界

## Go 的错误机制

与其他主要的编程语言的差异:

- 没有异常机制
- error 类型实现了 error 接口
- 可以通过 errors.New 来快速创建错误实例

```go
type error interface{
    Error() string
}

errors.New("n must be in the range []")
```

panic

- panic 用于不可恢复的错误
- panic 退出前会执行defer指定的内容

panic vs os.Exit

- os.Exit 退出时不会调用 defer指定的函数
- os.Exit 退出时不输出当前调用栈信息

当心,recover 称为恶魔

- 形成僵尸服务进程,导致 health check 失效
- "Let it Crash" 往往是我们恢复不确定性错误的最好方式

https://golang.google.cn/ref/spec#Defer_statements

A "defer" statement invokes a function whose execution is deferred to the moment the surrounding function returns, either because the surrounding function executed a return statement, reached the end of its function body, or because the corresponding goroutine is 
panicking.

```
defer Stmt = "defer" Expression .
```

```go
func TestFuncWithoutDefer(t *testing.T) {
	// 「雪之梦技术驿站」: 正常顺序
	t.Log("「雪之梦技术驿站」: 正常顺序")

	// 1 2
	t.Log(1)
	t.Log(2)
}

func TestFuncWithDefer(t *testing.T) {
	// 「雪之梦技术驿站」: 正常顺序执行完毕后才执行 defer 代码
	t.Log(" 「雪之梦技术驿站」: 正常顺序执行完毕后才执行 defer 代码")

	// 2 1
	defer t.Log(1)
	t.Log(2)
}

func TestFuncWithMultipleDefer(t *testing.T) {
	// 「雪之梦技术驿站」: 猜测 defer 底层实现数据结构可能是栈,先进后出.
	t.Log(" 「雪之梦技术驿站」: 猜测 defer 底层实现数据结构可能是栈,先进后出.")

	// 3 2 1
	defer t.Log(1)
	defer t.Log(2)
	t.Log(3)
}

func TestFuncWithMultipleDeferOrder(t *testing.T) {
	// 「雪之梦技术驿站」: defer 底层实现数据结构类似于栈结构,依次倒叙执行多个 defer 语句
	t.Log(" 「雪之梦技术驿站」: defer 底层实现数据结构类似于栈结构,依次倒叙执行多个 defer 语句")

	// 2 3 1
	defer t.Log(1)
	t.Log(2)
	defer t.Log(3)
}

func TestFuncWithMultipleDeferAndReturn(t *testing.T) {
	// 「雪之梦技术驿站」: defer 延迟函数会在包围函数正常return之前逆序执行.
	t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数正常return之前逆序执行.")

	// 3 2 1
	defer t.Log(1)
	defer t.Log(2)
	t.Log(3)
	return
	t.Log(4)
}

func TestFuncWithMultipleDeferAndPanic(t *testing.T) {
	// 「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.
	t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.")

	// 3 2 1
	defer t.Log(1)
	defer t.Log(2)
	t.Log(3)
	panic("「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.")
	t.Log(4)
}
```

The expression must be a function or method call; it cannot be parenthesized. Calls of built-in functions are restricted as for expression statements.

Each time a "defer" statement executes, the function value and parameters to the call are evaluated as usual and saved anew but the actual function is not invoked. Instead, deferred functions are invoked immediately before the surrounding function returns, in the reverse order they were deferred. That is, if the surrounding function returns through an explicit return statement, deferred functions are executed after any result parameters are set by that return statement but before the function returns to its caller. If a deferred function value evaluates to nil, execution panics when the function is invoked, not when the "defer" statement is executed.

