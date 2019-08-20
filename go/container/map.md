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

不需要知道go,垃圾回收

```go
func createTreeNode(val int) *treeNode {
	return &treeNode{value: val}
}

func TestConstructFn(t *testing.T) {
	root := createTreeNode(1)
	
	t.Log(root)
}
```

接收者

```go
func (node treeNode) print() {
	fmt.Println(node.value)
}
```

遍历

```go
func TestTreeNodeTraverse(t *testing.T) {
	var root treeNode

	root = treeNode{value: 3}
	root.left = &treeNode{}
	root.right = &treeNode{5, nil, nil}
	root.right.left = new(treeNode)

	root.print()
}
```

```go
func print(node treeNode) {
	fmt.Println(node.value)
}

func TestTreeNodeTraverseByNormalWay(t *testing.T) {
	var root treeNode

	root = treeNode{value: 3}
	root.left = &treeNode{}
	root.right = &treeNode{5, nil, nil}
	root.right.left = new(treeNode)

	print(root)
}
```

```go
func (node treeNode) setValue(value int) {
	node.value = value
}

func TestTreeNodeSetValue(t *testing.T){
	var root treeNode

	root = treeNode{value: 3}
	root.left = &treeNode{}
	root.right = &treeNode{5, nil, nil}
	root.right.left = new(treeNode)

	root.left.setValue(4)
	root.left.print()
}
```

```go
func (node *treeNode) setValue(value int) {
	node.value = value
}

func TestTreeNodeSetValue(t *testing.T){
	var root treeNode

	root = treeNode{value: 3}
	root.left = &treeNode{}
	root.right = &treeNode{5, nil, nil}
	root.right.left = new(treeNode)

	root.left.setValue(4)
	root.left.print()

	root.setValue(100)
	root.print()
}
```

- 显示定义和命名方法接收者
- nil 指针也可以调用方法

```go

func (node *treeNode) setValueWithNil(value int) {
	if node == nil{
		fmt.Println("Setting value to nil node")
		return
	}
	node.value = value
}

func TestTreeNodeSetValueWithNil(t *testing.T){
	var root treeNode

	root = treeNode{value: 3}
	root.left = &treeNode{}
	root.right = &treeNode{5, nil, nil}
	root.right.left = new(treeNode)

	var pRoot *treeNode
	pRoot.setValueWithNil(200)

	pRoot = &root
	pRoot.setValueWithNil(300)
	pRoot.print()
}
```


```go
func (node *treeNode) traverse() {
	if node == nil{
		return
	}

	node.left.traverse()
	node.print()
	node.right.traverse()
}

func TestTreeNodetraverse(t *testing.T) {
	var root treeNode

	root = treeNode{value: 3}
	root.left = &treeNode{}
	root.right = &treeNode{5, nil, nil}
	root.right.left = new(treeNode)
	root.left.right = createTreeNode(2)
	root.right.left.setValue(4)

	root.traverse()
}
```