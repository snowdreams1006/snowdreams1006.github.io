# 异常管理

## 资源管理与出错处理

## defer 调用

- 确保调用在函数结束时发生
- 参与在defer语言时计算
- defer列表为后进先出

## 何时使用 defer 调用

- Open/Close
- Lock/Unlock
- PrintHeader/PrintFooter

## 错误处理二

- 如何实现统一的错误处理逻辑

## panic

- 停止当前函数执行
- 一直向上返回,执行每一层的 defer
- 如果没有遇见recover,程序退出

## recover

- 仅在 defer 调用中使用
- 获取 panic 的值
- 如果无法处理,可重新 panic
