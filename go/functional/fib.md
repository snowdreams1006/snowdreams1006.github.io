# 裴波那契数列

> **裴波那契数列**是形如 `1 1 2 3 5 8 13 21 34 55` 的递增数列,即从第三个数开始,当前数字都是**前两个数字之和**,保持此规律无限递增...

![go-functional-programming-about-fib.png](../images/go-functional-programming-about-fib.png)

开门见山,直接给出斐波那契数列生成器的 `Go` 语言代码,接下来再慢慢深挖背后隐藏的奥秘的,如果还不了解 `Go` 语言的函数用法,可以参考上一篇文章: [go 学习笔记之学习函数式编程前不要忘了函数基础](https://mp.weixin.qq.com/s/dprkCOvPZHr6fi_qC91dVw)

```go
// 1 1 2 3 5 8 13 21 34 55
//     a b
//       a b
func fibonacci() func() int {
  a, b := 0, 1
  return func() int {
    a, b = b, a+b
    return a
  }
}
```

`Go` 语言的单元测试用例,循环调用 `10` 次斐波那契数列生成器,因此生成前十位数列: `1 1 2 3 5 8 13 21 34 55`

```go
func TestFibonacci(t *testing.T) {
  f := fibonacci()
  for i := 0; i < 10; i++ {
    fmt.Print(f(), " ")
  }
  fmt.Println()
}
```

## 背后蕴藏的奥妙

- 变量支持连续赋值,无需中间变量

> `Go` 语言不像主流的编程语言那样,它们大多数仅仅支持多变量的连续声明而不支持同时赋值.

`Go` 语言特有的交换变量方式,`a, b = b, a` 语义简单明确并不像其他语言需要引入临时变量.

```go
func TestExchange(t *testing.T) {
  a, b := 1, 2
  t.Log(a,b)

  // 2,1
  a, b = b, a
  t.Log(a,b)
}
```

其他主流的编程语言的惯用做法,不仅需要引入临时变量还增加了额外的代码量.

```go
func TestExchange(t *testing.T) {
  a, b := 1, 2
  t.Log(a,b)

  // 2,1
  temp := a
  a = b
  b = temp
  t.Log(a,b)
}
```

> 「雪之梦技术驿站」注: `Go` 语言的多变量同时赋值特性体现的更多是一种声明式编程思想,不关注具体实现,只需要表达出实际需求.

```go
func fibonacci() func() int {
  a, b := 0, 1
  return func() int {
    a, b = b, a+b
    return a
  }
}
```


## 参考

- https://www.liaoxuefeng.com/wiki/1022910821149312/1023021250770016
- https://www.zhihu.com/question/34210214
- https://www.ibm.com/developerworks/cn/linux/l-cn-closure/
- https://www.runoob.com/js/js-function-closures.html
- https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.6.html
- http://jartto.wang/2017/12/18/reflective-closure/
- https://lotabout.me/2016/thoughts-of-closure/

