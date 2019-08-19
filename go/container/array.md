# 数组切片

字符串

- string 是数据类型,不是引用或指针类型
- string 是只读的 byte slice,len 函数可以返回它所包含的 byte 数
- string 的 byte 数组可以存放任何数组

```go
func TestString(t *testing.T) {
    var s string

    // s = ,len(s) =  0
    t.Logf("s = %v,len(s) =  %d", s, len(s))

    s = "hello"

    // s = hello,len(s) =  5
    t.Logf("s = %v,len(s) =  %d", s, len(s))

    s = "\xE4\xB8\xA5"

    // s = 严,len(s) =  3
    t.Logf("s = %v,len(s) =  %d", s, len(s))

    s = "\xE444\xB888\xA555"

    // s = �44�88�55,len(s) =  9
    t.Logf("s = %v,len(s) =  %d", s, len(s))
}
```

unicode utf8

- unicode 是一种字符集(code point)
- utf8 是 unicode 的存储实现(转换为字节序列的规则)

```go
func TestStringCodePoint(t *testing.T) {
    var s string

    // s = ,len(s) =  0
    t.Logf("s = %v,len(s) =  %d", s, len(s))

    s = "hello"

    // s = hello,len(s) =  5
    t.Logf("s = %v,len(s) =  %d", s, len(s))

    s = "中"

    // s = 中,len(s) =  3
    t.Logf("s = %v,len(s) =  %d", s, len(s))

    //s = e4b8ad,len(s) =  3
    t.Logf("s = %x,len(s) =  %d", s, len(s))

    ch := []rune(s)

    // s = [4e2d],len(s) =  1
    t.Logf("ch = %x,len(ch) =  %d", ch, len(ch))
}
```

```go
func TestString2Rune(t *testing.T) {
    s := "中华人民共和国"

    for _, c := range s {
        t.Logf("%[1]c %[1]d %[1]x", c)
    }
}
```

常用字符串函数

- strings 包

```go
func TestStrings(t *testing.T) {
    s := "A,B,C"

    parts := strings.Split(s,",")
    for _, part := range parts {
        t.Log(part)
    }

    newStr := strings.Join(parts,"-")

    t.Log(newStr)
}
```

- strconv 包

```go
func TestStrconv(t *testing.T) {

    s := strconv.Itoa(10)

    // string 10
    t.Logf("%[1]T %[1]v", s)

    // int 10
    if i, err := strconv.Atoi("10"); err == nil {
        t.Logf("%[1]T %[1]v", i)
    }
}
```
