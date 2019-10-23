# 延迟函数

## 上节回顾

```
A "defer" statement invokes a function whose execution is deferred to the moment the surrounding function returns, either because the surrounding function executed a return statement, reached the end of its function body, or because the corresponding goroutine is panicking.
```

## 本节概要

```
The expression must be a function or method call; it cannot be parenthesized. Calls of built-in functions are restricted as for expression statements.
```

### 内建函数(Built-in functions)

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


## 阅读更多

- [Defer_statements](https://golang.google.cn/ref/spec#Defer_statements)
- [Built-in_functions](https://golang.google.cn/ref/spec#Built-in_functions)
- [Go语言规格说明书 之 内建函数（Built-in functions）](https://www.cnblogs.com/luo630/p/9669966.html)
- [go语言快速入门：内建函数(6)](https://blog.csdn.net/liumiaocn/article/details/54804074)

