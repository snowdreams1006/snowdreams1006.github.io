## 数组

数组和切片

- 容量是否可伸缩
- 是否可比较

```go
func TestMapWithFunValue(t *testing.T) {
	m := map[int]func(op int) int{}

	m[1] = func(op int) int {
		return op
	}
	m[2] = func(op int) int {
		return op * op
	}
	m[3] = func(op int) int {
		return op * op * op
	}

	// 1 4 27
	t.Log(m[1](1), m[2](2), m[3](3))
}
```

实现 set

没有 set,可以用 map[type]bool

```go
func TestMapForSet(t *testing.T) {
	mySet := map[int]bool{}

	mySet[1] = true

	n := 3

	if mySet[n] {
		t.Log("update", mySet[n])
	} else {
		t.Log("add", mySet[n])
	}

	delete(mySet, 1)
}
```

- 数量写在类型的前面

- `[...]` 自动计算数组大小

```go
func TestArray(t *testing.T) {
	var arr1 [3]int
	arr2 := [5]int{1, 2, 3, 4, 5}
	arr3 := [...]int{2, 4, 6, 8, 10}

	// [0 0 0] [1 2 3 4 5] [2 4 6 8 10]
	t.Log(arr1, arr2, arr3)

	var grid [3][4]int

	// [[0 0 0 0] [0 0 0 0] [0 0 0 0]]
	t.Log(grid)
}
```

- 数组的遍历

```go
func TestArrayTraverse(t *testing.T){
	arr := [...]int{2, 4, 6, 8, 10}

	for i := 0; i < len(arr); i++ {
		t.Log(arr[i])
	}

	for i := range arr {
		t.Log(arr[i])
	}

	for i, v := range arr {
		t.Log(i, v)
	}

	for _, v := range arr {
		t.Log(v)
	}
}
```

- 可通过下划线 `_` 忽略变量

```go
func TestSumForArray(t *testing.T) {
	arr := [...]int{2, 4, 6, 8, 10}

	sum := 0
	for _, v := range arr {
		sum += v
	}

	t.Log(sum)
}
```

- 只要索引 `i` ,可写成 `for i := range arr`

### 为什么用 `range`

- 意义明确,美观
- `c++` 没有类似能力,`java/python` 可以 `foreach value` 不能同时获取 `i,v`

### 数组是值类型

```go
func printArray(arr [5]int) {
	arr[0] = 666
	for i, v := range arr {
		fmt.Println(i, v)
	}
}

func TestPrintArray(t *testing.T){
	var arr1 [3]int
	arr2 := [5]int{1, 2, 3, 4, 5}
	arr3 := [...]int{2, 4, 6, 8, 10}

	// [0 0 0] [1 2 3 4 5] [2 4 6 8 10]
	t.Log(arr1, arr2, arr3)

	// cannot use arr1 (type [3]int) as type [5]int in argument to printArray
	//printArray(arr1)

	fmt.Println("printArray(arr2)")
	printArray(arr2)

	fmt.Println("printArray(arr3)")
	printArray(arr3)

	// [1 2 3 4 5] [2 4 6 8 10]
	t.Log(arr2,arr3)
}
```

- 值传递时可以传递指针

```go
func printArrayByPointer(arr *[5]int) {
	arr[0] = 666
	for i, v := range arr {
		fmt.Println(i, v)
	}
}

func TestPrintArrayByPointer(t *testing.T){
	var arr1 [3]int
	arr2 := [5]int{1, 2, 3, 4, 5}
	arr3 := [...]int{2, 4, 6, 8, 10}

	// [0 0 0] [1 2 3 4 5] [2 4 6 8 10]
	t.Log(arr1, arr2, arr3)

	fmt.Println("printArrayByPointer(arr2)")
	printArrayByPointer(&arr2)

	fmt.Println("printArrayByPointer(arr3)")
	printArrayByPointer(&arr3)

	// [666 2 3 4 5] [666 4 6 8 10]
	t.Log(arr2,arr3)
}
```

这样也比较麻烦,还有知道数组的个数,解决值传递的话,还要加指针.

- `Go` 语言中一般不直接使用数组,使用的是切片

## 切片 `slice`

- `[ )` 左闭右开区间,和其他编程语言一致

```go

func TestSlice(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	s := arr[2:6]

	// [0 1 2 3 4 5 6 7 8 9] [2 3 4 5]
	t.Log(arr, s)
}
```

`slice` 是对数组的一个视图


```go
func TestSlice(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}

	// arr[2:6] =  [2 3 4 5]
	t.Log("arr[2:6] = ", arr[2:6])
	// arr[:6] =  [0 1 2 3 4 5]
	t.Log("arr[:6] = ", arr[:6])
	// arr[2:] =  [2 3 4 5 6 7 8 9]
	t.Log("arr[2:] = ", arr[2:])
	// arr[:] =  [0 1 2 3 4 5 6 7 8 9]
	t.Log("arr[:] = ", arr[:])
}
```

```go
func TestUpdateSlice(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}

	s1 := arr[2:6]
	// s1 =  [2 3 4 5]
	t.Log("s1 = ", s1)

	s2 := arr[:6]
	// s2 =  [0 1 2 3 4 5]
	t.Log("s2 = ", s2)

	updateSlice(s1)
	// s1 =  [666 3 4 5]
	t.Log("s1 = ", s1)
	// arr =  [0 1 666 3 4 5 6 7 8 9]
	t.Log("arr = ", arr)

	updateSlice(s2)
	// s2 =  [666 1 666 3 4 5]
	t.Log("s2 = ", s2)
	// arr =  [666 1 666 3 4 5 6 7 8 9]
	t.Log("arr = ", arr)
}
```

因此将数组变成切片就可以修改原来数组的元素了!

`slice` 本身没有数据,是对底层 `array` 的一个 `view`

- `slice` 可以继续`Reslice`

```go
func TestReSlice(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}

	s1 := arr[2:6]
	// s1 =  [2 3 4 5]
	t.Log("s1 = ", s1)

	s1 = s1[2:]
	// s1 =  [4 5]
	t.Log("s1 = ", s1)

	s1 = s1[:6]
	// s1 =  [4 5 6 7 8 9]
	t.Log("s1 = ", s1)
}
```

- `slice` 的扩展

```go
func TestSliceOutOfBound(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7}

	s1 := arr[2:6]
	// s1 =  [2 3 4 5]
	t.Log("s1 = ", s1)

	s2 := s1[3:5]
	// s2 =  [5 6]
	t.Log("s2 = ", s2)
}
```

- `slice` 可以向后扩展,不可以向前扩展

- `s[i]` 不可以超越`len(s)`,向后扩展不可以超越底层数组 `cap(s)`

```go
func TestSliceDetail(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7}
	// arr = [0 1 2 3 4 5 6 7], len(arr) = 8, cap(arr) = 8
	t.Logf("arr = %v, len(arr) = %d, cap(arr) = %d", arr,len(arr),cap(arr))

	s1 := arr[2:6]
	// s1 = [2 3 4 5], len(s1) = 4, cap(s1) = 6
	t.Logf("s1 = %v, len(s1) = %d, cap(s1) = %d", s1,len(s1),cap(s1))

	s2 := s1[3:5]
	// s2 = [5 6], len(s2) = 2, cap(s2) = 3
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2,len(s2),cap(s2))
}
```


```go
func TestSliceDetail(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7}
	// arr = [0 1 2 3 4 5 6 7], len(arr) = 8, cap(arr) = 8
	t.Logf("arr = %v, len(arr) = %d, cap(arr) = %d", arr,len(arr),cap(arr))

	s1 := arr[2:6]
	// s1 = [2 3 4 5], len(s1) = 4, cap(s1) = 6
	t.Logf("s1 = %v, len(s1) = %d, cap(s1) = %d", s1,len(s1),cap(s1))

	s2 := s1[3:5]
	// s2 = [5 6], len(s2) = 2, cap(s2) = 3
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2,len(s2),cap(s2))

	// slice bounds out of range
	//t.Log(s1[3:7])
}
```

## 添加元素

```go
func TestSliceAppend(t *testing.T) {
	arr := [...]int{0, 1, 2, 3, 4, 5, 6, 7}
	// arr = [0 1 2 3 4 5 6 7], len(arr) = 8, cap(arr) = 8
	t.Logf("arr = %v, len(arr) = %d, cap(arr) = %d", arr, len(arr), cap(arr))

	s1 := arr[2:6]
	// s1 = [2 3 4 5], len(s1) = 4, cap(s1) = 6
	t.Logf("s1 = %v, len(s1) = %d, cap(s1) = %d", s1, len(s1), cap(s1))

	s2 := s1[3:5]
	// s2 = [5 6], len(s2) = 2, cap(s2) = 3
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))

	s3 := append(s2, 10)
	// s3 = [5 6 10], len(s3) = 3, cap(s3) = 3
	t.Logf("s3 = %v, len(s3) = %d, cap(s3) = %d", s3, len(s3), cap(s3))

	s4 := append(s3, 11)
	// s4 = [5 6 10 11], len(s4) = 4, cap(s4) = 6
	t.Logf("s4 = %v, len(s4) = %d, cap(s4) = %d", s4, len(s4), cap(s4))

	s5 := append(s4, 12)
	// s5 = [5 6 10 11 12], len(s5) = 5, cap(s5) = 6
	t.Logf("s5 = %v, len(s5) = %d, cap(s5) = %d", s5, len(s5), cap(s5))

	// arr = [0 1 2 3 4 5 6 10], len(arr) = 8, cap(arr) = 8
	t.Logf("arr = %v, len(arr) = %d, cap(arr) = %d", arr, len(arr), cap(arr))
}
```

- 添加元素时,如果超过 `cap`,系统会重新分配更大的底层数组

- 由于值传递的关系,必须接收 `append` 的返回值

- `s = append(s,val)`

- 直接创建切片 `slice`

```go
func TestNewSlice(t *testing.T) {
	var s []int
	// []
	t.Log(s)

	for i := 0; i < 10; i++ {
		s = append(s, i)
	}

	// [0 1 2 3 4 5 6 7 8 9]
	t.Log(s)
}
```

```go
func printSlice(s []int) {
	fmt.Printf("len(s) = %d, cap(s) = %d\n", len(s), cap(s))
}

func TestSliceAutoLonger(t *testing.T) {
	var s []int
	// []
	t.Log(s)

	for i := 0; i < 100; i++ {
		printSlice(s)

		s = append(s, i)
	}

	// [0 1 2 3 ...,98,99]
	t.Log(s)
}
```

初始化

```go
func TestNewSliceInitialValue(t *testing.T) {
	s := []int{1,3,5,7,9}
	
	// s = [1 3 5 7 9], len(s) = 5, cap(s) = 5
	t.Logf("s = %v, len(s) = %d, cap(s) = %d", s, len(s), cap(s))
}
```

```go
func TestNewSliceInitialLength(t *testing.T) {
	s := make([]int,10)

	// s = [0 0 0 0 0 0 0 0 0 0], len(s) = 10, cap(s) = 10
	t.Logf("s = %v, len(s) = %d, cap(s) = %d", s, len(s), cap(s))
}
```

```go
func TestNewSliceInitialLengthAndCapacity(t *testing.T) {
	s := make([]int, 10, 32)

	// s = [0 0 0 0 0 0 0 0 0 0], len(s) = 10, cap(s) = 32
	t.Logf("s = %v, len(s) = %d, cap(s) = %d", s, len(s), cap(s))
}
```

拷贝

```go
func TestCopySlice(t *testing.T) {
	s1 := []int{1, 3, 5, 7, 9}
	s2 := make([]int, 10, 32)

	copy(s2,s1)

	// s2 = [1 3 5 7 9 0 0 0 0 0], len(s2) = 10, cap(s2) = 32
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))
}
```

删除

```go
func TestDeleteSlice(t *testing.T) {
	s1 := []int{1, 3, 5, 7, 9}
	s2 := make([]int, 10, 32)

	copy(s2,s1)

	// s2 = [1 3 5 7 9 0 0 0 0 0], len(s2) = 10, cap(s2) = 32
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))

	s2 = append(s2[:3],s2[4:]...)

	// s2 = [1 3 5 9 0 0 0 0 0], len(s2) = 9, cap(s2) = 32
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))
}
```

头尾删除

```go
func TestPopSlice(t *testing.T) {
	s1 := []int{1, 3, 5, 7, 9}
	s2 := make([]int, 10, 32)

	copy(s2,s1)

	// s2 = [1 3 5 7 9 0 0 0 0 0], len(s2) = 10, cap(s2) = 32
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))

	front := s2[0]
	s2 = s2[1:]

	// front = 1
	t.Logf("front = %v", front)
	// s2 = [3 5 7 9 0 0 0 0 0], len(s2) = 9, cap(s2) = 31
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))

	tail := s2[len(s2)-1]
	s2 = s2[:len(s2)-1]

	// tail = 0
	t.Logf("tail = %v", tail)
	// s2 = [3 5 7 9 0 0 0 0], len(s2) = 8, cap(s2) = 31
	t.Logf("s2 = %v, len(s2) = %d, cap(s2) = %d", s2, len(s2), cap(s2))
}
```

map

```go
func TestMap(t *testing.T) {
	m := map[string]string{
		"name": "snowdreams1006",
		"site": "https://snowdreams1006.github.io",
	}
	
	// map[name:snowdreams1006 site:https://snowdreams1006.github.io]
	t.Log(m)
}
```

map[k]v,map[k1]map[k2]v

```go
func TestMapByMake(t *testing.T) {
	// empty map
	m1 := make(map[string]int)

	// map[] false
	t.Log(m1, m1 == nil)

	// nil
	var m2 map[string]int

	// map[] true
	t.Log(m2, m2 == nil)
}
```

遍历,`hashMap`

```go
func TestMapTraverse(t *testing.T) {
	m := map[string]string{
		"name": "snowdreams1006",
		"site": "https://snowdreams1006.github.io",
	}

	// map[name:snowdreams1006 site:https://snowdreams1006.github.io]
	t.Log(m)

	for k, v := range m {
		t.Log(k, v)
	}

	t.Log()

	for k := range m {
		t.Log(k)
	}

	t.Log()
	
	for _, v := range m {
		t.Log(v)
	}
}
```

获取

```go
func TestMapGetItem(t *testing.T) {
	m := map[string]string{
		"name": "snowdreams1006",
		"site": "https://snowdreams1006.github.io",
	}

	// map[name:snowdreams1006 site:https://snowdreams1006.github.io]
	t.Log(m)

	name := m["name"]

	// snowdreams1006
	t.Log(name)

	author := m["author"]

	// zero value is empty
	t.Log(author)
}
```

删除

```go
func TestMapDeleteItem(t *testing.T) {
	m := map[string]string{
		"name": "snowdreams1006",
		"site": "https://snowdreams1006.github.io",
	}

	// map[name:snowdreams1006 site:https://snowdreams1006.github.io]
	t.Log(m)

	delete(m,"name")

	// map[site:https://snowdreams1006.github.io]
	t.Log(m)

	delete(m,"id")

	// map[site:https://snowdreams1006.github.io]
	t.Log(m)
}
```

`map` 的操作

- 创建 : `make map[string]int`
- 获取元素: `m[k]`
- `key` 不存在时,获取value类型的初始值
- 用 `value,ok := m[k]` 来判断是否存在 `key`
- 用 `delete` 删除一个元素
- 用 `range` 遍历 `key`,或者遍历 `key,value` 键值对
- 不保证遍历顺序,如需排序,需手动对 `key` 排序
- 用 `len(m)` 获得元素的个数

`map` 的 `key`

- `map` 使用哈希表,必须可以比较相等
- 除了 `slice`,`map`,`func` 的内建类型都可以作为 `key`
- `struc` 类型不包括上述字段,也可以作为 `key`

## 举个例子

寻找最长不含有重复字符的子串

> [https://leetcode.com/problems/longest-substring-without-repeating-characters/](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

```go
func lengthOfLongestSubstring(s string) int {
	lastOccurred := make(map[byte]int)
	start, maxLength := 0, 0

	for i, ch := range []byte(s) {
		if lastI, ok := lastOccurred[ch]; ok && lastI >= start {
			start = lastI + 1
		}
		if i-start+1 > maxLength {
			maxLength = i - start + 1
		}
		lastOccurred[ch] = i
	}

	return maxLength
}

func TestLengthOfLongestSubstring(t *testing.T) {
	// 3 1 3 0 1 7
	t.Log(
		lengthOfLongestSubstring("abcabcbb"),
		lengthOfLongestSubstring("bbbbb"),
		lengthOfLongestSubstring("pwwkew"),
		lengthOfLongestSubstring(""),
		lengthOfLongestSubstring("a"),
		lengthOfLongestSubstring("abcdefg"),
	)
}
```

```go
func TestString(t *testing.T) {
	s := "hello,雪之梦技术驿站"

	//  hello,雪之梦技术驿站 27
	t.Log(s,len(s))

	// 68 65 6C 6C 6F 2C E9 9B AA E4 B9 8B E6 A2 A6 E6 8A 80 E6 9C AF E9 A9 BF E7 AB 99 
	for _,b := range []byte(s){
		fmt.Printf("%X ",b)
	}
	fmt.Println()
}
```

```go

func TestString2Rune(t *testing.T) {
	s := "hello,雪之梦技术驿站"

	//  hello,雪之梦技术驿站 27
	t.Log(s, len(s))

	// 68 65 6C 6C 6F 2C E9 9B AA E4 B9 8B E6 A2 A6 E6 8A 80 E6 9C AF E9 A9 BF E7 AB 99
	for _, b := range []byte(s) {
		fmt.Printf("%X ", b)
	}
	fmt.Println()

	// ch is rune,utf-8 解码再转 unicode 编码
	for i, ch := range s {
		fmt.Printf("(%d %X) ", i, ch)
	}
	fmt.Println()

	// 13
	t.Log(utf8.RuneCountInString(s))

	bytes := []byte(s)

	// h e l l o , 雪 之 梦 技 术 驿 站
	for len(bytes) > 0 {
		ch, size := utf8.DecodeRune(bytes)
		bytes = bytes[size:]

		fmt.Printf("%c ", ch)
	}
	fmt.Println()

	// (0 h) (1 e) (2 l) (3 l) (4 o) (5 ,) (6 雪) (7 之) (8 梦) (9 技) (10 术) (11 驿) (12 站) 
	for i, ch := range []rune(s) {
		fmt.Printf("(%d %c) ", i, ch)
	}
	fmt.Println()
}
```

- 使用`range` 遍历 `pos,rune` 对
- `utf8.RuneCountInString(s)` 字符数,`len(s)` 字节数
- `[]byte(s)` 获得字节

```go
func lengthOfLongestSubstringInternationalVersion(s string) int {
	lastOccurred := make(map[rune]int)
	start, maxLength := 0, 0

	for i, ch := range []rune(s) {
		if lastI, ok := lastOccurred[ch]; ok && lastI >= start {
			start = lastI + 1
		}
		if i-start+1 > maxLength {
			maxLength = i - start + 1
		}
		lastOccurred[ch] = i
	}

	return maxLength
}

func TestLengthOfLongestSubstringInternationalVersion(t *testing.T) {
	// 3 1 3 0 1 7 7 2 8
	t.Log(
		lengthOfLongestSubstringInternationalVersion("abcabcbb"),
		lengthOfLongestSubstringInternationalVersion("bbbbb"),
		lengthOfLongestSubstringInternationalVersion("pwwkew"),
		lengthOfLongestSubstringInternationalVersion(""),
		lengthOfLongestSubstringInternationalVersion("a"),
		lengthOfLongestSubstringInternationalVersion("abcdefg"),
		lengthOfLongestSubstringInternationalVersion("雪之梦技术驿站"),
		lengthOfLongestSubstringInternationalVersion("一零零六"),
		lengthOfLongestSubstringInternationalVersion("黑化肥挥发发灰会花飞灰化肥挥发发黑会飞花"),
	)
}
```
