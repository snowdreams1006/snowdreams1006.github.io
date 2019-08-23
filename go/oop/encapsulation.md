# 再说封装

在上篇文章中,我们尝试了 `Go` 语言中面向对象的写法,通过已有的运用已有的编程经验逐步试错接近 `Go` 的面向对象实现.

由于是探索式学习,只在乎过程和结果并没有特别注重知识的相关性.

如果用走迷宫来比喻的话,一条道走到黑,直到走到终点这种策略就是深度优先算法.如果边走边看,四处观望周围的风景也能走到终点,这种策略就是广度优先算法.

深度优先目标明确,正如探索面向对象编程,首先设计对象的存储结构,然后实例化结构,有了对象就能使用相应的数据.当然这个对象可能不仅仅只有数据还有对象的行为,那就探索如何实现行为,发现了只需要将函数稍稍改变一下就能实现方法.这样对象的属性和方法都探索完成,一个对象也就完成了,走到了迷宫的终点.

可是从始至终,我们都没有留意周围的花香,只要找到一条正确的路就继续往下走,完全不管有没有其他的路可以走,所以最终结我们只知道一条正确的路,有没有其他的路就不知道了.

等回过神来,有个闲情逸致可以好好欣赏周围的风景,闻一闻周围的花香,不在乎找到路而注重总共能找到多少条路.

广度优先算法告诉我们,边走边看地毯式推进,这样能收获最大,可想而知耗费的精力也越多.

## 定义结构体

定义结构体的方式只有这么一种,不存在其他的简化形式?我觉得不会不存在,结构体存在多个属性的话用下面的方式定义是合理的,如果属性只有一个的话,此时这种形式的结构体应该可以进行简化.

```go
type MyDynamicArray struct {
    ptr *[10]int
    len int
    cap int
}
```

所谓的结构体只不过是实现封装的一种手段而已,当封装的对象只有一种属性,这个属性也就不存在属性名或者说这个唯一的属性名应该就可以由编译器级别进行定义,属性的类型自然是不可以少的,这么想的话,对于封装只有一个属性对象来说,只需要考虑的是这个唯一属性的类型.

所以,我觉得是这种猜想是合理的,但是按照已有的知识能否实现呢?先审视一下上篇文章中关于动态数组的声明.

```go
type MyDynamicArray struct {
    ptr *[10]int
    len int
    cap int
}
```

如果一定要从三个属性中选择一个属性,那只能是保留内部数组,排除其余两个属性,可能实现不了动态数组的功能,语义上有所欠缺.

但是这仅仅是实验,实际情况中可能存在只有一个属性的例子,只不过用动态数组举例不太适合.

只保留内部数组,于是动态数组变成这样,由于失去了动态数组的语义,命名上也做了改变,姑且称之为 `MyArray` 吧!

```go
type MyArray struct {
    arr [10]int
}
```

很明显,现在仍然是结构体的标准语法形式,思考一下如何简化这种形式,因为这种简化形式的内部属性只有一个,所以属性名必须省略而属性类型可能不同,因此应该在简化形式中只保留声明内部属性类型的部分.

```go
type MyArray struct {
    [10]int
}
```

多个属性才需要换行分割,一个属性自然是不需要换行的,因此大括号也是没必要存在的,这也是符合 `Go` 设计中尽可能精简的情况下保证语义清晰的原则.

当然是否真的有什么原则的话,可能会有也可能没有,我也不知道,只是感觉处处体现了这么一种哲学思想,不用较真,只是个人立场看法.

```go
type MyArray struct [10]int
```

现在这种形式应该可以算是只有一种属性的结构体的简化形式,`struct` 语义上指明了 `MyArray` 是结构体,紧随后面的 `[10]int` 语义上表示结构体的类型,整体上就是说 `MyArray` 结构体的类型是 `[10]int` .

现在让我们在编辑器中测试一下,看一看 `Go` 的编译会不会报错,能否支持我们的猜测呢?

![go-oop-encapsulation-struct-sole-error.png](../images/go-oop-encapsulation-struct-sole-error.png)

编辑器告诉我们 `[10]int` 不合法,必须是类型或类型指针!

可 `[10]int` 确实是我们需要的类型,既然报错也就是说不支持这种简化形式,可能是 `struct` 关键字不支持,那就去掉这个关键字好了!

![go-oop-encapsulation-struct-sole-success.png](../images/go-oop-encapsulation-struct-sole-success.png)

没想到真的可以!至少现在看来编译器是支持的,至于这种支持的形式是不是和我们预期实现的语义一致还不好说,继续做实验探索.

![go-oop-encapsulation-struct-sole-test.png](../images/go-oop-encapsulation-struct-sole-test.png)

通过简单的声明变量后直接打印输出初步证明了我们这种简化形式是可以正常工作的,输出结果也是我们定义的内部数组.

接下来看一看能不能对这个所谓的内部数组进行操作呢,这种简化形式只有一个属性,指明了属性的类型,不需要属性名或者说不能要属性名,访问该属性应该直接通过结构体的变量访问,这种思路对不对呢?

```go
type MyArray [10]int

func TestMyArray(t *testing.T) {
	var myArr MyArray

	// [0 0 0 0 0 0 0 0 0 0]
	t.Log(myArr)

	myArr[0] = 1
	myArr[9] = 9

	// [1 0 0 0 0 0 0 0 0 9]
	t.Log(myArr)
}
```

猜想得到验证,`Go` 编译器也是通过结构体变量直接操作内部属性的,看来这一次是猜对了!

先别急着高兴,将唯一的属性换成其他类型多测试几遍看看是否依然正常?

```go
type MyBool bool

func TestMyBool(t *testing.T) {
	var myBool MyBool

	// false
	t.Log(myBool)

	myBool = true

	// true
	t.Log(myBool)
}
```

一番测试后并没有报错,很有可能这是 `Go` 所支持的结构体简化形式,和我们的预期一致.

关于结构体属性的语法规则暂时没有继续探索的新角度,只有一个属性的结构体也确实存在简化形式,那结构体的定义上还剩下方法.

接下来我们尝试着探索方法有没有隐藏技能,完全利用已知知识去推测未知,探索的过程中要尽可能的设身处地思考 `Go` 语言应该如何设计才能方便使用者.

![go-oop-encapsulation-struct-sole-method.png](../images/go-oop-encapsulation-struct-sole-method.png)

结构体的简化形式下并不支持方法,仔细想一想这样做也是有理可循的,完全可以推测出来.

首先单纯地进行语法层面分析,为什么单属性的结构体不支持方法?

还记得我们想要简化单属性结构体遇到的报错提示吗?

```go
type MyArray struct [10]int
```

直接将单属性的类型放到 `struct` 关键字后面,编译器会报错,当我们省略 `struct` 关键字时上述报错就消失了.

从编译器的角度上来讲,`struct` 是系统关键字,告诉编译器只要遇到这个字就解析成结构体的语法,现在没有遇到结构体关键字也就意味着不是结构体语法.

关键字和结构体是一一对应,充分必要条件,由关键字可以推测到结构体,由结构体也可以推测到关键字.

再回来看一看,我们的单属性结构体定义上是怎么写的?

```go
type MyArray [10]int
```

因为没有关键字 `struct` ,所以编译器推断 `MyArray` 不是结构体,既然不是结构体,也不能用结构体的接收者函数去定义方法.

```go
func (myBool *MyBool) IsTrue() bool{
	return myBool
}
```

所以这种方法就会报错,并不支持单属性结构体的方法.

从语法层面解释了为什么不支持,现在我们从语义的角度上解释一下为什么不支持方法?

回到探索的初衷,当正在定义的结构体有多个属性时应该按照标准写法为每个属性指定属性的名称和类型,假如该属性有且只有一个时,再按照标准写法定义当然可以,但也应该提供更加简化的写法.

只有一个属性的结构体,属性的名称是没有意义的也是不应该出现的,因为完全可以用结构体变量所代替,此时这个结构体有存在价值的就是属性的类型.

类型包括内建类型和用户自定义类型,因而这种形式的结构体的语义完全由该结构体到属性类型所决定,而属性类型还需要方法吗?

自然是不需要的!属性类型应该是该属性类型自己定义的,这样才能确保职责清晰,彼此分离!

综上,个人觉得 `Go` 的设计还是有章可循的,是可以进行推测性学习,单属性的结构体不能也不应该能定义方法.

单属性的结构体不支持方法,此路不通,原路返回,接着继续探索方法.

上文中定义动态数组时,内部使用的数组暂时是静态数组,现在为了方便继续探索方法,提供重载方法使其支持动态数组.

```go
func NewMyDynamicArray() *MyDynamicArray {
	var myDynamicArray MyDynamicArray

	myDynamicArray.len = 0
	myDynamicArray.cap = 10
	var arr [10]int
	myDynamicArray.ptr = &arr

	return &myDynamicArray
}
```

内部数组 `arr` 是静态数组,应该提供可以让外部调用者初始化指定数组到接口,按照已知的面向对象中关于方法的定义来扩展重载方法.

![go-oop-encapsulation-struct-method-overload.png](../images/go-oop-encapsulation-struct-method-overload.png)

初次尝试方法的重载就遇到了问题,报错提示该方法已声明,所以说 `Go` 不支持方法重载,这样就有点麻烦了.

想要实现类似的功能要么通过定义不同的方法名,要么定义一个非常大的函数,接收最全的参数,根据调用者参数进行对应的逻辑处理.

用惯了方法的重载,突然发现这种特性在 `Go` 语言中无法实现,顿时有点沮丧,和其他主流的面向对象语言差异性也太大了吧!

不支持构造函数,不支持方法重载,原来以为理所应当的特性现在发现并不是理所应当了.

还是先冷静下来想一想,`Go` 为什么不支持方法重载呢?难不成和构造函数那样,怕是滥用干脆禁用的逻辑?

不是设计者,无法体会也不想猜测原因,可以肯定的是,`Go` 语言是一门全新的语言,有着独特的设计思路,不与众人同!

吐槽时间结束,既然上了贼船就得一条道走到黑,不支持方法重载就换个函数名或者按参数名区分.

![go-oop-encapsulation-struct-method-error.png](../images/go-oop-encapsulation-struct-method-error.png)

天啊撸,刚刚解决方法重载问题又冒出数组初始化不能是变量只能是常量表达式?

简直不可思议!

既然数组初始化长度只是常量表达式,也就无法接收外部传递的容量 `cap`,没有了容量只能接收长度 `len` ,而初始化内部数组长度又没办法确定了,两个变量都无法对外暴露!

一切又回到原点,想要实现动态数组的功能只能靠具体的方法中去动态扩容和缩容,不能初始化指定长度了.

这样的话,关于方法也是一条死路,停止探索.

## 声明结构体

关于结构体定义的属性和方法都已经探索完毕,除了发现一种单属性结构的简化形式外,暂时没有新的发现.

回到使用者的角度上,声明结构体有没有其他方式呢?

```go
var myDynamicArray MyDynamicArray
	
t.Log(myDynamicArray)
```

这是变量的声明,除了这种形式,在学习 `Go` 的变量时还介绍过声明并初始化方式以及切片和映射的 `make` 方式,能不能也用于结构体呢?

```go
var myDynamicArray = MyDynamicArray{
		
}

t.Log(myDynamicArray)
```

编译器没有报错,证明这种字面量形式也是适用的,不过空数据结构没有太大的意义,怎么能初始化对应的结构呢?

和多属性的结构体最为相似的数据结构莫过于映射 `map` 了,回忆一下 `map` 如何进行字面量初始化的吧!

```go
var m = map[string]string{
	"id":   "1006",
	"name": "雪之梦技术驿站",
}

t.Log(m)
```

模仿这种结构看看能不能对结构体也这么初始化,果然就没有那么顺利!

![go-oop-encapsulation-struct-init-field-error.png](../images/go-oop-encapsulation-struct-init-field-error.png)

我还没定义,你就不行了?提示字段名称无效,结构体明明就有 `len` 字段啊,除非是没有正确识别!

`"len"` 与 `len` 是不一样的吧?那就去掉双引号 `""` 直接使用字段名进行定义看看.

```go
var myDynamicArray = MyDynamicArray{
	len: 10,
}

t.Log(myDynamicArray)
```

此时报错消失了,成功解锁一种新的隐藏技能.

```go
var myDynamicArray = MyDynamicArray{
	ptr: &[10]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
	len: 10,
	cap: 10,
}

t.Log(myDynamicArray)
```

除了这种指定字段名称注入方式,能不能不指定字段名称而是按照顺序初始化?

![go-oop-encapsulation-struct-init-field-in-order.png](../images/go-oop-encapsulation-struct-init-field-in-order.png)

借助编辑器可以看到确实是按照顺序注入的,这样的话,其实有点意思了,明明不支持构造函数,采用字面量实例化时却看起来像构造函数的无参,有参数和全参形式?

可以预想到的是,这种全参注入的方式一定是严格按照定义顺序相匹配的,当参数不全时可能按位插入也可能不支持.

![go-oop-encapsulation-struct-init-field-lack-order.png](../images/go-oop-encapsulation-struct-init-field-lack-order.png)

事实上并不支持这种参数不全的形式,因此个人觉得要么无参要么全参要么指定初始化字段这三种还是语义清楚的.

除了字面量的方式,`Go` 是否支持创建 `slice` 或 `map` 时所使用的 `make` 函数呢?

![go-oop-encapsulation-struct-init-field-make-error.png](../images/go-oop-encapsulation-struct-init-field-make-error.png)

看样子,`make` 函数并不支持创建结构体,至于为什么不支持,原因就不清楚了,也是个人的一个疑惑点.

既然 `make` 可以创建 `slice` ,`map` 这种内建类型,语义上就是用来创建类型的变量,而结构体也是一种类型,唯一的差别可能就是结构体大多是自定义类型而不是内建类型.

如果我来设计的话,可能会一统天下,语义上一致的功能只使用相同的关键字.

回到面向对象的传统编程规范上,一般实例化对象用的是关键字 `new`,而 `new` 并不是 `Go` 中的关键字.

`Go` 语言中的一等公民是函数,正如刚才说的 `make` 也不是关键字,同样是函数.

![go-oop-encapsulation-struct-init-field-new-error.png](../images/go-oop-encapsulation-struct-init-field-new-error.png)

对于同一个目标,`Go` 总是有着自己的见解,`new` 不是以关键字形式出现而是再次以函数的身份登场,初步推测应该也能实现实例化对象的能力.

![go-oop-encapsulation-struct-init-field-new-assignment-error.png](../images/go-oop-encapsulation-struct-init-field-new-assignment-error.png)

难道 `new` 函数能实例化对象?为什么报错说赋值错误,难不成姿势不对?吓得我赶紧看一下 `new` 的文档注释.

```go

// The new built-in function allocates memory. The first argument is a type,
// not a value, and the value returned is a pointer to a newly
// allocated zero value of that type.
func new(Type) *Type
```

根据注释说明,果然是使用姿势不对,并不像其他的面向对象语言那样可以重复赋值,`Go` 不支持这种形式,还是老老实实初始化声明吧!

```go
var myDynamicArray2 = new(MyDynamicArray)
	
t.Log(myDynamicArray2)	
```

既然存在着两种方式来实例化对象,那么总要看一下有什么区别.

```go
func TestNewMyDynamicArray(t *testing.T) {
	var myDynamicArray = MyDynamicArray{
		ptr: &[10]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
		len: 10,
		cap: 10,
	}
	myDynamicArray = MyDynamicArray{
		&[10]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
		10,
		10,
	}
	t.Log(myDynamicArray)
	t.Logf("%[1]T %[1]v", myDynamicArray)

	var myDynamicArray2 = new(MyDynamicArray)
	myDynamicArray2.ptr = &[10]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	myDynamicArray2.len = 10
	myDynamicArray2.cap = 10

	t.Log(myDynamicArray2)

	t.Logf("%[1]T %[1]v", myDynamicArray2)
}
```

![go-oop-encapsulation-struct-init-field-diff.png](../images/go-oop-encapsulation-struct-init-field-diff.png)

这里简单解释下 `t.Logf("%[1]T %[1]v", myDynamicArray)` 语句,`%[1]T` 表示的 `%T` 的变体,`%[1]v` 也是 `%v` 的变体,其中占位符刚好都是同一个变量,也是第一个参数,所以就用 `[1]` 替代了,体现了 `Go` 设计的简洁.

```go
test := "snowdreams1006"

// string snowdreams1006
t.Logf("%T %v", test, test)
t.Logf("%[1]T %[1]v", test)
```

> `%T` 是打印变量的类型,应该是类型 `type` 的缩写,`v` 应该是值 `value` 的缩写.

解释清楚了测试代码的含义,再看测试结果,采用字面量方式得到的变量类型和 `new` 函数得到的变量类型明显不同.

具体表现为 `_struct.MyDynamicArray {0xc0000560f0 10 10}` 是结构体类型和具体的值,而 `*_struct.MyDynamicArray &{0xc000056190 10 10}` 是结构体类型的指针和值的地址.

这种差异也是正常的差异,符合语义,字面量实例化的对象是值对象,而 `new` 实例化对象开辟了内存,返回的是实例对象到引用,正如其他编程语言的 `new` 关键字一样.

既然说到了值对象和引用对象,再说一遍老生常谈的问题,函数或者说方法传递时应该传递哪一种类型?

## 值传递还是引用传递

接下来的示例和动态数组没什么关系,简单起见,新开一个结构体叫做 `Employee`,回顾一下目前学到的封装知识.

```
type Employee struct {
	Id   string
	Name string
	Age  int
}

func TestCreateEmployee(t *testing.T) {
	e := Employee{
		"0",
		"Bob",
		20,
	}
	t.Logf("%[1]T %[1]v", e)

	e1 := Employee{
		Name: "Mike",
		Age:  30,
	}
	t.Logf("%[1]T %[1]v", e1)

	e2 := new(Employee)
	e2.Id = "2"
	e2.Name = "Rose"
	e2.Age = 18
	t.Logf("%[1]T %[1]v", e2)
}
```

首先测试引用传递,这也是结构体常用的传递方式,行为表现上和其他的主流编程语言表现一致,方法内的修改会影响调用者的参数.

```go
func (e *Employee) toStringPointer() string {
	fmt.Printf("Name address is %x\n", unsafe.Pointer(&e.Name))

	return fmt.Sprintf("ID:%s-Name:%s-Age:%d", e.Id, e.Name, e.Age)
}

func TestToStringPointer(t *testing.T) {
	e := &Employee{"0", "Bob", 20}

	fmt.Printf("Name address is %x\n", unsafe.Pointer(&e.Name))

	t.Log(e.toStringPointer())
}
```

![go-oop-encapsulation-struct-method-diff-pointer.png](../images/go-oop-encapsulation-struct-method-diff-pointer.png)

> `unsafe.Pointer(&e.Name)` 是查看变量的内存地址,可以看出来调用前后的地址是同一个.

```go
func (e Employee) toStringValue() string {
	fmt.Printf("Name address is %x\n", unsafe.Pointer(&e.Name))

	return fmt.Sprintf("ID:%s-Name:%s-Age:%d", e.Id, e.Name, e.Age)
}

func TestToStringValue(t *testing.T) {
	e := Employee{"0", "Bob", 20}

	fmt.Printf("Name address is %x\n", unsafe.Pointer(&e.Name))

	t.Log(e.toStringValue())
}
```

![go-oop-encapsulation-struct-method-diff-value.png](../images/go-oop-encapsulation-struct-method-diff-value.png)

> 调用者发送的内存地址和接收者接收的内存地址不一样,符合期望,值传递都是拷贝变量进行传递的嘛!

值类型还是引用类型的区分无需赘述,接下来请关注一个神奇的事情,方法的接收者是值类型,方法的调用者是不是一定要传递值类型呢?

```go
func (e Employee) toString() string {
	fmt.Printf("Name address is %x\n", unsafe.Pointer(&e.Name))

	return fmt.Sprintf("ID:%s-Name:%s-Age:%d", e.Id, e.Name, e.Age)
}
```

方法的调用者分别传递值类型和引用类型,两者均能正常工作,

```go
func TestToString(t *testing.T) {
	e := Employee{"0", "Bob", 20}

	fmt.Printf("Name address is %x\n", unsafe.Pointer(&e.Name))

	t.Log(e.toString())
	t.Log((&e).toString())
}
```

![go-oop-encapsulation-struct-method-value-diff.png](../images/go-oop-encapsulation-struct-method-value-diff.png)

> 虽然方法的接收者要求的是值类型,调用者传递的是值类型还是引用类型均可!

![go-oop-encapsulation-struct-method-pointer-diff.png](../images/go-oop-encapsulation-struct-method-value-diff.png)

仅仅更改了方法接收者的类型,调用者不用做任何更改,依然可以正常运行!

同样的,语义上分析,方法的设计者和调用方法的调用者两者之间可以说是松耦合的,设计者的更改对于调用者来说没有太大影响,这也就意味着如果设计者觉得用值类型接收参数不好,完全可以直接更改为指针类型而不用通知调用者调整逻辑!

这其实要归功于 `Go` 语言到设计者很好的处理了值类型和指针类型的调用方式,不论是值类型还是引用类型,一律使用点操作符 `.` 调用方法,并不像有的语言指针类型就是 `->` 或 `*` 前缀才能调用之类的限制.

有所为有所不为,可能正是看到了这两种调用方式带来的差异性,`Go` 全部统一成点操作符了!

虽然形式上两种调用方式是一样的,但是设计方法或者函数时应该是值类型还是指针类型呢?

这里有三点建议可供参考:

- 如果接收者需要更改调用者的值,只能使用指针类型
- 如果参数本身非常大,拷贝参数比较占用内存,只能用指针类型
- 如果参数本身具有状态,拷贝参数可能会影响对象的状态,只能用指针类型
- 如果是内建类型或者比较小的结构体,完全可以忽略拷贝问题,推荐用值类型.

当然,实际情况可能还和业务相关,具体用什么类型还要自行判断,万一选用不当也不用担心,更改一下参数类型就好了也不会影响调用者的代码逻辑.

