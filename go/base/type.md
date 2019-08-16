

# 数据类型

- 布尔类型

`bool`

- 整数类型
	* 有符号整数
		`int` ,`int8` ,`int16` ,`int32` ,`int64` 

	* 无符号整数
		`uint` ,`uint8` ,`uint16` ,`uint32` ,`uint64` ,`uintptr` 

- 字符类型

`string` 

- 浮点类型

`float32` ,`float64`

- 复数类型

`complex64` ,`complex128`

- 特殊类型


- `bool` ,`string`
- `(u)int` ,`(u)int8` , `(u)int16`, `(u)int32`,`(u)int64`,`uintptr`
- `byte(uint8)` ,`rune(int32)`
- `float32` ,`float64` ,`complex64` ,`complex128`

> `rune` 是 `char` 类型,`4` 字节

## 复数回顾

> `i = 根号-1`,`i` 是想象的 `imagine`

`3+4i`,实部`3`,虚部`4`

i^2 = -1,i^3 =-i,i^4=1

e^(iq) = consq+isinq

最美公式

```go
func TestComplex(t *testing.T) {
	c := 3 + 4i

	// 5
	t.Log(cmplx.Abs(c))
}

func TestEuler(t *testing.T) {
	// (0+1.2246467991473515e-16i)
	t.Log(cmplx.Pow(math.E, 1i*math.Pi) + 1)

	// (0+1.2246467991473515e-16i)
	t.Log(cmplx.Exp(1i*math.Pi) + 1)
}
```


## 类型转换是强制的

```go
func TestExplicitTypeConvert(t *testing.T) {
	var a, b int = 3, 4
	var c int
	c = int(math.Sqrt(float64(a*a + b*b)))

	// 3 4 5
	t.Log(a, b, c)
}
```

- 不允许隐式类型转换

```go
func TestImplicit(t *testing.T) {
	var a int = 1
	var b int64

	// b = a --> cannot use a (type int) as type int64 in assignment
	b = int64(a)

	t.Log(a, b)
}
```

> cannot use a (type int) as type int64 in assignment

- 别名和原类型也不能进行隐式类型转换

```go
type MyInt64 int64

func TestImplicitTypeConvert(t *testing.T) {
	var a int = 1
	var b int64

	b = int64(a)
	t.Log(a, b)

	var c MyInt64

	// c = b --> cannot use b (type int64) as type MyInt64 in assignment
	c = MyInt64(b)

	t.Log(b,c)
}
```

## 预定义值

- `math.MaxInt64`
- `math.MaxFloat64`
- `math.MaxUint32`

## 指针类型

- 不支持指针运算

```go
func TestPointer(t *testing.T) {
	a := 1
	aPoi := &a

	// aPoi = aPoi + 1 --> invalid operation: aPoi + 1 (mismatched types *int and int)

	t.Log(a, aPoi)
	t.Logf("%T %T", a, aPoi)
}
```


- `string` 是值类型,默认初始化值是 ` `(空字符串),而不是 `nil`

```go
func TestString(t *testing.T){
	var s string
	t.Log(len(s))

	if s == "" {
		t.Log("空字符串",s)
	}else{
		t.Log("非空字符串",s)
	}
}
```

## 总结

- 不支持任何形式的隐式类型转换,包括别名到原类型的隐式转换
- 支持指针类型,但指针不支持任何形式的计算.
- 字符串是值类型,默认初始化零值是空字符串而不是空.

## 变量要点定义回顾

- 变量类型写在变量名之后
- 编译器可以推测变量类型
- 没有 `char`,只有 `runne`
- 原生支持复数类型

## 算术运算符

```go
func TestArithmeticOperator(t *testing.T) {
	a := 0
	// 0
	t.Log(a)

	a = a + 1
	// 1
	t.Log(a)

	a = a * 2
	// 2
	t.Log(a)

	a = a % 2
	// 0
	t.Log(a)

	a++
	// 1
	t.Log(a)
}
```

> `Go` 没有前置 `++` 或 `--`

## 比较运算符

```go
func TestComparisonOperator(t *testing.T) {
	a, b := 0, 1
	t.Log(a, b)

	// false true true
	t.Log(a > b, a < b, a != b)
}
```

`==` 运算符比较数组

其它编程语言中数组一般都是引用类型,因为比较数组默认比较的是地址,然而 `Go` 
语言的数组是可以比较的,满足下列条件就可以进行比较.

- 相同维数且含有相同个数元素的数组才可以进行比较
- 每个元素都相同的才相等

```go
func TestCompareArray(t *testing.T) {
	a := [...]int{1, 2, 3}
	//b := [...]int{2, 4}
	c := [...]int{1, 2, 3}
	d := [...]int{1, 2, 4}

	// a == b --> invalid operation: a == b (mismatched types [3]int and [2]int)
	//t.Log(a == b)
	t.Log(b)
	t.Log(a == c)
	t.Log(a == d)
}
```

## 逻辑运算符

```go
func TestLogicalOperator(t *testing.T) {
	a, b := true, false
	t.Log(a, b)

	// false true false true
	t.Log(a&&b,a||b,!a,!b)
}
```

## 位运算符

```go
func TestBitOperator(t *testing.T) {
	a, b := 1, 2
	t.Log(a, b)

	// 0 3 3
	t.Log(a&b, a|b, a^b)

	// 2 1
	t.Log(a<<1, b>>1)
}
```
`&^` 按位清零运算符

右边操作位数为 `1` 时,左边操作为不论是 `1` 还是 `0` ,结果均为 `0`;
右边操作位数为 `0` 时,结果同左边操作位数.

```go
func TestClearZeroOperator(t *testing.T) {
	// 0 0 1 0
	t.Log(1&^1, 0&^1, 1&^0, 0&^1)
}
```

实际示例:

```go
func TestClearZeroOperator(t *testing.T) {
	const (
		Readable = 1 << iota
		Writing
		Executable
	)
	// 0001 0010 0100 即 1 2 4
	t.Log(Readable, Writing, Executable)

	// 0111 即 7,表示可读,可写,可执行
	accessCode := 7
	t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)

	// 0111 &^ 0001 = 0110 即清除可读权限
	accessCode = accessCode &^ Readable
	t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)

	// 0110 &^ 0010 = 0100
	accessCode = accessCode &^ Writing
	t.Log(accessCode&Readable == Readable, accessCode&Writing == Writing, accessCode&Executable == Executable)
}
```

## 运算符总结

- 没有前置自增或自减运算符
- 数组一定条件下可以直接比较,基于值比较而不是引用比较
- 特有的按位清零运算符

## 循环

- `for` 的条件里不需要括号

```go
func TestForLoop(t *testing.T) {
	sum := 0
	for i := 1; i <= 100; i++ {
		sum += i
	}
	// 1+2+3+...+99+100=5050
	t.Log(sum)
}
```

- 仅支持 `for` 循环

```go
func TestLoop(t *testing.T) {
	for i := 0; i < 10; i++ {
		t.Log(i)
	}
}
```

> 和其他编程语言相比,没有 `()` 包裹循环条件 

- 变相支持 `while` 循环

```go
func TestWhileLoop(t *testing.T) {
	i := 0
	for i < 5 {
		i++
		t.Log(i)
	}
}
```

## 条件

- `if` 的条件里可以赋值
- `if` 的条件里赋值的变量作用域就在这个 `if` 语句内

```go
func TestIfConditionMultiReturnValueShorter(t *testing.T) {
	const filename = "test.txt"
	if content, err := ioutil.ReadFile(filename); err != nil {
		t.Log(err)
	} else {
		t.Logf("%s\n", content)
	}
}
```

- 条件表达式是布尔类型,不需要 `()`

```go
func TestIfCondition(t *testing.T) {
	for i := 0; i < 10; i++ {
		if i%2 == 0{
			t.Log(i)
		}
	}
}
```

- 支持变量赋值

```go
func TestIfCondition(t *testing.T) {
	if res, err := 1, 0; err == 0 {
		t.Log("success", res)
	} else {
		t.Log("fail", err)
	}
}
```

### `switch` 条件

- `switch` 会自动 `break`,除非使用 `fallthrough`

```go
func evalBySwitchOperator(a, b int, op string) int {
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
		panic("unsupported operator:" + op)
	}
	return result
}

func TestEvalBySwitchOperator(t *testing.T) {
	// 3
	t.Log(evalBySwitchOperator(1, 2, "+"))
	// -1
	t.Log(evalBySwitchOperator(1, 2, "-"))
	// 2
	t.Log(evalBySwitchOperator(1, 2, "*"))
	// 0
	t.Log(evalBySwitchOperator(1, 2, "/"))
	// unsupported operator:% [recovered]
	//t.Log(evalBySwitchOperator(1, 2, "%"))
}
```

```go
func gradeBySwitchOperator(score int) string {
	result := ""
	switch {
	case score < 0 || score > 100:
		panic(fmt.Sprintf("Wrong score: %d", score))
	case score < 60:
		result = "F"
	case score < 80:
		result = "C"
	case score < 90:
		result = "B"
	case score <= 100:
		result = "A"
	}
	return result
}

func TestGradeBySwitchOperator(t *testing.T){
	// F F C C B B A A
	t.Log(
		gradeBySwitchOperator(0),
		gradeBySwitchOperator(59),
		gradeBySwitchOperator(60),
		gradeBySwitchOperator(79),
		gradeBySwitchOperator(80),
		gradeBySwitchOperator(89),
		gradeBySwitchOperator(99),
		gradeBySwitchOperator(100),
		//gradeBySwitchOperator(1000),
	)
}
```

与其他主要编程语言的差异

- 条件表达式不限制为常量或整数


```go
func TestSwitchCondition(t *testing.T) {
	switch os := runtime.GOOS; os {
	case "darwin":
		t.Log("Mac")
	case "linux":
		t.Log("Linux")
	case "windows":
		t.Log("Windows")
	default:
		t.Log(os)
	}
}
```

- 单个 `case` 中,可以出现多个结果选项,使用逗号 `,` 分割

```go
func TestSwitchCondition2(t *testing.T) {
	for i := 0; i < 10; i++ {
		switch i {
		case 0, 2, 4, 6, 8, 10:
			t.Log("Even", i)
		case 1, 3, 5, 7, 9:
			t.Log("odd", i)
		default:
			t.Log("default", i)
		}
	}
}
```

- 与 `C` 语言等规则相反,`Go` 语言不需要用 `break` 来明确退出一个 `case`


- 可以不设定 `switch` 之后的条件表达式,此种情况下,整个 `switch` 结构与多个 `if else` 的逻辑作用相同

```go
func TestSwitchCaseCondition(t *testing.T) {
	for i := 0; i < 10; i++ {
		switch {
		case i%2 == 0:
			t.Log("Even", i)
		case i%2 == 1:
			t.Log("odd", i)
		default:
			t.Log("default", i)
		}
	}
}
```

## 流程控制总结

`switch` 条件表达式和 `if` 表达式一样,也支持变量赋值,更强大方便的 `switch`