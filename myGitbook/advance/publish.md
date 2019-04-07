# 发布电子书

> 语法格式: gitbook build [book] [output]

默认情况下,`gitbook` 输出方式是静态网站,其实 `gitbook` 的输出方式有三种: `website`, `json`,和 `ebook`.

示例:

```
# 默认输出格式: `website`
$ gitbook build --format=website

# 更改输出格式: `json`
$ gitbook build --format=json

# 更改输出格式: `ebook`
$ gitbook build --format=ebook
```

> 以上命令将源码内容单独输出到相应文件中,下面介绍直接生成单个文件的方法.
