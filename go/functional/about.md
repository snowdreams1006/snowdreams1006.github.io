# 函数式编程

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

函数式编程 vs 函数指针

- 函数是一等公民: 参数,变量,返回值都可以是函数
- 高阶函数

"正统"的函数式编程

- 不可变性: 不能有状态,只有常量和函数
- 函数只能有一个参数

go 语言闭包的应用

- 更加自然,不需要修饰如何访问自由变量
- 没有 lambda 表达式,但是有匿名函数
- 斐波那契数列
- 为函数实现接口
- 使用函数来遍历二叉树

- https://studygolang.com/articles/617
- http://www.ruanyifeng.com/blog/2017/02/fp-tutorial.html
- https://github.com/SilenceHVK/blog/issues/53
- https://www.jianshu.com/p/390147c78967
- https://www.infoq.cn/article/b6gkx1crp2umU2*jIPQB
- https://www.cnblogs.com/DSharp/p/3789545.html
- https://www.cnblogs.com/DSharp/archive/2005/01/28/98632.html


- 递归风格

```go
func Fibonacci(n uint) uint {
  if n <= 1 {
    return n
  }
  return Fibonacci(n-1) + Fibonacci(n-2)
}
```

- 顺序风格

```go
func Fibonacci(n uint) uint {
  if n <= 1 {
    return n
  }

  var n2, n1 uint = 0, 1

  for i := uint(2); i < n; i++ {
    n2, n1 = n1, n1+n2
  }

  return n2 + n1
}
```

Typescript

```typescript
const fib = (x: number): number => x <= 0 ? 0 : x === 1 ? x : fib(x - 1) + fib(x - 2)
``` 

JavaScript

```js
const fib = (x) => (function sub_fib(a, b) { return x-- > 0 ? sub_fib(b, a+b) : a})(0,1)
```

```js
const fib = (x, a = 0, b = 1) => x > 0 ? fib(x - 1, b, a + b) : a
```

```js
const fib = x => x <= 0 ? 0 : x === 1 ? 1 : fib(x - 1) + fib(x - 2)
```

Lisp

```lisp
(defun fib (n &optional (a 0) (b 1))
  (if (= n 0)
      a
      (fib (- n 1) b (+ a b))))
```

```lisp
(defun fib (n)
  (if (or (= n 0) (= n 1))
      n
      (+ (fib (- n 1)) (fib (- n 2)))))
```

```lisp
(fib 10)
```

Python

- Printing a list of the first 10 Fibonacci numbers, iterative

```python
def fibonacci(n, first=0, second=1):
    for _ in range(n):
        print(first) # side-effect
        first, second = second, first + second # assignment
fibonacci(10)
```

- Printing a list of the first 10 Fibonacci numbers, functional expression style

```python
fibonacci = (lambda n, first=0, second=1:
    "" if n == 0 else
    str(first) + "\n" + fibonacci(n - 1, second, first + second))
print(fibonacci(10), end="")
```

- Printing a list of the first 10 Fibonacci numbers, with generators

```python
def fibonacci(n, first=0, second=1):
    for _ in range(n):
        yield first
        first, second = second, first + second # assignment
print(list(fibonacci(10)))
```

- Printing a list of the first 10 Fibonacci numbers, functional expression style

```python
fibonacci = (lambda n, first=0, second=1:
    [] if n == 0 else
    [first] + fibonacci(n - 1, second, first + second))
print(fibonacci(10))
```

- Printing a list of the first 10 Fibonacci numbers, recursive style

```python
def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n-2) + fibonacci(n-1)

for n in range(10):
    print(fibonacci(n))
```
