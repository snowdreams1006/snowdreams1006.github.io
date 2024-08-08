# 忽略文件

"并不是所有的牛奶都叫特仑苏",在**版本控制系统**中也有相似的表达,那就是"并不是所有的文件都需要提交".

有的是因为没必要提交,比如日志文件,系统缓存文件等,有的是因为不能提交,比如个人隐私文件,付费文档等.

正常来说,这些文件都是不应该被提交到版本库,倘若一不留神提交到版本库,要么泄露机密信息,要是造成经济损失,要么对团队其他人工作造成不便.

有鉴于此,我们应该寻求一种机制来规避事故的发生,在 `git` 版本控制系统中一般有三种不同的解决方案.

最常用也是最简单的当属 `.gitignore` 文件,不过先不要着急,我们先了解一下忽略原则和配置规则.

## 忽略文件的基本原则

- 忽略操作系统自动生成的文件,保持不同操作系统的纯粹性和整洁度.
- 忽略工具软件自动生成的文件,避免因个性化配置而产生的工作障碍.
- 忽略个人隐私配置文件,除非你愿意承担公开隐私所带来的潜在风险.

> 目标: 只提交必要文件,忽略无用文件,尽可能考虑多种情况,不给他人制造麻烦.

## 忽略文件的配置规则

一行记录代表一条规则,配置规则仅针对尚未被跟踪的文件清单.

```
# 忽略 `*.a` 文件
*.a
# 忽略 `*.A` 文件,但 `somefile.A` 除外.
*.A
!somefile.A

# 忽略 `*.b` 和 `*.B` 文件
*.[bB]
# 忽略 `*.c` 和 `*.C` 文件,但 `somefile.C` 除外.
*.[cC]
!somefile.C

# 只忽略 `somepath/` 目录(包括该目录下所有文件),但不忽略 `somepath` 文件
somepath/
# 只忽略 `somepath/` 一级子目录下 `*.txt`,但不忽略 `somepath/sub/*.txt` 文件
somepath/*.txt

# 忽略 `somepath` 文件和 `somepath` 目录
somepath
# 只忽略 `somepath` 文件,但不忽略 `somepath/` 目录
somepath
!somepath/

# 只忽略当前目录下的 `somepath` 文件和目录,但不忽略子目录的 `somepath`
/somepath
```

> 说明: `#` 开头表示注释,`!` 紧跟某规则之后表示增加例外情况

## 在线示例和帮助文档

提供两个不错的在线示例,可以参考下在什么场景应该忽略哪些文件以及如何编写忽略规则.

- [https://www.gitignore.io/](https://www.gitignore.io/)
- [https://github.com/github/gitignore](https://github.com/github/gitignore) 

> 运行 `git help ignore` 命令查看帮助文档

## 三种设置方式

`git` 设置忽略文件有三种方式,如下:

- 全局配置文件(`~/.gitignore`),执行 `git config --global core.excludesfile ~/.gitignore` 命令后适用于所有的版本库.
- 远程配置文件(`$PWD/.gitignore`),编辑 `.gitignore` 文件后适用于远程和本地版本库.
- 本地配置文件(`$PWD/.git/info/exlude`),编辑 `$PWD/.git/info/exlude` 文件后适用于本地版本库.

## 最常用方式

三种设置方式中,第二种最为常见,另外两种大致一样,重点在于配置文件如何编写.

### 创建 `.gitignore` 文件

参考在线示例以及基本语法编写自定义忽略规则

```
# General
.DS_Store
.AppleDouble
.LSOverride

# Windows thumbnail cache files
Thumbs.db
ehthumbs.db
ehthumbs_vista.db
```

### 提交 `.gitignore` 文件

忽略文件规则配置完毕后,需要将该文件**提交到版本库**,这样在其他电脑上也能应用相同的忽略规则.

```
# 添加 `.gitignore` 
git add .gitignore

# 提交 `.gitignore` 
git commit -m "add .gitignore"

# 上传 `.gitignore`
git push origin master
```

### 验证忽略效果

新建 `.gitignore` 文件中已忽略的文件,运行 `git status` 命令,如果提示 `working directory clean`,那么说明忽略文件的配置已经生效,如果工作区不干净,很遗憾,忽略文件配置可能并未生效,需要检查下哪里配置错了.

运行 `git check-ignore` 命令检查是哪个配置规则写错了,从而我们能够更正相应的配置规则.
