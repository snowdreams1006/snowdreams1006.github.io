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

