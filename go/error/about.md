# 错误管理

## 出入成双有始有终

## 懒人福音延迟函数

> 官方文档相关表述见 [Defer statements](https://golang.google.cn/ref/spec#Defer_statements) 

### 包围函数正要结束

### 当前协程惊慌失措

## 延迟函数应用场景

- Open/Close
- Lock/Unlock
- PrintHeader/PrintFooter

## 总结以及下节预告

### defer 调用

- 确保调用在函数结束时发生
- 参与在defer语言时计算
- defer列表为后进先出

## 何时使用 defer 调用