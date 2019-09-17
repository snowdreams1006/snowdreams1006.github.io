# 裴波那契数列

## 引言

> **裴波那契数列**是形如 `1 1 2 3 5 8 13 21 34 55` 的递增数列,即从第三个数开始,当前数字都是**前两个数字之和**,保持此规律无限递增...

![go-functional-programming-about-fib.png](../images/go-functional-programming-about-fib.png)

开门见山,直接给出斐波那契数列生成器的 `Go` 语言代码,接下来再慢慢深挖背后蕴藏的奥妙,如果还不了解 `Go` 语言的函数用法,可以参考上一篇文章: [go 学习笔记之学习函数式编程前不要忘了函数基础](https://mp.weixin.qq.com/s/dprkCOvPZHr6fi_qC91dVw)

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


## 参考

- https://www.liaoxuefeng.com/wiki/1022910821149312/1023021250770016
- https://www.zhihu.com/question/34210214
- https://www.ibm.com/developerworks/cn/linux/l-cn-closure/
- https://www.runoob.com/js/js-function-closures.html
- https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.6.html
- http://jartto.wang/2017/12/18/reflective-closure/
- https://lotabout.me/2016/thoughts-of-closure/

