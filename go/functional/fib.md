# 裴波那契数列

- https://www.liaoxuefeng.com/wiki/1022910821149312/1023021250770016
- https://www.zhihu.com/question/34210214
- https://www.ibm.com/developerworks/cn/linux/l-cn-closure/
- https://www.runoob.com/js/js-function-closures.html
- https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.6.html
- http://jartto.wang/2017/12/18/reflective-closure/
- https://lotabout.me/2016/thoughts-of-closure/

`Go`

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

```go
func TestFibonacci(t *testing.T) {
  f := fibonacci()
  for i := 0; i < 10; i++ {
    fmt.Print(f(), " ")
  }
  fmt.Println()
}
```
