# 函数式编程

- 函数式编程语言和函数式编程风格

`Go` 不是函数式编程语言但支持函数式编程风格,正如 `Go` 不是面相对象编程语言依然支持面向对象编程风格那样,`Go` 并不是完完全全按照函数式编程语言标准进行设计的,而是剔除了一些比较专业的严格的要求.

摘自维基百科中关于函数式编程中有这么一段话:

> In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the evaluation of mathematical functions and avoids changing-state and mutable data. 

其实上述的英文的大致意思是说:函数式编程将计算机程序看成是数学函数的推演,不用状态变量也不用可变对象来表达数与数之间的关系.

当然上述是官方的标准说法,并不是个人理解的简单表达,这里不再抄录维基百科定义,有兴趣的可以自行查阅有关资料.

> 函数式编程 [Functional programming](https://en.wikipedia.org/wiki/Functional_programming)

据我目前所知,形形色色的编程风格有好多种,其实不管是函数式编程还是声明式编程,命令式编程,面向对象编程,面向过程编程,面向接口编程还是测试驱动开发等等一系列编程范式,其本质区别在于研究问题的基本着眼点不同,正所谓"一花一世界,一叶一乾坤."

明明都是同一个世界,可是大家解决问题的方法肯定会有所不同,本质越高端的解决方案就越抽象的基本特征,函数式编程也是如此.

函数式编程的基本立足点是函数,而函数式什么?相信稍微熟悉数学概念的人都知道,函数是一个数到另一个数的演变关系,这种变化关系就是函数.

所以,函数本就是数学概念,即使移植到编程开发领域也同样用于计算,这种计算是无状态的也是确定的,同样的输入,只要有确定的变换关系,那么输出结果也应该是确定的.

但是,个人并不认同函数表达的这种确定性,或者说这种确定性应该是有特定领域的.

当超过作用范围时就不再适用,牛顿力学绝对是经典力学中最伟大成就,刚好适合我们所处的宏观宇宙中,但是放到微观世界便不再适用了,量子力学表达的更多的是不确定性.

所以,你还能说确定的输入经过确定的函数运算后肯定会得到确定的输出结果吗?量子力学首先表示不服,小心薛定谔的猫上来挠你两下!

个人猜测函数式编程可能正处于经典力学的作用范围,所以函数式编程也才会发展成一种流行的编程风格,如果有哪种编程语言不支持这种编程风格的话,好像都不好意思说自己是通用编程语言了呢!

越来越多的主流语言在设计的时候无一例外都会更多的参考函数式特性() `lambda` 表达式,原生支持 `map` `，reduce` ……）,就连面向对象语言的 `Java8` 也开始支持函数式编程.

函数式编程的基本点自然就是函数,而函数各个语言都会支持,谁让函数一般都被视为逻辑处理的最小单元呢!

`Go` 语言也是支持函数的,并且函数也是 `Go` 语言中的一等公民,`Go` 中的函数可以作为函数的参数,返回值,基本类型等场合.

由此可见,`Go` 支持函数式编程风格有着良好基础,至于 `Go` 本身是否特意为函数式编程风格标准设计的那就不好猜测了.


函数式编程特点

- 函数是一等公民
- 复杂函数可分解拆分可复用的基本函数,典型函数有 `map` 和 `reduce` 函数组成的 `MapReduce` 算法.
- 不适用状态变量和可变对象实现纯函数



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

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017328525009056
- https://studygolang.com/articles/617
- http://www.ruanyifeng.com/blog/2017/02/fp-tutorial.html
- https://github.com/SilenceHVK/blog/issues/53
- https://www.jianshu.com/p/390147c78967
- https://www.infoq.cn/article/b6gkx1crp2umU2*jIPQB
- https://www.cnblogs.com/DSharp/p/3789545.html
- https://www.cnblogs.com/DSharp/archive/2005/01/28/98632.html
- https://mp.weixin.qq.com/s/cb1SHuXLgwjpl7qdXM-yfA

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

PHP

- Printing first 10 Fibonacci numbers, using function

```php
function fib(int $n) : int {
    return ($n === 0 || $n === 1) ? $n : fib($n - 1) + fib($n - 2);
}

for ($i = 0; $i <= 10; $i++) echo fib($i) . PHP_EOL;
```

- Printing first 10 Fibonacci numbers, using closure

```php
$fib = function(int $n) use(&$fib) : int {
    return ($n === 0 || $n === 1) ? $n : $fib($n - 1) + $fib($n - 2);
};

for ($i = 0; $i <= 10; $i++) echo $fib($i) . PHP_EOL;
```

- Printing a list with first 10 Fibonacci numbers, with generators

```php
function fib(int $n) {
    yield 0; $n--;
    yield 1; $n--;
    $second = ($first = 2) + 1;
    while ($n-- !== 0) {
        yield $first;
        [$second, $first] = [$first + $second, $second];
    }
}

$fibo = fib(10);
foreach ($fibo as $value) {
    echo $value . PHP_EOL;
}
```

Java

Get Fibonacci number

```java
public UnaryOperator<Integer> fib(Integer acc, Integer incr) {
    return x -> {
        return (x > 0) ? fib(acc + incr, acc).apply(--x) : acc;
    };
}
System.out.println(fib(0, 1).apply(5));
```
