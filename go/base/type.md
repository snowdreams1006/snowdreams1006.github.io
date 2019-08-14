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

`byte(uint8)` ,`rune(int32)`


## 类型转换

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


