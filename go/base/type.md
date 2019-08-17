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


