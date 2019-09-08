# 再谈接口

接口是面向对象编程中继封装后的另一个重要概念,如果封装表达的是某一类现实事务的抽象共性,那么接口则是表示不同抽象概念之间的内在联系,这种联系可以跨域种族,跨域地区,并不是像是继承概念那样的强相关,而是一种更高层次的联系.

封装,继承和多态是面向对象编程风格中广为人知的重要特性,也常常被认为是衡量一种编程语言是否是面向对象语言的重要标准.

接口描述的是规范和实现的规则,接口定义了约束规范,至于如何实现这种规范则是接口的实现者必须关心的,从这点来看,接口就像是现实生活中的上级领导下达指令目标,下属则负责实现目标,至于如何实现,领导并不关心,正所谓条条大路通罗马,手底下的人自然是八仙过海各显神通.

领导关心结果,下属关心过程,这种模型就是编程语言中接口和实现类的关心.

如果站在领导者的角度上看问题,自然是希望下属规规矩矩按时完成自己布置的任务,千万不要出现任何差池,领导的威望和下属的恪尽职责才能换来大家的和平共处.

为了达到这个目标,领导者首先要在下属中树立足够高的威信,做到人人信服自己,手底下的人和自己统一战线才能一致对外,团结在一起才能好做事.

这种威信的树立要么靠的是能力上技高一筹实力碾压下属,要么是知人善任天下贤才皆为我所用,还可以狐假虎威绿叶衬红花思想上奴役统治.

最近重温神话,每每看到项羽兵败乌江就痛惜不已,李清照的至今思项羽,不肯过江东不自觉萦绕脑海.

项羽天生神力,力能扛鼎,兵败乌江时手底下只有18人亲信,却个个没有贪生怕死之辈,一直奋勇杀敌直到全部战死也无一人投降.

因为项羽自身能力值太过强悍,所以在古代崇武思想中自然有一大批追随者,仰慕强者自然愿意追随强者.

所以项羽是靠个人魅力逐步发家的,楚汉相争前期项羽更是占尽了先机,然而个人魅力太盛也不见得是一种好事,如果是大将军的话,那么自然没太大问题.

可是,项羽却不是大将军而是要成为帝王,个人英雄主义并不适合君王的身份.这一点倒是和三国时的关羽有些类似,自己能力太高则看不起不如自己的人.

内心的孤傲是掩饰不了,挤兑走了韩信,一意孤行气的叔父项梁摇头叹息,或许正是这种性格也暗示了最终的自刎结局.

虞兮虞兮奈若何

反观刘邦,只是沛县一个地痞无赖,人人都瞧不起,不管不顾世俗的眼光,坚信自己是做大事的人.

虽然自己没有武力值加持,但是手底下却有一大批的武将,前期只有挨打的份,丢盔弃甲,好不狼狈,如果故事到这里就戛然而止的话,那么一切似乎是理所当然.

论计策,我不如子房.

休养生息中善于笼络人心,知人善任天下英才仅为我所用,四年的楚汉相争中最终逼得项羽兵败乌江,赢得了最后的胜利.

或许正是刘邦的成功,激励着后来的造反者不论出身,皇帝再也不是贵族专有特权,人人都可以做皇帝,斩白蛇起义这种套路更是屡见不鲜.

没有技能,神仙来凑,在那个迷信的古代,但凡造反者起义前都要先鼓吹一番,笼络人心,做到出师有名,从气势上占据优势.

一旦成功,身份又变成了统治者,接下来就开始思考如何维持自身统治,四书五经,学习儒家思想等一系列手段用来维护统治.

上层建筑当政时一定会宣扬一种思想学说来稳定自己的统治,只有实现这种官方规范的天下人才能有一条出路,否则便是异类,不被世俗接受.

这种自上而下的规范是一种强约束,上层建筑也可以随时调整策略以求更好的维稳,下面的人不动乱,则上面的人就能坐得稳.

如果上层建筑的官方规范越来越严,底层人民不堪重负,无法按时交粮交税很容易再次爆发起义,此时又会诞生出千千万万个刘邦,重新建立新的规范制度.

滚滚长江东逝水,浪花淘尽英雄.

清朝科举之所以写八股文,是因为官方要求,不走科举这条路,穷苦人家没有上升的渠道.
上层建筑之所以考八股文,是因为能够筛选出志同道合的人,读书人安静了,世道也就安静了.

自古造反者一定是有学问的,什么文化都没有的人就连造反充其量也就是一群乌合之众,成不了气候!

站在上层建筑的角度看下层实现,我们自然是希望制定好规范后都要遵守,不要出什么幺蛾子.

上边的命令就是圣旨就是军令如山,下边的人一定要按照规章制度办事,不逾矩.

当这种限制发展到顶峰时,各种各样的限制越来越束缚下面的手脚,晋升无望,任人宰割乎?

北宋羸弱,军事上虽有名将但无实权,皇帝一声令下,也不得不班师回朝,战场战机变化莫测,瞬息万变但有上级指令在,却不得不按章办事.

规则已经制定,剩下的事情就去实现吧,怎么实现我不管,完完全全按照规则办事不逾矩,否则就是叛国贼子,居心叵测.

如果站在底层实现者的角度思考问题,这种上层建筑和下层实现的关心还是会存在的,不同之处是下层实现时拥有了一定的自主性.

既不希望圣旨的神圣性受到侵犯,也不希望唯命是从,在大原则不便的基础上拥有一定的自主权利,可以做到因地制,顺势而为.

将在外君令有所不受,战争的胜负不再一城一池的得失,攻心为上攻城次之.虽然上面有命令,但是实现者也可以因为情势不同,不按照这次的小命令办事,换一种自主的思路最终实现目标,完成根本目标也是胜利.

所以,这种接口和实现的关系中实现者可以不必随时向接口报告,只要总体上不违背接口的总体规划那么就是忠君爱国.

如果仅仅考虑接口和实现的关系,这种关系很容易推断,实现者要么一定上报接口,要么一定不上报接口,除此之外,很明显还有另外一种可能性,实现者可能报告也可能不报告接口.

那么,这种似乎而非的关系有什么不同,又该如何表示呢?

按照语义进行理解.报告给接口的一定是万分紧急重要的规范,大是大非面前不能有任何个人情感,一旦实现者无法实现,那么便不可饶恕,零容忍!

如果实现者不报告给接口,则表示这种规范是可选规范,如果满足的话,最好不过,如果有特殊情况一时没能实现也不是致命的问题,这类规范属于锦上添花的操作.

如果要描述这种可有可无规范和实现的关系,显而易见的是,理应由接口定义者来指明接口的优先级,不能由实现者定义,否则的话,你认为爱国是必选的,他认为是可选的,那么接口的存在还有什么意义?

既然如此,接口在声明时就应该能够选择是必选的还是可选的,这样实现者实现该接口时就有理可循,对于必选实现的接口只要没实现就不算是真正的接口实现者,而可选的接口允许实现者可以暂时不实现.

虽然这种想法是介于必须上报和必须不上报给接口之间,由于接口的声明有可选和必选之分,所以在接口和实现者的关系中还是接口定义者占据主导地位.

当接口的定义者是主导地位时,接口的实现者是有理可循被招募的,想要成为这种接口一定要实现接口的规范.

先后规范再有实现,对于实际编程中的指导就是先抽象出共同行为,定义出接口规范,再去写不同的实现类去实现该接口,当使用接口时就可以不区分具体的实现类直接调用接口本身了.

如果有一句话来描述这种行为的话,那就是理论指导实践,先写接口再写实现.

同样的,我们还知道另外一句话,这就是实践出真知,这种思路刚好也是比较符合现实的,先写所谓的实现类,当这种实现类写的比较多的时候,就如继承那样,一样会发现彼此之间的关联性.

回到编程语言中,`Go` 语言采用的是后一种,接口实现者对于接口的实现是隐式的,也就是说某一种结构体很有可能有意无意实现了某种接口.

有心插花花不开,无心插柳柳成荫.

这种似是而非若有还无的朦胧暧昧既给我们带来了方便,同时也给我们留下了烦恼,假如真的想知道到底是不是接口的实现者反而有些费事了.

庆幸的是,现代 ide 都比较智能,这种语法虽然比较灵活但还是有规律可寻的,所以一般ide 也是可以智能推测出接口和实现的关心,并不用肉眼去仔细辨别.

如果真的需要在程序中辨别接口和实现类的关心,那么只能借助系统级别的方法来判断了.

首先先定义程序员的第一课 `Hello World` 的接口:

```go
type Programmer interface {
    WriteHelloWord() string
}
```

然后按照不同的编程语言实现该接口,为了更加通用性表示 `WriteHelloWord` 的输出结果,将输出结果 `string` 定义成别名形式以此表示输出的是代码 `Code`.

```go
type Code string
```

重新整理接口定义,如下:

```go
type Programmer interface {
    WriteHelloWord() Code
}
```

首先是 `Go` 语言写第一个程序,我们知道 `Go` 实现接口是隐式的,不需要关键字强制声明.

```go
type GoProgrammer struct {
}

func (g *GoProgrammer) WriteHelloWord() Code {
    return "fmt.Println(\"Hello World!\")"
}
```

接下来,选择 `Java` 程序员作为对比,其他面向对象编程语言类似,不再赘述.

```go
type JavaProgrammer struct {
}

func (j *JavaProgrammer) WriteHelloWord() Code {
    return "System.out.Println(\"Hello World!\")"
}
```

客户需要程序员写 `WriteHelloWord` ,此时 `Go` 程序员和 `Java` 程序员各显身手,重点是看一下接口变量的类型和值.

```go
func writeFirstProgram(p Programmer) {
    fmt.Printf("%[1]T %[1]v %v\n", p, p.WriteHelloWord())
}
```

按照接口的语义,我们可以将 `Go` 程序员和 `Java` 程序员全部扔给 `writeFirstProgram` 方法中,此时接口的类型是具体实现类的类型,接口的值也是实现类的数据.

当然,不论是 `Go` 还是 `Java` 都可以写出 `WriteHelloWord` .

```go
func TestPolymorphism(t *testing.T) {
    gp := new(GoProgrammer)
    jp := new(JavaProgrammer)

    // *polymorphism.GoProgrammer &{} fmt.Println("Hello World!")
    writeFirstProgram(gp)
    // *polymorphism.JavaProgrammer &{} System.out.Println("Hello World!")
    writeFirstProgram(jp)
}
```

上述例子很简单,我们自然也是可以一眼看出接口和实现类的关系,并且 ide 也为我们提供非常直观的效果,在比较复杂的结构体中这种可视化效果尤为重要.

![go-oop-interface-type-programer.png](../images/go-oop-interface-type-programer.png)

如果你非要和我较真,说你正在用的 ide 无法可视化直接看出某个类型是否满足某接口,那怎么办?

我的建议是,那就换成和我一样的ide 不就好了吗!

哈哈,这只不过是我的一厢情愿罢了,有些人是不愿意改变的,不会随随便便就换一个 ide,那我就告诉你另外一个方法来检测类型和接口的关系.

赵本山说,没事你就走两步?

博大精深,如果某个结构体类型满足特定接口,那么这个这个结构体的实例化后一定可以赋值给接口类型,如果不能则说明肯定没有实现!

肉眼看不出的关系,那就拿放大镜看,编译错误则不符合,编译通过则满足.

为了对比效果,这里再定义一个新的接口 `MyProgrammer` ,除了名称外,接口暂时和 `Programmer` 完全一样.

```go
type MyProgrammer interface {
    WriteHelloWord() Code
}
```

![go-oop-interface-type-myProgrammer-pass.png](../images/go-oop-interface-type-myProgrammer-pass.png)

ide 并没有报错,左侧的可视化效果也表明 `MyProgrammer` 和 `Programmer` 接口虽然名称不同,但是接口方法却一模一样,`GoProgrammer` 类型不仅实现了原来的 `Programmer` 接口还顺便实现了 `MyProgrammer`.

不仅 `GoProgrammer` 是这样,`JavaProgrammer` 也是如此,有意无意实现了新的接口,这也就是 `Go` 的接口设计不同于传统声明式接口设计的地方.

![go-oop-interface-type-myProgrammer-goProgrammer.png](../images/go-oop-interface-type-myProgrammer-goProgrammer.png)

现在我们改变一下 `MyProgrammer` 接口中的 `WriteHelloWord` 方法,返回类型由别名 `Code` 更改成原类型 `string`,再试一下实际效果如何.

由于 `Go` 是强类型语言,即使是别名和原类型也不是相同的,正如类型之间的转换都是强制的,没有隐式类型转换那样.

因此,可以预测的是,`WriteHelloWord` 接口方法前后不一致,是没有类型结构体满足新的接口方法的,此时编译器应该会报错.

![go-oop-interface-type-myProgrammer-fail.png](../images/go-oop-interface-type-myProgrammer-fail.png)

事实胜于雄辩,无论是 `GoProgrammer` 还是 `JavaProgrammer` 都没有实现 `MyProgrammer` ,因此是不能赋值给类型 `MyProgrammer` ,编译器确实报错了!

并不是所有长得像的都是兄弟,也不是长得不像的就不是兄弟.

```go
type Equaler interface {
    Equal(Equaler) bool
}
```
 
`Equaler` 接口定义了 `Equal` 方法,不同于传统的多态,`Go` 的类型检查更为严格,并不支持多态特性.

```go
type T int

func (t T) Equal(u T) bool { return t == u }
```

如果单单看 `Equal(u T) bool` 方法声明,放到其他主流的编程语言中这种情况可能是正确的,但是多态特性并不适合 `Go` 语言.

![go-oop-interface-type-equal-fail.png](../images/go-oop-interface-type-equal-fail.png)

不仅仅 ide 没有左侧可视化的箭头效果,硬生生的将类型声明成接口类型也会报错,说明的确没有实现接口.

透过现象看本质,`T.Equal` 的参数类型是`T` ,而不是字面上所需的类型`Equaler`,所以并没有实现 `Equaler` 接口中规定的 `Equal` 方法.

是不是很意外?

如果你已经看到了这里,相信你现在不仅基本理解了面向对象的三大特性,还知道了 `GO` 设计时的与众不同.

这种与众不同之处,不仅仅体现在面向对象中的类型和接口中,最基础的语法细节上无一不体现出设计者的匠心独运,正是这种创新也促进我们重新思考面向对象的本质,真的需要循规蹈矩按照现有的思路去设计新语言吗?

`Go` 语言的语法精简,设计简单优雅,抛弃了某些看起来比较高级但实际使用过程中可能会比较令人困惑的部分,对于这部分的舍弃,一定程度上简化了整体的设计.

另一方面,如果真的还需要这种实现时,就应该开发者手动实现,自己动手保证而不是编译器级别的控制.

控制权的转移意味着开发者承担了更多的责任,比如类间转换中没有显示类型转换和隐式类型转换之分,`Go` 仅仅支持显示类型转换,不会自动帮你隐式转换,也没有为了兼顾隐式类型的转换而引入的基本类型的包装类型,没有自动拆箱和自动装箱等复杂概念.

所以如果要实现 `Equal` 接口方法,那么就应该开发者自己保证严格实现,稍微修改下就能真正实现该方法.

```go
type T2 int

func (t T2) Equal(u Equaler) bool { return t == u.(T2) }
```

`Equal(Equaler) bool` 接口方法中的参数中要求 `Equaler` 接口,因此 `Equal(u Equaler) bool` 方法才是真正实现了接口方法.

![go-oop-interface-type-equal-pass.png](../images/go-oop-interface-type-equal-pass.png)

只有方法名称和签名完全一致才是实现了接口,否则看似实现实则是其他编程语言的逻辑,放到`Go` 语言中并没有实现接口.

但是不知道你是否发现,这种形式实现的接口方法和我们熟悉的面向接口编程还是有所不同,任何满足接口 `Equaler` 方法的类型都可以被传入到 `T2.Equal` 的参数,而我们的编译器却不会在编译时给出提示.

```go
type T3 int

func (t T3) Equal(u Equaler) bool { return t == u.(T3) }
```

仿造 `T2` 实现 `T3` 类型,同样也实现了 `Equaler` 接口所要求的 `Equal` 方法.

`T2` 和 `T3` 明显是不同的类型,编译期间 `T3` 是可以传给 `T2` 的,反之亦然, `T2` 也可以传给 `T3` .

![go-oop-interface-type-equal-error-pass.png](../images/go-oop-interface-type-equal-error-pass.png)

编译正常而运行出错意味着后期捕捉问题的难度加大了,个人比较习惯于编译期间报错而不是运行报错,`Go` 语言就是编译型语言为什么造成了编译期间无法捕捉错误而只能放到运行期间了?

![go-oop-interface-type-equal-error-panic.png](../images/go-oop-interface-type-equal-error-panic.png)

由此可见,`t == u.(T3)` 可能会抛出异常,异常机制也是编程语言通用的一种自我保护机制,`Go` 语言应该也有一套机制,后续再研究异常机制,暂时不涉及.

不过我们在这里确实看到了 `u.(T3)` 判断类型的局限性,想要确保程序良好运行,应该研究一下接口变量到底是什么以及如何判断类型和接口的关系.

编译期间的判断关系可以通过 ide 的智能提示也可以将类型声明给接口看看是否编译错误,但这些都是编译期间的判断,无法解决当前运行期间的错误.

```go
func TestEqualType(t *testing.T) {
    var t2 Equaler = new(T2)
    var t3 Equaler = new(T3)

    t.Logf("%[1]T %[1]v\n",t2)
    t.Logf("%[1]T %[1]v\n",t3)
    t.Logf("%[1]T %[1]v %v\n",t2,t2.Equal(t3))
}
```

`%T %V` 打印出接口变量的类型和值,从输出结果上看 `*polymorphism.T2 0xc0000921d0`,我们得知接口变量的类型其实就是实现了该接口的结构体类型,接口变量的值就是该结构体的值.

`t2` 和 `t3` 接口变量的类型因此是不同的,运行时也就自然报错了.

说完现象找原因.

`Go` 语言的接口并没有保证实现接口的类型具有多态性,仅仅是约束了统一的行为规范,`t2` 和 `t3` 都满足了 `Equal` 这种规范,所以对于接口的设计效果来说,已经达到目标了.

但是这种接口设计的理念和我们所熟悉的其他编程语言的多态性是不同的,`Go` 并没有多态正如没有继承特性一样.

```go
func TestInterfaceTypeDeduce(t *testing.T) {
    var t2 Equaler = new(T2)
    var t3 Equaler = new(T3)

    t.Logf("%[1]T %[1]v %[2]T %[2]v\n",t2,t2.(*T2))
    t.Logf("%[1]T %[1]v %[2]T %[2]v\n",t3,t3.(*T3))
}
```

![go-oop-interface-type-equal-type-deduce.png](../images/go-oop-interface-type-equal-type-deduce.png)

当 `t2.(*T2)` 或 `t3.(*T3)` 时,均正常工作,一旦 `t2.(*T3)` 则会抛出异常,因此需要特殊处理下这种情况.

根据实验结果得知,`t2.(*T2)` 的类型和值恰巧就是接口变量的类型和值,如果结构体类型不能转换成指定接口的话,则可能抛出异常.

因此,猜测这种形式的效果上类似于强制类型转换,将接口变量 `t2` 强制转换成结构体类型,动不动就报错或者说必须指定接口变量和结构体类型的前提,有点像其他编程语言的断言机制.

单独研究一下这种断言机制,按照 `Go` 语言函数设计的思想,这种可能会抛出异常的写法并不是设计者的问题,而是我们使用者的责任,属于使用不当,没有检查能否转换成功.

```go
v2,ok2 := t2.(*T2)
```

从实际运行的结果中可以看出,接口变量 `t2` 经过断言为 `*T2` 结构体类型后得到的变量和接口变量 `t2` 应该是一样的,因为他俩的类型和值完全一样.

当这种转换失败时,`ok` 的值是 `false` ,此时得到的转换结果就是 `nil` .

![go-oop-interface-type-type-deduce.png](../images/go-oop-interface-type-type-deduce.png)

接口既然是实现规范的方式,按照以往的编程经验给我们的最佳实践,我们知道接口最好尽可能的细化,最好一个接口中只有一个接口方法,这样的好处自然不必赘述.

有意思的是,`Go` 的接口还可以存在没有任何的接口方法,这种特殊的接口叫做空接口,无为而治,没有任何规范约束,这不就是老子口中的顺其自然,无为而治吗?

```go
type EmptyInterface interface {
}
```

道家的思想主要靠个人领悟,有点哲学的味道,这一点不像理科知识那样严谨,可以根据已知按照一定的逻辑推测出未知,甚至预言出超时代的新理论也不是没有可能的.

然而,道家说一生二,二生三,三生万物,这句话看似十分富有哲理性但是实际却很难操作,只讲了开头和结尾,并没有讲解如何生万物,忽略了过程,因为全靠个人领悟.

没有任何接口方法的空接口和一般接口之间是什么关系?空接口是一,是接口中最基础的存在,有一个接口的是二,有二就会有三,自然就会有千千万万的接口,从而构造出接口世界观.

```go
func TestEmptyInterfaceTypeDeduce(t *testing.T) {
    var _ Programmer = new(GoProgrammer)
    var _ EmptyInterface = new(GoProgrammer)
}
```

`GoProgrammer` 结构体类型不仅实现了 `Programmer` 接口,也实现空接口,至少编译级别没有报错.

但是,`Go` 语言的接口实现是严格实现,空接口没有接口,因此没有任何结构体都没有实现空接口,符合一贯的设计理念,并没有特殊处理成默认实现空接口.

![go-oop-interface-type-empty-interface-not-implement.png](../images/go-oop-interface-type-empty-interface-not-implement.png)

所以我困惑了,一方面,结构体类型实例对象可以赋值给空接口变量,而结构体类型却又没有实现空接口,这不是有种自相矛盾的地方吗?

明明没有实现空接口却没有赋值给空接口,难不成是为了弥补语言设计的不足?

因为 `Go` 语言不支持继承,自然没有其他编程语言中的基类概念,而实际工作中有时候确实需要一种通用的封装结构,继承不足,接口来凑?

所以设计出空接口这种特殊情况来弥补不足?

```go
func TestEmptyInterface(t *testing.T) {
    var _ Programmer = new(GoProgrammer)
    var _ EmptyInterface = new(GoProgrammer)
    var p EmptyInterface = new(GoProgrammer)

    v, ok := p.(GoProgrammer)
    t.Logf("%[1]T %[1]v %v\n", v, ok)
}
```

空接口的这种特殊性值得我们花时间去研究一下,任何结构体类型都可以赋值给空接口,那么此时的接口变量断言出结构体变量是否也有配套的特殊之处呢?

```go
func TestEmptyInterfaceTypeDeduce(t *testing.T) {
    var gpe EmptyInterface = new(GoProgrammer)

    v, ok := gpe.(Programmer)
    t.Logf("%[1]T %[1]v %v\n", v, ok)

    v, ok = gpe.(*GoProgrammer)
    t.Logf("%[1]T %[1]v %v\n", v, ok)

    switch v := gpe.(type) {
    case int:
        t.Log("int", v)
    case string:
        t.Log("string", v)
    case Programmer:
        t.Log("Programmer", v)
    case EmptyInterface:
        t.Log("EmptyInterface", v)
    default:
        t.Log("unknown", v)
    }
}
```

虽然接收的时候可以接收任何类型,但是实际使用过程中必须清楚知道具体类型才能调用实例化对象的方法,因而这种断言机制十分重要.

```go
func doSomething(p interface{}) {
    if i, ok := p.(int); ok {
        fmt.Println("int", i)
        return
    }
    if s, ok := p.(string); ok {
        fmt.Println("string", s)
        return
    }
    fmt.Println("unknown type", p)
}

func TestDoSomething(t *testing.T) {
    doSomething(10)
    doSomething("10")
    doSomething(10.0)
}
```

上述 `doSomething` 可以采用 `switch` 语句进行简化,如下:

```go
func doSomethingBySwitch(p interface{}) {
    switch v := p.(type) {
    case int:
        fmt.Println("int", v)
    case string:
        fmt.Println("string", v)
    default:
        fmt.Println("unknown type", v)
    }
}

func TestDoSomethingBySwitch(t *testing.T) {
    doSomethingBySwitch(10)
    doSomethingBySwitch("10")
    doSomethingBySwitch(10.0)
}
```


