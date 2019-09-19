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

## 背后有故事

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

- 函数的返回值也可以是函数

> `Go` 语言中的函数是一等公民,不仅函数的返回值可以是函数,参数,变量等等都可以是函数.

函数的返回值可以是函数,这样的实际意义在于使用者可以拥有更大的灵活性,有时可以用作延迟计算,有时也可以用作函数增强.

根据该特性实现非常简单的 `i++` 自增函数 `autoIncrease` 效果,因为初值是 `0`,所以每调用一次该函数, `i` 的值就会自增.

```go
func autoIncrease() func() int {
  i := 0
  return func() int {
    i++
    return i
  }
}
```

再小的代码片段也不应该忘记测试,单元测试继续走起,顺便看一下使用方法.

```go
func TestAutoIncrease(t *testing.T) {
  a := autoIncrease()

  // 1 2 3
  t.Log(a(),a(),a())
}
```

初始调用 `autoIncrease` 函数并没有直接得到结果而是返回了函数引用,等到使用者自己觉得时机成熟后再次调用返回的函数引用即变量`a` ,然后才会真正计算结果,这种方式被称为延迟计算也叫做惰性求值.

函数的返回值是函数这一特性除了可以用作惰性求值外,还可以包装原函数以实现功能增强.

当然这少不了引入原函数,成本很低,因为函数的参数和返回值一样都可以是函数.

`timeSpend` 函数实现的功能是包装特定类型的函数,增加计算函数运行时间的新功能并包装成函数返回出去给使用者.

```go
func timeSpend(fn func()) func() {
  return func()  {
    start := time.Now()

    fn()

    fmt.Println("time spend : ", time.Since(start).Seconds())
  }
}
```

为了演示包装函数,定义一个比较耗时函数用于被计算耗时函数所包装,函数名称为 `slowFunc` ,大于运行`1s` .

```go
func slowFunc() {
  time.Sleep(time.Second * 1)

  fmt.Println("I am slowFunc")
}
```

无测试不编码,继续运行单元测试用例,演示耗时函数 `timeSpend` 如何包装慢函数 `slowFunc` 增强功能.

```go
func TestSlowFuncTimeSpend(t *testing.T) {
  slowFuncTimeSpend := timeSpend(slowFunc)

  slowFuncTimeSpend()
}
```

- 函数嵌套可能是一种闭包

不论是引言部分的斐波那契数列生成器函数还是演示函数返回值的自增示例,其实有一种专业术语称为"闭包".

一般表现行为为普通函数内部定义了若干变量和内部函数,内部函数的内部引用了这些变量并且被使用者一直调用,不会轻易释放变量的引用,这就是闭包的外在表现形式.

## 什么是闭包

## 怎么理解闭包



## 为什么要闭包

## 闭包的优缺点

## 回顾斐波那契数列

## 真的掌握闭包了吗

```go
func count() []int {
  var arr []int
  for i := 1; i <= 3; i++ {
    arr = append(arr, i)
  }
  return arr
}

func TestCount(t *testing.T) {
  // 1 2 3
  for _, c := range count() {
    t.Log(c)
  }
}

func countByClosureButWrong() []func() int {
  var arr []func() int
  for i := 1; i <= 3; i++ {
    arr = append(arr, func() int {
      return i
    })
  }
  return arr
}

func TestCountByClosure(t *testing.T) {
  // 4 4 4 
  for _, c := range countByClosureButWrong() {
    t.Log(c())
  }
}

func countByClosureWithOk() []func() int {
  var arr []func() int
  for i := 1; i <= 3; i++ {
    func(n int) {
      arr = append(arr, func() int {
        return n
      })
    }(i)
  }
  return arr
}

func TestCountByClosureWithOk(t *testing.T) {
  // 1 2 3
  for _, c := range countByClosureWithOk() {
    t.Log(c())
  }
}
```
> [节选自廖雪峰 `js` 的闭包教程](https://www.liaoxuefeng.com/wiki/1022910821149312/1023021250770016)

## `Go` 闭包归纳总结

## 相关资料引用参考

- [廖雪峰: `js` 的闭包教程](https://www.liaoxuefeng.com/wiki/1022910821149312/1023021250770016)
- [知乎: 什么是闭包](https://www.zhihu.com/question/34210214)
- https://www.ibm.com/developerworks/cn/linux/l-cn-closure/
- https://www.runoob.com/js/js-function-closures.html
- https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.6.html
- http://jartto.wang/2017/12/18/reflective-closure/
- https://lotabout.me/2016/thoughts-of-closure/

