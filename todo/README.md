# TODO清单

- [nodejs-操作文件系统读取写入文件](https://blog.csdn.net/songmaolin_csdn/article/details/52910771)
- [10分钟教你撸一个nodejs爬虫系统](https://www.jianshu.com/p/56ce4f3f0060?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)
- [NodeJs+Request+Cheerio 采集数据](https://www.cnblogs.com/zqzjs/p/5487348.html)
- [nodejs模拟登录-request模块](https://blog.csdn.net/zzwwjjdj1/article/details/77472398)
- [GitHub Wiki 页面的添加和设置](https://juejin.im/post/5a3216c8f265da43333e6b54)
- [Kingfisher](https://github.com/onevcat/Kingfisher)

```bash
$ npm version patch
```

```bash
$ git tag
```

```bash
$ git push origin v0.0.2
```

```bash
$ npm install -g cnpm --registry=https://registry.npm.taobao.org
```

> https://johnnyting.github.io/posts/%E4%BD%BF%E7%94%A8%E5%91%BD%E4%BB%A4%E5%BF%AB%E9%80%9F%E7%94%9F%E6%88%90readmegitignore%E6%96%87%E4%BB%B6/

```bash
readme
```

> https://github.com/kefranabg/readme-md-generator

- https://github.com/github/gitignore/
- http://www.gitignore.io/

```json
"engines": {
    "gitbook": ">=2.4.3"
  },
  "gitbook": {
    "properties": {
      "blogId": {
        "type": "string",
        "required": true,
        "description": "Openwrite blogId."
      },
      "name": {
        "type": "string",
        "required": true,
        "description": "Blog name."
      },
      "qrcode": {
        "type": "string",
        "required": true,
        "description": "Wechat qrcode."
      },
      "keyword": {
        "type": "string",
        "required": true,
        "description": "Wechat keyword."
      }
    }
  }
```

INFO  Install dependencies
npm WARN deprecated core-js@1.2.7: core-js@<2.6.8 is no longer maintained. Please, upgrade to core-js@3 or at least to actual version of core-js@2.
npm ERR! code EACCES
npm ERR! syscall open
npm ERR! path /Users/sunpo/.npm/_cacache/index-v5/51/d3/7697273802dffa158119427da833e251b88e0e9d4c73d8f5f964476884f4
npm ERR! errno -13
npm ERR! 
npm ERR! Your cache folder contains root-owned files, due to a bug in
npm ERR! previous versions of npm which has since been addressed.
npm ERR! 
npm ERR! To permanently fix this problem, please run:
npm ERR!   sudo chown -R 501:20 "/Users/sunpo/.npm"

npm ERR! A complete log of this run can be found in:
npm ERR!     /Users/sunpo/.npm/_logs/2019-10-09T01_40_58_136Z-debug.log
WARN  Failed to install dependencies. Please run 'npm install' manually!

sunpodeMacBook-Pro:hexo-plugin-readmore sunpo$ sudo chown -R 501:20 "/Users/sunpo/.npm"
Password:
sunpodeMacBook-Pro:hexo-plugin-readmore sunpo$ npm install
npm notice created a lockfile as package-lock.json. You should commit this file.
up to date in 1.429s
found 0 vulnerabilities
=======
---
title: Hello World
abbrlink: 16107
---

Welcome to [Hexo](https://hexo.io/)! This is your very first post. Check [documentation](https://hexo.io/docs/) for more info. If you get any problems when using Hexo, you can find the answer in [troubleshooting](https://hexo.io/docs/troubleshooting.html) or you can ask me on [GitHub](https://github.com/hexojs/hexo/issues).

## Reference

- [Hexo配置和部署](https://my.oschina.net/u/2935389/blog/754615)
- [hexo——轻量、简易、高逼格的博客](https://www.jianshu.com/p/1c888a6b8297?utm_source=oschina-app)
- [5分钟搞定个人博客-hexo](https://www.jianshu.com/p/390f202c5b0e)
- [hexo史上最全搭建教程](https://blog.csdn.net/sinat_37781304/article/details/82729029)
- [为Hexo添加Gitalk评论插件](https://segmentfault.com/a/1190000014085547)
- [Gitment/Gitalk自动初始化](https://madordie.github.io/post/blog-gitment-auto-setup/)
- [自动初始化 Gitalk 和 Gitment 评论](https://draveness.me/git-comments-initialize)
- [Hexo+NexT（六）：手把手教你编写一个Hexo过滤器插件](https://www.cnblogs.com/guide2it/p/11111715.html)
- [GitHub+Hexo搭建个人博客（四）Hexo高阶之第三方插件](https://www.jianshu.com/p/dda25ffcfd43)
- [搭建Hexo博客进阶篇--API和一些小部件（四）](https://segmentfault.com/a/1190000009478837)
- [Hexo高级教程之插件开发](https://blog.csdn.net/melordljm/article/details/51985157)
- [Hexo主题开发](https://www.cnblogs.com/yyhh/p/11058985.html?clicktime=1570634105&enterid=1570634105)
>>>>>>> 32dc4ab0f6b98922dcada02d9b6cd8da4bcb1935
>>>>>>> 


- [得到Go程序的汇编代码的方法](https://yq.aliyun.com/articles/684054)
- [使用Hugo搭建静态站点](https://tonybai.com/2015/09/23/intro-of-gohugo/)
- [TOML简介](https://blog.csdn.net/john_f_lau/article/details/55803069)
- [Hugo加入评论的功能](https://blog.csdn.net/anonymking/article/details/86370082)

# 错误管理

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

error vs panic

- 意料之中的:使用 error,如: 文件打不开
- 意料之外的:使用 panic,如: 数组越界

## Go 的错误机制

与其他主要的编程语言的差异:

- 没有异常机制
- error 类型实现了 error 接口
- 可以通过 errors.New 来快速创建错误实例

```go
type error interface{
    Error() string
}

errors.New("n must be in the range []")
```

panic

- panic 用于不可恢复的错误
- panic 退出前会执行defer指定的内容

panic vs os.Exit

- os.Exit 退出时不会调用 defer指定的函数
- os.Exit 退出时不输出当前调用栈信息

当心,recover 称为恶魔

- 形成僵尸服务进程,导致 health check 失效
- "Let it Crash" 往往是我们恢复不确定性错误的最好方式

https://golang.google.cn/ref/spec#Defer_statements

A "defer" statement invokes a function whose execution is deferred to the moment the surrounding function returns, either because the surrounding function executed a return statement, reached the end of its function body, or because the corresponding goroutine is 
panicking.

```
defer Stmt = "defer" Expression .
```

```go
func TestFuncWithoutDefer(t *testing.T) {
  // 「雪之梦技术驿站」: 正常顺序
  t.Log("「雪之梦技术驿站」: 正常顺序")

  // 1 2
  t.Log(1)
  t.Log(2)
}

func TestFuncWithDefer(t *testing.T) {
  // 「雪之梦技术驿站」: 正常顺序执行完毕后才执行 defer 代码
  t.Log(" 「雪之梦技术驿站」: 正常顺序执行完毕后才执行 defer 代码")

  // 2 1
  defer t.Log(1)
  t.Log(2)
}

func TestFuncWithMultipleDefer(t *testing.T) {
  // 「雪之梦技术驿站」: 猜测 defer 底层实现数据结构可能是栈,先进后出.
  t.Log(" 「雪之梦技术驿站」: 猜测 defer 底层实现数据结构可能是栈,先进后出.")

  // 3 2 1
  defer t.Log(1)
  defer t.Log(2)
  t.Log(3)
}

func TestFuncWithMultipleDeferOrder(t *testing.T) {
  // 「雪之梦技术驿站」: defer 底层实现数据结构类似于栈结构,依次倒叙执行多个 defer 语句
  t.Log(" 「雪之梦技术驿站」: defer 底层实现数据结构类似于栈结构,依次倒叙执行多个 defer 语句")

  // 2 3 1
  defer t.Log(1)
  t.Log(2)
  defer t.Log(3)
}

func TestFuncWithMultipleDeferAndReturn(t *testing.T) {
  // 「雪之梦技术驿站」: defer 延迟函数会在包围函数正常return之前逆序执行.
  t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数正常return之前逆序执行.")

  // 3 2 1
  defer t.Log(1)
  defer t.Log(2)
  t.Log(3)
  return
  t.Log(4)
}

func TestFuncWithMultipleDeferAndPanic(t *testing.T) {
  // 「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.
  t.Log(" 「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.")

  // 3 2 1
  defer t.Log(1)
  defer t.Log(2)
  t.Log(3)
  panic("「雪之梦技术驿站」: defer 延迟函数会在包围函数panic惊慌失措之前逆序执行.")
  t.Log(4)
}
```

The expression must be a function or method call; it cannot be parenthesized. Calls of built-in functions are restricted as for expression statements.

Each time a "defer" statement executes, the function value and parameters to the call are evaluated as usual and saved anew but the actual function is not invoked. Instead, deferred functions are invoked immediately before the surrounding function returns, in the reverse order they were deferred. That is, if the surrounding function returns through an explicit return statement, deferred functions are executed after any result parameters are set by that return statement but before the function returns to its caller. If a deferred function value evaluates to nil, execution panics when the function is invoked, not when the "defer" statement is executed.

