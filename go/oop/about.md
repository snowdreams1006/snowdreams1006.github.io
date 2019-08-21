# 面向对象

面向对象编程风格深受广大开发者喜欢,尤其是以 `C++`,`Java` 为典型代表,来源于 `C` 语言,却不同于 `C` 的面向过程编程方式带来了极大的便利性.

`Go` 语言同样是来源于 `C` 语言,可能会好奇 `Go` 语言是否支持面向对象编程风格呢?

客观的说,`Go` 既是面向对象语言又不是面向对象! 

![go-oop-about-schrodinger-cat.jpeg](../images/go-oop-about-schrodinger-cat.jpeg)

> 是也不是,难道像是薛定谔的猫一样不确定性?其实这个答案是官方的回答,可参考 [Is Go an object-oriented language?](https://golang.google.cn/doc/faq#Is_Go_an_object-oriented_language)

`Go` 支持封装,不支持继承和多态特性,如果严格按照面向对象的相关规范,不能说 `Go` 是面向对象的编程语言.

但是,`Go` 提供的接口是一种非常简单上手且更加通用的方式,虽然和其他主流的编程语言明显不同,甚至不能实现多态,但 `Go` 的接口不仅适用于结构体,也可以适用于任何数据类型!

争议性比较大的就是继承了,没有任何关键字直接支持继承特性,与此同时,存在着某些方式可以将类型嵌入到其他类型中以实现子类化,但那并不是真正的继承!

所以说,`Go` 既支持面向对象编程风格又不完全是面向对象编程语言,换个角度看问题,没有继承特性使得`Go` 相对于面向对象编程语言更加轻量化!

以下是官方问答中关于面向对象编程语言的原文:

> **Is Go an object-oriented language?**
>
> Yes and no. Although Go has types and methods and allows an object-oriented style of programming, there is no type hierarchy. The concept of “interface” in Go provides a different approach that we believe is easy to use and in some ways more general. There are also ways to embed types in other types to provide something analogous—but not identical—to subclassing. Moreover, methods in Go are more general than in C++ or Java: they can be defined for any sort of data, even built-in types such as plain, “unboxed” integers. They are not restricted to structs (classes).
>
> Also, the lack of a type hierarchy makes “objects” in Go feel much more lightweight than in languages such as C++ or Java.

如果按照面向对象的说法,其中实现封装特性的那部分应该是类和对象,但是这种概念与实现语言的关键字`class` 是密不可分的,然而 `Go` 并没有 `class` 关键字而是 `C` 语言家族的 `struct` 关键字,因为习惯上还是采用结构体的概念吧!

## 如何定义结构体

`stuct` 关键字声明结构体,属性之间直接回车换行方式作为分割标志,比如下面示例定义了自定义类型的动态数组结构体.

```go
type MyDynamicArray struct {
	ptr *[]int
	len int
	cap int
}
```

`Go` 语言为什么和其他主流的编程语言不同,习惯于分号结尾的开发者可能一时并不习惯 `Go` 的这种语法,于是决定尝试性实验探索一下 `Go` 的编程规范!
 
![go-oop-about-redundant-semicolon.png](../images/go-oop-about-redundant-semicolon.png)

> 如果手动添加分号的话,编辑器则会提示分号重复,所以猜想是编译器会自动添加分号以为做语句声明的分隔符,于是就和我们自己定义的分号重复了,所以要求我们删除分号,这样编译器就能无条件添加分号了.
>
> 有什么好处呢,自己添加分号和编译器无条件添加分号结果不都是一样的吗,更何况其他主流的编程语言都是手动添加分号的啊!

存在多个属性时使用换行符而不是分号作为分隔符,对于从未接触过编程语言的小白来说,可能会省事儿,但是对于已有编程经验的开发者来说,却需要特别记住不能添加分号.

如果多个属性全部写在一行时,没有换行符还怎么区分,此时用逗号分割还是用分号分割呢?

![go-oop-about-semicolon-or-new-line.png](../images/go-oop-about-semicolon-or-new-line.png)

空格肯定是不能分割多个属性的,根据提示说需要分号或者换行符,而换行符是标准形式,所以接下来试一下分号能不能分割?

![go-oop-about-semicolon-in-one-line.png](../images/go-oop-about-semicolon-in-one-line.png)

编辑器此时没有报错或警告信息,因此在一行上多个属性之间应该用分号分割,也就是说 `Go` 编译器识别多个属性仍然是同其他主流的编程语言一样,使用分号分割,而开发者却不能用!

上述规则记忆很简单,验证语法规则也比较容易,难点在于为什么 `Go` 会这么设计?或者说如何认识到这种设计思路背后的语义?
 
`Go` 是一门新的编程语言,不仅体现在具体的语法差异性,更重要的是编程思想的特殊性.正如面向对象中的接口一样,只需要定义抽象的行为而并不关注行为的具体实现.

采用这种思路来理解不同的编程语言的差异性的话就能透过现象看本质了,否则很容易陷入语法细节上,进而可能忽略了背后的核心思想.

关于结构体的多属性分隔符问题上,不论采用什么分隔符都行,只要能让编译器识别到不同的属性就行,其他的主流编程语言一般采用分号作为分隔符,所以开发者需要手动编写分隔号以供编译器识别,而 `Go` 语言却说,算了吧,直接换行吧,我一样可以识别到(底层编译器进行编译时会自动添加分号)!

添加或者不添加,对于开发者而言都是一种分割多个属性的标志,如果能不添加就能实现,那为什么还要添加呢?

