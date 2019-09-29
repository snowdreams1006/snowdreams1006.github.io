# 简要理解闭包

> [go 学习笔记之仅仅需要一个示例就能讲清楚什么闭包](https://mp.weixin.qq.com/s/ZIIBvCuDgrsdNbQXBeAR9A)

> 相关示例代码已托管 `Github`: [https://github.com/snowdreams1006/learn-go/blob/master/functional/functional/funcitional_test.go](https://github.com/snowdreams1006/learn-go/blob/master/functional/functional/funcitional_test.go)

## 斐波那契数列**见闭包**

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

## **不老不死**是福还是祸

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

