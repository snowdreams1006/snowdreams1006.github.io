## 数组

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