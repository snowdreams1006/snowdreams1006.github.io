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

按照实验得到的方法规则,继续完善其他方法,补充 `GetCap` 和 `IsEmpty` 等方法.

现在我们已经解决了私有变量的访问性问题,对于初始化的逻辑还没有处理,一般来说,初始化逻辑可以放到构造函数中执行,那 `Go` 是否支持构造函数呢,以及怎么才能触发构造函数?

![go-oop-about-myDynamicArray-constuct.png](../images/go-oop-about-myDynamicArray-constuct.png)

尝试按照其他主流的编程语言构造函数的写法,`Go` 直接报错,提示重新定义了 `MyDynamicArray` 类型,以至于影响了其余部分,如果修改方法名称,虽然可以解决报错问题,但是这并不是构造函数的样子了.

此时,这种形式的构造函数转变成自定义函数实现构造函数的功能,更加准确的说法,非常类似于工厂模式.

```go
func NewMyDynamicArray() *MyDynamicArray {
	var myDynamicArray MyDynamicArray
	return &myDynamicArray
}
```

难道 `Go` 语言不支持构造函数?

至于是否支持构造函数或者说如何支持构造函数,表达一下个人看法.

`Go` 的结构体中只能定义数据,结构体的方法必须是结构体外部定义,为了符合面向对象的使用习惯,也就是通过实例对象的点操作符访问方法或熟悉这一书写习惯,`Go` 的方法只能是函数的变体,普通函数的参数部分关于指向结构体变量的声明部分转移到函数名前面来实现方法,这也是符合 `Go` 一贯的命名规则: 向来是按照人的思维习惯命名,先有输入再有输出等逻辑.

结构体的方法已经从语法和语义的角度上支持了,那么构造函数应该如何实现呢?

构造函数正如其名也应该是函数,而不是方法,方法由指向自身的参数,构造函数不应该有,否则都有实例对象了还构造毛线?

既然构造函数是普通函数,按照面向对象的命名习惯,方法名应该是结构体名,然后这么操作下去编辑器直接就报错了,因此不符合面向对象的命名.

所以,构造函数的名称可能并不是结构体类型的名称,有可能是其他特殊的名称,最好这个名称能够见名知义且具备实例化对象时自动调用的能力.

当然这个名称依赖于 `Go` 的设计者如何命名,靠猜测是很难猜对的.

除此之外,还有另外一种可能,那就是 `Go` 并没有构造函数,想要实现构造函数的逻辑可以通过工厂模式自行生产!

这么说有没有什么靠谱的依据呢?

我想是有的,构造函数虽然提供了自动初始化逻辑的能力,但是如果真的在构造函数中加入复杂的初始化逻辑,无疑会增大以后出错的排查难度并给使用者带来一定的阅读障碍,所以说一定程度上,构造函数可能被滥用了!

那是否就意味着不需要构造函数了呢?

也不能这么说,构造函数本身可以做基本的变量初始化以及简单的逻辑,在实际编程中还是有一定用途的,为了避免滥用而直接禁用,多少有点饮鸩止渴的感觉.

因此,个人的看法是可以保留构造函数的逻辑,换一种思路去实现,或者干脆全部放弃构造函数,由编译器实现构造函数,正如编译器可以自动添加多字段之间的分号那样.

如果开发者真的有构造函数的需求,通过工厂模式或者单例模式等手段总是可以定制结构体初始化的逻辑!

最后,这些只是个人猜想,目前并不知道 `Go` 是否存在构造函数,有了解的人,还请明确告诉我答案,个人倾向于不存在构造函数,最多只提供类似于构造函数初始化的逻辑!

现在,我们已经封装了结构体的数据,定义了结构体的方法以及实现了结构体的工厂函数.那么接下来让我们继续完善动态数组,实现数组的基本操作.

```go
func NewMyDynamicArray() *MyDynamicArray {
	var myDynamicArray MyDynamicArray

	myDynamicArray.len = 0
	myDynamicArray.cap = 10
	var arr [10]int
	myDynamicArray.ptr = &arr

	return &myDynamicArray
}

func TestMyDynamicArray(t *testing.T) {
	myDynamicArray := NewMyDynamicArray()

	t.Log(myDynamicArray)
}
```

首先将测试用例中的逻辑提取到工厂函数中,默认无参的工厂函数初始化的内部数组长度为 `10` ,后续再考虑调用者指定以及实现动态数组等功能,暂时先实现最基本的功能.

初始化的内部数组均是零值,因此需要首先提供给外界能够添加的接口,实现如下:

```go

func (myArr *MyDynamicArray) Add(index, value int) {
	if myArr.len == myArr.cap {
		return
	}

	if index < 0 || index > myArr.len {
		return
	}

	for i := myArr.len - 1; i >= index; i-- {
		(*myArr.ptr)[i+1] = (*myArr.ptr)[i]
	}

	(*myArr.ptr)[index] = value
	myArr.len++
}
```

由于默认的初始化工厂函数暂时是固定长度的数组,因此新增元素其实是操作固定长度的数组,不过这并不妨碍后续实现动态数组部分.

为了操作方便,再提供插入头部和插入尾部两种接口,可以基于动态数组实现比较高级的数据结构.

```go
func (myArr *MyDynamicArray) AddLast(value int) {
	myArr.Add(myArr.len, value)
}

func (myArr *MyDynamicArray) AddFirst(value int) {
	myArr.Add(0, value)
}
```

为了方便测试动态数组的算法是否正确,因此提供打印方法查看数组结构.

![go-oop-about-myDynamicArray-print.png](../images/go-oop-about-myDynamicArray-print.png)

由此可见,打印方法显示的数据结构和真实的结构体数据是一样的,接下来我们就比较有信心继续封装动态数组了!

```go
func (myArr *MyDynamicArray) Set(index, value int) {
	if index < 0 || index >= myArr.len {
		return
	}

	(*myArr.ptr)[index] = value
}

func (myArr *MyDynamicArray) Get(index int) int {
	if index < 0 || index >= myArr.len {
		return -1
	}

	return (*myArr.ptr)[index]
}
```

这两个接口更加简单,更新数组指定索引的元素以及根据索引查询数组的值.

接下来让我们开始测试一下动态数组的全部接口吧!

![go-oop-about-myDynamicArray-test.png](../images/go-oop-about-myDynamicArray-test.png)

动态数组暂时告一段落,不知道你是否好奇为什么我为什么会以动态数组为例讲解面向对象?其实主要是为了验证上一篇文章中的猜想,切片和数组的关系!

我觉得切片的底层是数组,只不过语法层面提供了支持,既然学习了面向对象,那么就用面向对象的方式实现下切片的功能,虽然语法无法实现,但是功能特性完全可以模仿的啊!

下面还是梳理总结一下本文的只要知识点吧,也就是封装的实现.

## 如何封装结构体

之所以称之为结构体是因为 `Go` 的关键字是 `struct` 而不是 `class`,也是面向对象编程风格中唯一支持的特性,继承和多态都不支持,到时候另开文章细说.

结构体是对数据进行封装所使用的手段,结构体内只能定义数据而不能定义方法,这些数据有时候被称为字段,有时候叫做属性或者干脆叫做变量,至于什么叫法不是特别重要,如何命名和所处的环境语义有关.

```go
type MyDynamicArray struct {
	ptr *[10]int
	len int
	cap int
}
```

这种结构体内就有三个变量,变量之间直接换行进行分割而不是分号并换行的形式,刚开始觉得有些怪,不过编辑器一般都很智能,假如习惯性添加了分号,会提示你进行删除,所以语法细节上不必在意.

结构体内不支持编写函数,仅支持数据结构,这样就意味着数据和行为是分开的,两者之间的关联是比较弱的.

```go
func (myArr *MyDynamicArray) IsEmpty() bool {
	return myArr.len == 0
}
```

这种方式的函数和普通函数略有不同,将包含结构体变量的参数提前到函数名前面,语义上也比较明确,表示的是结构体的函数,为了和普通函数有所区别,这种函数称之为方法.

其实,单纯地就实现功能上看,方法和函数并没有什么不同,无外乎调用者的使用方式不一样罢了!

```go
func IsEmpty(myArr *MyDynamicArray) bool {
	return myArr.len == 0
}
```

之所以是这种设计方式,一方面体现了函数的重要性,毕竟是 `Go` 语言中的一等公民嘛!另一方面是为了实现面向对象的语法习惯,不论属性还是方法,统统用点 `.` 操作符进行调用.

官方的文档中将这种结构体参数称之为接收者,因为数据和行为是弱关联的,这里的接收者充当的就是关联数据的作用,接收者顾名思义就是接受数据的人,那发送数据的人又是谁呢?

不言而言,发送者应该是调用者传递的结构体实例对象,结构体变量将数据结构发送给接收者方法,从而数据和行为联系在一起了.

```go
func TestMyDynamicArray(t *testing.T) {
	myDynamicArray := NewMyDynamicArray()

	fmt.Println(myDynamicArray.IsEmpty())
}
```
