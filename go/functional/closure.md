# 简要理解闭包

**闭包**是主流编程语言中的一种**通用技术**,常常和**函数式编程**进行强强联合,本文主要是介绍 `Go` 语言中什么是闭包以及**怎么理解闭包**.

如果读者对于 `Go` 语言的闭包**还不是特别清楚**的话,可以**参考上一篇文章** [go 学习笔记之仅仅需要一个示例就能讲清楚什么闭包](https://mp.weixin.qq.com/s/ZIIBvCuDgrsdNbQXBeAR9A).

或者也可以**直接无视**,因为接下来会**回顾一下前情概要**,现在你准备好了吗? `Go` !

![go-functional-programming-closure-cheer.png](../images/go-functional-programming-closure-cheer.png)

## 斐波那契数列见闭包

不论是 `Go` 官网还是网上其他讲解闭包的相关教程,总能看到**斐波那契数列**的身影,足以说明该示例的**经典**!

> **斐波那契数列**(`Fibonacci sequence`),又称**黄金分割数列** .因数学家**列昂纳多·斐波那契**(`Leonardoda Fibonacci`)以**兔子繁殖**为例子而引入,故又称为“兔子数列”,指的是这样一个数列: `1、1、2、3、5、8、13、21、34、……`在数学上,**斐波那契数列**以如下被以递推的方法定义: `F(1)=1，F(2)=1, F(n)=F(n-1)+F(n-2)（n>=3，n∈N*）` .在现代物理、准晶体结构、化学等领域，斐波纳契数列都有直接的应用,为此,美国数学会从1963年起出版了以《斐波纳契数列季刊》为名的一份数学杂志,用于专门刊载这方面的研究成果.

![go-functional-programming-about-fib.png](../images/go-functional-programming-about-fib.png)

根据上述[百度百科](https://baike.baidu.com/item/%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97/99145?fr=aladdin)的有关描述,我们知道**斐波那契数列**就是形如 `1 1 2 3 5 8 13 21 34 55` 的递增数列,从**第三项**开始起,**当前项是前两项之和**.

为了计算方便,定义两个变量 `a,b` 表示前两项,初始值分别设置成 `0,1` ,示例:

```go
// 0 1 1 2 3 5 8 13 21 34 55
// a b 
//   a b
a, b := 0, 1
```

初始化后下一轮移动,`a, b = b, a+b` 结果是 ` a , b = 1 , 1`,刚好能够表示**斐波那契数列**的开头.

> 试想一下: 如果 `a,b` 变量的初始值是 `1,1` ,**不更改逻辑的情况下**,最终生成的斐波那契数列是什么样子?

```go
func fibonacciByNormal() {
    a, b := 0, 1

    a, b = b, a+b

    fmt.Print(a, " ")

    fmt.Println()
}
```

但是上述示例只能生成**斐波那契数列**中的第一个数字,假如我们需要**前十个数列**,又该如何?

```go
func fibonacciByNormal() {
    a, b := 0, 1

    for i := 0; i < 10; i++ {
        a, b = b, a+b

        fmt.Print(a, " ")
    }

    fmt.Println()
}
```

通过**指定循环次数**再稍加修改上述单数列代码,现在就可以生成**前十位**数列:

```go
// 1 1 2 3 5 8 13 21 34 55
func TestFibonacciByNormal(t *testing.T) {
    fibonacciByNormal()
}
```

这种做法是接触闭包概念前我们一直在采用的解决方案,相信稍微有一定编程经验的开发者都能实现,但是**闭包**却提供了另一种思路!

```go
// 1 1 2 3 5 8 13 21 34 55
func fibonacci() func() int {
    a, b := 0, 1
    return func() int {
        a, b = b, a+b
        return a
    }
}
```

不论是普通函数还是闭包函数,实现斐波那契数列生成器函数的逻辑不变,只是实现不同,闭包返回的是内部函数,**留给使用者继续调用**而普通函数是**直接生成**斐波那契数列.

```go
// 1 1 2 3 5 8 13 21 34 55 
func TestFibonacci(t *testing.T) {
    f := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Print(f(), " ")
    }
    fmt.Println()
}
```

对于这种函数内部嵌套另一个函数并且内部函数引用了外部变量的这种实现方式,称之为"闭包"!

> 闭包是**函数+引用环境**组成的有机整体,两者缺一不可,详细请参考[go 学习笔记之仅仅需要一个示例就能讲清楚什么闭包](https://mp.weixin.qq.com/s/ZIIBvCuDgrsdNbQXBeAR9A).

## 自带独立的运行环境

**闭包**自带**独立的运行环境**,每一次运行闭包的环境都是相互独立的,正如面向对象中**类和对象**实例化的关系那样,闭包是类,闭包的引用是实例化对象.

```go
func autoIncrease() func() int {
    i := 0
    return func() int {
        i = i + 1
        return i
    }
}
```

上述示例是闭包实现的计算器自增,每一次引用 `autoIncrease` 函数获得的闭包环境都是彼此独立的,直接上单元测试用例.

```go
func TestAutoIncrease(t *testing.T) {
    a := autoIncrease()

    // 1 2 3
    t.Log(a(), a(), a())

    b := autoIncrease()

    // 1 2 3
    t.Log(b(), b(), b())
}
```

函数引用 `a` 和 `b` 的环境是独立的,相当于另一个一模一样计数器重新开始计数,并不会影响原来的计数器的运行结果.

> 闭包不仅仅是**函数**,更加重要的是**环境**.从运行效果上看,每一次引用闭包函数**重新初始化运行环境**这种机制,非常类似于面向对象中**类和实例化对象**的关系!

## 长生不老是福还是祸

```go
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

## 七嘴八舌畅谈优缺点

- 模拟**类和对象**的关系,也可以实现**封装**,具备一定**面向对象**能力
- **缓存**复杂逻辑,常驻内存,避免滥用**全局变量**徒增维护成本.
- **实现闭包成本较高**,同时也增加了**理解难度**.
- 滥用容易占用过多内存,可能造成**内存泄漏**.

## 简单**总结**下闭包知识

闭包

## 参考资料及延伸阅读

- [ 闭包的概念、形式与应用](https://www.ibm.com/developerworks/cn/linux/l-cn-closure/)
- [Jartto 博客:反思闭包](http://jartto.wang/2017/12/18/reflective-closure/)
- [三点水博客: 再谈闭包](https://lotabout.me/2016/thoughts-of-closure/)
- [gitbook博客: 闭包的实现](https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.6.html)

