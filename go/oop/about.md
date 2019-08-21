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

是什么,为什么和怎么样是三个基本问题,如果是简单学习了解的话,是什么和怎么样就已经足够了,但是学着学着难免会陷入各自孤立的场景,各个编程语言之间没有任何关系,每一种语言都是独立存在的?!

世界语言千千万,编程语言也不少,学了新语言却没有利用到旧语言,那学习新语言时和纯小白有何差异?学到是学会了,可惜却对旧语言没什么帮助也没有加深旧语言的理解,只是单纯的学习罢了.

语言是创造出来的,但都不是凭空而来而是建立在已有的只是体系下演变发展而来,所以何不尝试一下,弄清楚语言设计的初衷和面临的问题,然后再看语言的实现细节,看一下是如何解决问题的,我想这种方式应该是更好的学习过程吧.

虽然无法深处语言设计时环境,也不明白语言设计面临的问题,但先问尝试着问自己一下为什么,不这么设计行不行诸如此类的问题,应该才是学习新知识的好姿势.

所以接下来的文章都会采用语义性分析的角度,尝试理解语言背后的设计初衷,同时以大量的辅助性的测试验证自己的猜想,不再是简单的知识罗列整理过程,当然必要的知识归纳还是很重要的,这一点也不会放弃.

动态数组已经定义完毕,也就是设计者的工作暂时告一段落,那作为使用者,如何使用我们的动态数组呢?

按照面向对象的说法,由类对对象的过程叫做实例化,然而我们已经知道 `Go` 并不是安全的面向对象语言,因此尽可能避免用面向对象的专业术语去称呼 `Go` 的实现细节,可以将其理解为结构体类型和结构体变量的关系.

```go
func TestMyDynamicArray(t *testing.T){
	var arr MyDynamicArray

	// {<nil> 0 0}
	t.Log(arr)
}
```

上述写法并没有特殊强调过,安全是用前几篇文章中介绍过的语法规则实现的,`var arr MyDynamicArray` 表示声明类型为 `MyDynamicArray` 的变量 `arr` ,此时直接打印该变量的值,得到的是 `{<nil> 0 0}`.

后两个值都是 `0`,也很好理解,讲解 `Go` 语言中的变量时我们就介绍过,`Go` 的变量类型默认初始化都有相应的零值,`int` 类型的 `len cap` 属性自然就是 `0`,而 `ptr *[]int` 是指向数组的指针,所以是 `nil`.

等等,有点不对劲,这里有个设计错误,取名于动态数组结果内部却是切片,这算怎么回事?先修正这个错误再说!

![go-oop-about-myDynamicArray-array-size-with-cap.png](../images/go-oop-about-myDynamicArray-array-size-with-cap.png)

使用数组必须制定数组初始化长度,第一感觉是使用 `cap` 表示的容量来初始化 `*[cap]int` 数组,然而并不可以,编辑器提示必须使用整型数字.

虽然 `cap` 是 `int` 类型的变量,但内部数组 `[cap]int` 并不能识别这种方式,可能是因为这两个变量时一块声明的,`cap` 和 `[cap]int` 都是变量,无法分配.

那如果指定初始化长度应该指定多少呢,如果是 `0` 的话,语义上正确,但和实际使用情况不符合,数组无法插入了!

![go-oop-about-myDynamicArray-array-size-with-zero.png](../images/go-oop-about-myDynamicArray-array-size-with-zero.png)

如果数组的初始化长度不为零,解决了无法操作数组的问题,语义上又不正确了,因此需要这种情况下维护两个变量 `len` 和 `cap` 的值,`len` 表示真正的数组个数,`cap` 表示内部数组实际分配的长度,由于这两个变量至关重要,不需要被调用者随意修改,最多只能查看变量的值.

按照这个思路设计如下代码:

```go
type MyDynamicArray struct {
	ptr *[10]int
	len int
	cap int
}

func TestMyDynamicArray(t *testing.T){
	var myDynamicArray MyDynamicArray

	t.Log(myDynamicArray)

	myDynamicArray.len = 0
	myDynamicArray.cap = 10
	var arr [10]int
	myDynamicArray.ptr = &arr

	t.Log(myDynamicArray)
	t.Log(*myDynamicArray.ptr)
}
```

`var myDynamicArray MyDynamicArray` 声明结构体变量后并设置了结构体的基本属性,然后操作了内部数组,实现了数组的访问修改.

![go-oop-about-myDynamicArray-array-size-with-init.png](../images/go-oop-about-myDynamicArray-array-size-with-init.png)

然而,调用者关注的不应该是实现的细节上,这部分应该有设计者实现,将有关数据封装成一个整体以便方便调用者.

第一步,先将内部数组相关的两个变量进行封装,对外仅提供访问接口不提供设置接口,防止调用者随意修改.

很显然这部分应该是函数来实现,于是乎有了下面的改造过程.

![go-oop-about-myDynamicArray-method-inner.png](../images/go-oop-about-myDynamicArray-method-inner.png)

很遗憾,编辑器直接报错: 必须是类型名称或是指向类型名称的指针.

函数不可以放在结构体内,这一点倒是像极了 `C` 家族,让 `Java` 这种衍生家族觉得不可思议,也就意味着结构体只能定义结构,不能定义行为!

那我们就把函数移动到结构体外部吧,可是我们定义的函数名叫做 `len`,而系统也有 `len` 函数,此时能否正常运行呢?

![go-oop-about-myDynamicArray-method-len.png](../images/go-oop-about-myDynamicArray-method-len.png)

除了函数本身报错外,函数内部的 `len` 也报错了,也就是说此时的函数和结构体尚未建立起任何联系,怎么能访问到 `len` 属性呢?

这很简单,直接将结构体的指针传递给 `len` 函数,那函数内部就可以访问到结构体的属性了吧!

![go-oop-about-myDynamicArray-method-len-with-args.png](../images/go-oop-about-myDynamicArray-method-len-with-args.png)

从设计的角度上来讲,确实解决了函数定义的问题,但是使用者调用函数时的使用方法看起来和面向对象的写法有些不一样.

```go
func TestMyDynamicArray(t *testing.T) {
	var myDynamicArray MyDynamicArray

	t.Log(myDynamicArray)

	myDynamicArray.len = 0
	myDynamicArray.cap = 10
	var arr [10]int
	myDynamicArray.ptr = &arr

	t.Log(myDynamicArray)
	t.Log(*myDynamicArray.ptr)

	(*myDynamicArray.ptr)[0] = 1
	t.Log(*myDynamicArray.ptr)

	t.Log(len(&myDynamicArray))
}
```

面向对象的方法中一般都是通过点操作符 `.` 访问属性或方法的,而我们实现的属性访问是 `.` 但方法确实函数调用的形式?看起来明显不像是方法!

为了让普通的函数看起来像是面向对象中的方法,`Go` 做了下面的改变,通过将当前结构体的变量声明移动到函数名前面,从而实现类似于面向对象语言中的 `this` 或 `self` 的效果.


```go
func len(myArr *MyDynamicArray) int {
	return myArr.len
}
```

![go-oop-about-myDynamicArray-method-len-ahead-name.png](../images/go-oop-about-myDynamicArray-method-len-ahead-name.png)

此时方法名和参数返回值又报错了,根据提示说函数名和字段名不能相同?又是一件神奇的事情,难不成 `Go` 无法区分函数和字段?

那我们只好修改函数名,改成面向对象中喜闻乐见的方法命名规则,如下:

```go
func (myArr *MyDynamicArray) GetLen() int {
	return myArr.len
}
```

> 简单说一下 `Go` 的访问性规则,大写字母开头的表示公开的 `public` 权限,小写字母开头表示私有的 `private` 权限,只有这两类权限,都是针对包 `package` 而言,以后会再细说,现在先这么理解就行了.

