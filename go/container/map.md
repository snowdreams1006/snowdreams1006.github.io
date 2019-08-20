# 字典映射

- go 语言仅支持封装,不支持继承和多态
- go 语言没有class,只有struct


结构的定义

```go
type TreeNode struct
Left,Right *TreeNode
Value int
```

不管指针还是实例,都是 `.`

```go
func TestCreatTreeNode(t *testing.T) {
	var root treeNode

	root = treeNode{value:3}
	root.left = &treeNode{}
	root.right = &treeNode{5,nil,nil}
	root.right.left = new(treeNode)
}
```

- 不论地址还是结构本身,一律使用 `.` 来访问成员

- 使用自定义工厂函数
- 注意返回了了局部变量的地址

> 结构创建在堆上还是栈上?java都是堆上(new垃圾回收),c++局部变量是栈立即销毁,返回时堆分配,手动释放.

不需要知道go

```go
func createTreeNode(val int) *treeNode {
	return &treeNode{value: val}
}

func TestConstructFn(t *testing.T) {
	root := createTreeNode(1)
	
	t.Log(root)
}
```
