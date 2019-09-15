# 函数式编程

编程世界中从来就没有一家独大的**编程风格**,向来就是百花齐放百家争鸣,除了广为熟悉的**面向对象编程**还有日渐流行的**函数式编程**,至于声明式编程和命令式编程等等其他概念不在此次讨论范围内,因此暂不过多涉及到无关概念,尽可能保证精力集中.

接下来的系列文章中将好好讲一下**函数式编程**以及 `Go` 语言是如何实现函数式编程的,关于**面向对象编程**可参考之前的系列文章:

- [猜猜看go是不是面向对象语言？能不能面向对象编程？](https://mp.weixin.qq.com/s/l-nqzYjcre2g__BrVptR9A)
- [go 学习笔记之详细说一说封装是怎么回事](https://mp.weixin.qq.com/s/fXIKWsPqi6m2IEV--8lBsg)
- [go 学习笔记之是否支持以及如何实现继承](https://mp.weixin.qq.com/s/w9ZfTAMr-mnQ9RK_Va-mEg)
- [go 学习笔记之万万没想到宠物店竟然催生出面向接口编程?](https://mp.weixin.qq.com/s/Y2ZfdFUO2QMgWQY5jP0VaA)
- [go 学习笔记之无心插柳柳成荫的接口和无为而治的空接口](https://mp.weixin.qq.com/s/2ffdrwm13Xv6hb6hGzXE3Q)

> 上述系列文章讲解了 `Go` 语言面向对象相关知识点,如果点击后没有自动跳转,可以关注微信公众号「雪之梦技术驿站」查看历史文章,谢谢你的关注.

## 生物学家和数学家

同一个世界,不同的角度自然会千人千面,各有不同.当然不能说谁对谁错也不能谁好谁坏,场景不同,解决问题也不尽相同.

面向对象编程中努力用抽象模型就模拟现实模型,定义了一个个的类型,相似类型的关系一般用继承概念描述,不同类型对象但有着相同行为的模型又提出了接口的概念.

现实世界是复杂多变的,所以想要尽善尽美去模拟现实就要抽象出一大堆的概念模型,所以面向对象的编程行为更像是生物学家在研究物种,把每个物种都进行分类归纳.

如果现实世界的静止的或者需求是固定的,那么只要给出足够的时间,面向对象编程肯定可以按照现实世界模拟出虚拟模型,这个模型中所有的继承关系,接口实现关系等等都非常符合现实规律.

然而,现实是变化的,需求也是不确定的,十年前的程序无法使用当前需求一样,程序并不会随着需求的变化自动更新.

如果有一种方法论能够以不变应万变的话,那么应该就是不以人的意志为转移的基础科学了,没有太多当事者的主观感情,更多的是客观事实真理.

基础科学的数学自然是这方面的典型代表,不仅具有准确性还有良好的可预测性,其他理工科更是基于数学进一步发展的,可以说,数学是最重要的基础科学.

数学的一种重要特点就是研究数字的一门学科,研究单独的数字用的是代数,演变成编程语言中的概念就是变量,数字与数字之间的换算关系就是函数,也是编程语言中的函数概念,当研究对象不再是一个个数字而是一组数字时,几何代数就开始进化成线性代数,函数也变成了矢量数组等形式...

如果说生物学家在解释世界的话,那么数学家就是在创造世界,面向对象在于模拟现实世界的行为关系而函数式编程强调归纳演绎函数规律.



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

函数是一种数学概念,和诸如微积分,行列式,矩阵等概念一样,只不过刚好被人用在实际编程中并提出了函数式编程概念.

但是不要忘记,函数式编程的最核心部分还是在于计算,想一想数学作为最重要的基础科学,准确性和可预测性最重要的.

如果函数不能保证准确性就无法证明也无法解释现有物理世界;如果函数不能保证可预测性又谈何推到预测未知结果,怎么为其他领域科学提供基础保证.

所以函数的出身就注定了函数式编程的基本命运走向,因此纯粹的函数式编程不能有可变因素,也是各种限制的直接原因.

## 函数

> 关于函数部分可参考之前的文章: [go 学习笔记之值得特别关注的基础语法有哪些](https://mp.weixin.qq.com/s/8Ijk3FGMo9fCSTNGbx8R3Q)

- `func` 定义普通函数

基本四则运算,包括加减乘除,若不支持操作类型则抛出异常,终止程序.

```go
func eval(a, b int, op string) int {
    var result int
    switch op {
    case "+":
        result = a + b
    case "-":
        result = a - b
    case "*":
        result = a * b
    case "/":
        result = a / b
    default:
        panic("unsupported operator: " + op)
    }
    return result
}
```

测试未定义操作运算则抛出异常,`unsupported operator: %` ,说明仅仅支持加减乘除基本运算.

```go
func TestEval(t *testing.T) {
    // 3 -1 2 0 unsupported operator: %
    t.Log(
        eval(1, 2, "+"),
        eval(1, 2, "-"),
        eval(1, 2, "*"),
        eval(1, 2, "/"),
        eval(1, 2, "%"),
    )
}
```

- 多返回值定义标准函数

`Go` 语言和其他主流的编程语言明显不同的是,函数支持多返回值,通常第一个返回值表示真正结果,第二个返回值表示是否错误,这也是 `Go` 关于异常错误设计的独特之处.

```go
func evalWithStandardStyle(a, b int, op string) (int, error) {
    switch op {
    case "+":
        return a + b, nil
    case "-":
        return a - b, nil
    case "*":
        return a * b, nil
    case "/":
        return a / b, nil
    default:
        return 0, fmt.Errorf("unsupported operator: %s", op)
    }
}
```

编写真正 `Go` 程序后再次测试函数,遇到没有定义的操作符时不再抛出异常而是返回默认零值以及给出简短的错误描述信息.

```go
func TestEvalWithStandardStyle(t *testing.T) {
    // Success: 2
    if result, err := evalWithStandardStyle(5, 2, "/"); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }

    // Error: unsupported operator: %
    if result, err := evalWithStandardStyle(5, 2, "%"); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }
}
```

- 其他函数作为参数传入

虽然说不支持的操作符不会报错而是给出了相应的零值和错误描述,但是并不是最佳实践.

函数的定义者必须明确说明 `evalWithStandardStyle` 函数仅仅支持加减乘除基本运算,除此之处,暂不受理!

这种做法要求函数的使用者想要正确调用函数必须阅读函数的定义,也只能实现预支持的运算,对于未被实现的其他运算无法继续使用该方法.

舞台交给你,你就是主角,你想要怎么处理输入怎么输出全部交由使用者,这样就不存在无法满足需求的情况了.

```go
func evalWithApplyStyle(a, b int, op func(int, int) (int, error)) (int, error) {
    return op(a, b)
}
```

> 操作符由原来的字符串 `string` 更改成函数 `func(int, int) (int, error)`,舞台交给你,全靠自由发挥!

`evalWithApplyStyle` 函数内部直接调用函数参数 `op` 并返回该函数的处理结果,当前演示示例中函数的控制权完全转移给你函数入参 `op` 函数,实际情况可按照实际需求决定如何处理 `evalWithApplyStyle` 逻辑.

```go
func divide(a, b int) (int, error) {
    return a / b, nil
}

func mod(a, b int) (int, error) {
    return a % b, nil
}
```

自己动手,丰衣足食,顺手定义除法 `divide` 和取余 `mod` 运算,接下来测试下实现效果.

```go
func TestEvalWithApplyStyle(t *testing.T) {
    // Success: 2
    if result, err := evalWithApplyStyle(5, 2, divide); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }

    // Success: 1
    if result, err := evalWithApplyStyle(5, 2, mod); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }
}
```

测试结果很理想,不仅实现了减加乘除等基本运算,还可以实现之前一直没法实现的取余运算!

这说明了这种函数作为参数的做法充分调动劳动人民积极性,妈妈再也不用担心我无法实现复杂功能了呢!

- 匿名函数也可以作为参数

一般而言,调用函数时都是直接用函数名进行调用,单独的函数具有可复用性,但如果本就是一次性函数的话,其实是没必要定义带函数名形式的函数.

依然是上述例子,这一次对两个数的运算规则不再是数学运算了,这一次我们来比较两个数的最大值,使用匿名函数的形式进行实现.

```go
func TestEvalWithApplyStyle(t *testing.T) {
    // Success: 5
    if result, err := evalWithApplyStyle(5, 2, func(a int, b int) (result int, e error) {
        if a > b {
            return a, nil
        }
        return b, nil
    }); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }
}
```

- 函数的返回值可以是函数

依然是上述示例,如果由于原因不需要立即返回函数的计算结果而是等待使用者自己觉得时机合适的时候再计算返回值,这时候函数返回值依然是函数就很有作用了,也就是所谓的惰性求值.

```go
func evalWithFunctionalStyle(a, b int, op func(int, int) (int, error)) func() (int, error) {
    return func() (int, error) {
        return op(a, b)
    }
}
```

上述函数看起来可能有点点,其实相对于上例仅仅更改了返回值,由原来的 `(int, error)` 更改成 `func() (int, error)` ,其余均保持不变哟!

`evalWithFunctionalStyle` 函数依然是使用者的主场,和上例相比的唯一不同之处在于,你的主场你做主,什么时候裁判完全自己说了算,并不是运行后就立马宣布结果.

```go
func pow(a, b int) (int, error) {
    return int(math.Pow(float64(a), float64(b))),nil
}

func TestEvalWithFunctionalStyle(t *testing.T) {
    ef := evalWithFunctionalStyle(5, 2, pow)

    time.Sleep(time.Second * 1)

    // Success: 25
    if result, err := ef(); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }
}
```

`time.Sleep(time.Second * 1)` 演示代码代表执行 `evalWithFunctionalStyle` 函数后可以不立即计算最终结果,等待时机合适后由使用者再次调用 `ef()` 函数进行惰性求值.

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

- 函数可以充当类型

上述示例中讲解了函数可以作为返回值,参数有函数,返回值也有参数,所以 `evalWithFunctionalStyle` 函数看起来比较费劲,而 `Go` 语言的类型别名就是为了简化而生的,更何况函数是 `Go` 中的一等公民,当然也适合了.

```go
func evalWithFunctionalStyle(a, b int, op func(int, int) (int, error)) func() (int, error) {
    return func() (int, error) {
        return op(a, b)
    }
}
```

于是打算把入参函数 `func(int, int) (int, error)` 和返回值函数 `func() (int, error)` 进行统一,而入参函数和返回值函数唯一不同之处就是入参个数不同,所以顺理成章想到了 `Go` 函数中的不定长参数相关语法.

```go
type generateIntFunc func(base ...int) (int, error)
```

这样入参函数和出参函数都可以用 `generateIntFunc` 类型函数进行替代,接着改造 `evalWithFunctionalStyle` 函数.

```go
func evalWithObjectiveStyle(a, b int, op generateIntFunc) generateIntFunc {
    return func(base ...int) (i int, e error) {
        return op(a, b)
    }
}
```

改造后的 `evalWithObjectiveStyle` 函数看起来比较简洁,花花架子中看是否中用还不好说,还是用测试用例说话吧!

```go
func TestEvalWithObjectiveStyle(t *testing.T) {
    ef := evalWithObjectiveStyle(5, 2, func(base ...int) (int,error) {
        result := 0
        for i := range base {
            result += base[i]
        }
        return result,nil
    })

    time.Sleep(time.Second * 1)

    // Success: 7
    if result, err := ef(); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }
}
```

函数别名进行类型化后并不影响功能,依然是函数式编程,不过夹杂了些面向对象的味道.

- 类型化函数可以实现接口

函数通过别名形式进行类型化后可以实现接口,某些程度上可以视为一种类型,因此实现接口也是顺理成章的事情.

```go
func (g generateIntFunc) String() string {
    r,_ := g()
    return fmt.Sprint(r)
}
```

> 此处示例代码中为类型化函数 `generateIntFunc` 实现 `String` 接口方法,可能并没有太大实际意义,仅仅是为了讲解这个知识点而硬凑上去的,实际情况肯定会有所不同.

```go
func TestEvalWithInterfaceStyle(t *testing.T) {
    ef := evalWithObjectiveStyle(5, 2, func(base ...int) (int,error) {
        result := 0
        for i := range base {
            result += base[i]
        }
        return result,nil
    })

    time.Sleep(time.Second * 1)

    // String: 7
    t.Log("String:", ef.String())

    // Success: 7
    if result, err := ef(); err != nil {
        t.Log("Error:", err)
    } else {
        t.Log("Success:", result)
    }
}
```

惰性求值获取的函数变量 `ef` 此时可以调用 `String` 方法,也就是具备对象化能力,得到的最终结果竟然和直接运行该函数的值一样?

有点神奇,目前还不理解这是什么操作,如果有 `Go` 语言的大佬们不吝赐教的话,小弟感激不尽!

- 水到渠成的闭包

函数的参数,返回值都可以是另外的函数,函数也可以作为引用那样传递给变量,也存在匿名函数等简化形式,除此之外,类型化后的函数还可以用来实现接口等等特性应该足以阐释一等公民的高贵身份地位了吧?

如此强大的函数特性,只要稍加组合使用就会拥有强大的能力,并且 `Go` 语言并不是严格的函数式语言,没有太多语法层面的限制.

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

斐波那契数列函数 `fibonacci` 的返回值是真正的生成器函数,每次调用都会生成新的斐波那契数字.

这就是 `Go` 语言实现闭包的一种简单示例,`fibonacci` 函数本身的变量 `a,b` 被内部匿名函数 `func() int` 所引用,而这种引用最终被使用者不断调用就会导致最初的 `a,b` 变量一直被占用着,只要继续调用这种生成器,裴波那契数列的数字就会一直递增.

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

```go
func TestFibonacci(t *testing.T) {
    f := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Print(f(), " ")
    }
    fmt.Println()
}
```

## 总结

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
