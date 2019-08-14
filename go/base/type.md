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