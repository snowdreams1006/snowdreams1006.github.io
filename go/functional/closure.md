# 简要理解闭包

> 相关示例代码已托管 `Github`: [https://github.com/snowdreams1006/learn-go/blob/master/functional/functional/funcitional_test.go](https://github.com/snowdreams1006/learn-go/blob/master/functional/functional/funcitional_test.go)

## 斐波那契数列见闭包

> [go 学习笔记之仅仅需要一个示例就能讲清楚什么闭包](https://mp.weixin.qq.com/s/ZIIBvCuDgrsdNbQXBeAR9A)

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

// 1 1 2 3 5 8 13 21 34 55 
func TestFibonacci(t *testing.T) {
    f := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Print(f(), " ")
    }
    fmt.Println()
}
```

## 自带独的运行环境

```go
func autoIncrease() func() int {
    i := 0
    return func() int {
        i = i + 1
        return i
    }
}

func TestAutoIncrease(t *testing.T) {
    a := autoIncrease()

    // 1 2 3
    t.Log(a(), a(), a())

    b := autoIncrease()

    // 1 2 3
    t.Log(b(), b(), b())
}
```

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



## 参考资料及延伸阅读

- [ 闭包的概念、形式与应用](https://www.ibm.com/developerworks/cn/linux/l-cn-closure/)
- [Jartto 博客:反思闭包](http://jartto.wang/2017/12/18/reflective-closure/)
- [三点水博客: 再谈闭包](https://lotabout.me/2016/thoughts-of-closure/)
- [gitbook博客: 闭包的实现](https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.6.html)

