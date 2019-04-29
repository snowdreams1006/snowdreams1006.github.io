# git bash 常用命令

众所周知,现实世界和计算机世界是不同的,但是计算机作为人类对现实世界的抽象模拟,在一定程度上,具备了现实世界的基本特征,本文将以哲学角度对比分析现实世界和计算机世界,试图以浅显易懂的方式感受现实世界和计算机世界的联系.

首先请先回顾一下哲学的基本问题问题: 我是谁,我在哪以及我要干什么?

接下来我们逐步探讨下两个世界的关联,顺便学习下 `Git Bash` 支持的常用命令以及 `git` 的基本操作.

## 哲学第一问: 我是谁

现实生活中我们每个人都有名字,身份以及责任.正是由**自我和他人**一起构成了"我是谁"这一基本问题: 是儿子,是丈夫,是父亲,是社会中的一份子.

但是,在计算机世界中,**我**又是谁呢?

计算机世界是虚拟世界,有的只是冰冷冷的程序和数据,有限的人机交互才创造了"我",所以弄清楚"我是谁"的问题至关重要.

> `whoami` : `who am i` 的缩写,即打印出当前登录用户.

计算机世界中,"我"表现为一个账号,用户名是唯一标识.在这个世界上不止一个用户，同一台电脑支持多个账号.

所以,"我"是计算机的用户,哪天警察检查身份证时,需要自报家门,如果你都不知道你的名字那岂不是闹笑话了？

```bash
snowdreams1006@home MINGW64 ~
$ whoami
snowdreams1006
```

## 哲学第二问: 我在哪

不论是武侠小说主角突然失忆还是被绑架桥段,第一句总是： "我是谁？这是哪？"或者"你是谁？这是哪？".

不仅现实世界人很多,计算机世界的用户也不止一个,目录更是数不胜数.
所以，我们第二个问题就要探讨一下"我在哪"的基本问题.

> `echo ~` : `echo` 翻译为"回声",直接表现为输出某命令的执行结果,`~` 代表用户的"家"目录,即输出家目录.

现实世界中我们每个人都有自己的家,计算机世界也不例外.每个用户都有自己的家目录

试想一下,如果没有心灵的港湾,灵魂和身体该如何安放?如果没有家目录,数据默认存放到哪里去？多个用户之间的数据怎么保证相对隔离？

```bash
snowdreams1006@home MINGW64 ~
$ echo ~
/c/Users/snowdreams1006
```

## 哲学第三问: 我要干什么

现实世界中,每个人出生后会慢慢长大,或一直留在家乡或外出闯荡,终其一生，生不带来，死不带去.

其中最直观表现为每个人基本上都要工作,从而维持生活,继而创造社会价值.不论是当地就业还是外出就业,我们上班的地点被称为**工作地点**.

家只有一个,工作地点却可以有多个,可以换工作换工作地点,但是永远只有一个家,是故乡,是出生地,是心灵的港湾.

如果这种场景反映到计算机世界,又是怎样一番场景呢?

既然和计算机打交道,不论什么交互方式,最终都无外乎输入输出两种形式.输入的是我们的投入,输出的是我们的产出.

输入输出的数据需要存储在计算机中,是以文件的形式有组织地保存起来,保存数据的目录就是工作目录,不是自己的家目录的其他目录都是我们的工作目录.

这样看起来,原来在计算机中换工作竟然这么容易,**不是家目录的其他目录都是工作目录**.

### 万丈高楼平地起: 创建目录

> `mkdir [OPTION] DIRECTORY` : `make directory` 的缩写,即创建目录.

万丈高楼平地起,计算机人生刚刚起步,需要搭建好大厦的基础框架,然后再往里面一点一点加东西,终将变成摩天大厦！

立下明确目标,坚定不移前往目的地,工作目录已创建,第一步已经迈出去,接下来准备前往新创建的工作目录,搭建好我们自己的高楼大厦.

```bash
snowdreams1006@home MINGW64 ~
$ mkdir /g/workpace/git-bash-demo
```

### 飘洋过海来看你: 切换目录

> `cd [-L|[-P [-e]] [-@]] [dir]` : `change directory` 的缩写,即切换目录.

既然选择了前方,便只顾风雨兼程.心中的大厦蓝图等待去实现,不论是从家目录出发还是工作目录出发,既然目标工作目录已经确定,接下来如何出发便不是太麻烦的事情了.

现实世界中出发到工作地点,可以坐高铁,坐轮船,坐飞机等多种交通方式任你挑选,在计算机世界中前往工作目录就很简单,只要明确知道工作目录,一条命令瞬间直达！

```bash
snowdreams1006@home MINGW64 ~
$ cd /g/workpace/git-bash-demo
```

### 惊鸿一瞥初相见: 打印目录

> `pwd [-LPW]` : `print working directory` 的缩写,即打印工作目录.

初次来到新的工作地点,第一件事就是查看当前位置以便确认漂洋过海的经历没有白费。

非家目录的其他目录都是工作目录,确认工作目录是目标目录后就可以正式投入紧张有序的工作生活中了,准备好了吗？

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ pwd
/g/workpace/git-bash-demo
```

### 回头四顾心茫然: 列出文件

> `ls [OPTION] [FILE]` : `list file` 的缩写,即列出文件.

刚刚进入新环境,本想查看一下周围环境和同事打个招呼,蓦然发现: 周围空无一人.

空荡荡的房子提醒着自己,万丈高楼平地起,创业道路孤独而艰辛！

```
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ ls
```

### 保温杯中泡枸杞: 创建文件

> `touch [OPTION] [FILE]` : 翻译为"触摸",有则改之无则新增,即如果文件已存在则更新权限和修改时间,否则新建文件.

身体是革命的本钱,即将开始废寝忘食的创业之旅,在高强度的工作来临之前,先检查一下保温杯在不在,在的话,洗一洗,不在的话,先去买一个再洗一洗.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ touch cup.txt
```

### 枸杞茶中加枸杞: 覆盖输入

> `>` : 覆盖输入,不论目标文件是否已有内容,新内容直接覆盖原文件内容.

保温杯中泡枸杞,第一步先往保温杯中加入枸杞,如果有其他东西先倾倒然后再加入枸杞,否则直接加入枸杞.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ echo "medlar" > cup.txt
```

> `echo` "medlar" 即输出枸杞,`>` 是重定向操作,将上一步的输出结果当做下一步的输入参数,`cup.txt` 是保温杯,因此该组合命令表示将枸杞倒入保温杯.

### 枸杞茶中倒热水: 追加输入

> `>>` : 追加输入,在原有文件内容后面追加新内容,新内容不会覆盖原文件内容.

保温杯中已有枸杞,第二步开始倒水准备泡枸杞茶,枸杞自然不能倾倒出去,不然就叫做白开水不能叫做枸杞茶了.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ echo "water" >> cup.txt
```

### 枸杞茶要慢慢品: 查看文件

> `cat [OPTION] [FILE]` : `concatenate` 的缩写,翻译为"连接",即查看文件内容.

枸杞只需一点点,温水适量,不多也不少才是最好,最好亲自品尝一下才能决定如何继续调整.

要看到文件的全部内容正如要看到枸杞茶整体一样,后续操作视观察结果而定.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ cat cup.txt
medlar
water
```

### 枸杞茶要再调整： 追加并查看文件

枸杞差不多,浓度有点大,需要再加一点水,为了控制加入量,还要再品一下枸杞茶.

```
# 追加文件内容
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ echo "more water" >> cup.txt
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo

# 查看文件内容
$ cat cup.txt
medlar
water
more water
```

### 三更灯火五更鸡: 编辑文件

> `vim [OPTION] [FILE]` : `Vi IMproved` 的缩写,`vi = VIsual = Very Inconvenient` 是命令行编辑工具,`vim` 即 `vi` 的增强版,编辑文件.

先设定整体目标,做好全局性计划,然后再是根据目标确定详细具体的工作安排.

```bash
# 在命令行编辑器中编辑 goal.txt 文件,如果没有会自动创建.
$ vim goal.txt
```

进入编辑器后的基本命令

- `i` : `insert` 的缩写,翻译为"插入",即切换到编辑模式.
- `esc` : `escape` 的缩写，翻译为"逃跑",即切换到命令模式.
- `:w` ： `write` 的缩写,翻译为"保存",即保存文件内容.
- `:q` : `quit` 的缩写，翻译为"退出",即退出 `vim` 编辑器.
- `:wq` : `write and quit` 的缩写，翻译为"保存并退出",即保存并退出 `vim` 编辑器.
- `:q!` : `quit force` 的缩写,翻译为"强制退出",即不提示未保存强制退出.
- `gg` : 定位到文件开头.
- `G` ： 定位到文件结尾.
- `yy` : 复制整行.
- `dd` : 剪切整行.
- `p` : 粘贴.
- `u` : 撤销.
- `ctrl + f` : 下翻整页.
- `ctrl + b` : 上翻整页.
- `ctrl + d` : 下翻半页.
- `ctrl + u` : 上翻半页.
- `/<string>` : 查找<string>字符串

编辑后的目标,学习 `markdown` ,学习 `git` ,学习 `gitbook` ,分享 `java` 知识等等,目标远大,撸起袖子加油干吧！

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ cat goal.txt
## learning markdown

## learning git

## learning gitbook

## sharing java8
```

### 撸起袖子加油干: 查看开头

> `head [OPTION] [FILE]` : `head` 翻译为"头",即打印文件前十行内容.

我们立下的目标暂时只有四行,为了掩饰效果,临时录入更多无意义的计划,这部分并不属于我们的目标.

```bash
echo "万丈高楼平地起: 创建目录" >> goal.txt
echo "飘洋过海来看你: 切换目录" >> goal.txt
echo "惊鸿一瞥初相见: 打印目录" >> goal.txt
echo "回头四顾心茫然: 列出文件" >> goal.txt
echo "保温杯中泡枸杞: 创建文件" >> goal.txt
echo "枸杞茶中加枸杞: 覆盖输入" >> goal.txt
echo "枸杞茶中倒热水: 追加输入" >> goal.txt
echo "枸杞茶要慢慢品: 查看文件" >> goal.txt
```

现在 `goal.txt` 文件不止十行,而是十六行数据,足够我们演示效果.

在泡枸杞茶最后一步中,我们需要品茶以此确定枸杞和热水搭配是否合理,使用 `cat` 命令帮我们查看文件全部内容,如果我们不需要查看全部,只需要查看前十条的话,就需要另外的命令.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ cat goal.txt
## learning markdown

## learning git

## learning gitbook

## sharing java8

万丈高楼平地起: 创建目录
飘洋过海来看你: 切换目录
惊鸿一瞥初相见: 打印目录
回头四顾心茫然: 列出文件
保温杯中泡枸杞: 创建文件
枸杞茶中加枸杞: 覆盖输入
枸杞茶中倒热水: 追加输入
枸杞茶要慢慢品: 查看文件
```

查看目标清单中的前十条记录,而不显示全部记录.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ head goal.txt
## learning markdown

## learning git

## learning gitbook

## sharing java8

万丈高楼平地起: 创建目录
飘洋过海来看你: 切换目录
```

### 不思进取后十名: 查看结尾

> `tail [OPTION] [FILE]` : `tail` 翻译为"尾",即打印文件后十行内容.

如果查看文件是目标文件 `goal.txt` 还好,目标再小也不应被歧视,如果是成绩文件或者绩效文件,难免会被比较,打上"不思进取"的标签.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
$ tail goal.txt
## sharing java8

万丈高楼平地起: 创建目录
飘洋过海来看你: 切换目录
惊鸿一瞥初相见: 打印目录
回头四顾心茫然: 列出文件
保温杯中泡枸杞: 创建文件
枸杞茶中加枸杞: 覆盖输入
枸杞茶中倒热水: 追加输入
枸杞茶要慢慢品: 查看文件
```

### 优雅的写作体验: markdown 

> `markdown` 是一种轻量型的文本标记语言,是无文本 `txt` 的增强版，是超文本 `html` 的精简版,是二进制 `word` 的替代版,带给你全新的写作体验.

刚刚立下的目标文件的第一条就是学习 `markdown` ,那什么是 `mardown` 以及我们为什么要学习 `markdown` 呢？

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
# 前一条记录: -n 1，前五条记录: -n 5
$ head -n 1 goal.txt
## learning markdown
```

如果你的文章需要手动同步发表到各大网络平台,用书写 `word` 那种体验虽然直观,但是缺点是需要记住各平台布局按钮摆放位置,想要达到一致的输出效果,每个平台都需要手动调整以确保最终效果一致性.

如果使用 `markdown` 体验来书写文字则完全不会有这种问题,提前定义好的文件格式并不依赖平台,你可以一处编写,随心所欲到处复制粘贴!


既然 `markdown` 这么神奇,这种优雅的写作方式到底是什么呢?学起来真的一点都不费事!

`markdown` 是一种标记语言,常用于书写文章,小巧轻量,不必记住令人眼花缭乱的按钮摆放位置,也不像记事本那种毫无格式,只需记住有限几个特殊字符就能输出漂亮美观的文件效果！

比如当前文章的书写格式就是 `markdown` 进行编写,整体效果还不错,这样看起来 `markdown` 是不是很强大呢?

> 和其他文本文档一样, `markdown` 文件也有自己的后缀名 `.md`,比如该文章的文件名 `git-bash-command.md`.

现在你是不是迫不及待想要学习 `markdown` 了呢?

别急,学习需要规划,我们再专门新建目录用于存放 `markdown` 学习笔记.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
# 创建目录: 参考"万丈高楼平地起"章节
$ mkdir markdown

snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
# 列出文件: 参考"回头四顾心茫然"章节
$ ls
cup.txt  goal.txt  markdown/

snowdreams1006@home MINGW64 /g/workpace/git-bash-demo
# 切换目录: 参考"飘洋过海来看你"章节
$ cd markdown

snowdreams1006@home MINGW64 /g/workpace/git-bash-demo/markdown
# 打印目录: 参考"惊鸿一瞥初相见"章节
$ pwd
/g/workpace/git-bash-demo/markdown
```

现在让我们先学习下 `markdown` 中标题和列表如何书写,想要了解更多请参考我专门介绍 `makdown` 的[系列文章](https://snowdreams1006.github.io/markdown/).

- 标题

> 语法格式: `#` + `空格` + `文本` ,`#` 表示一级标题,`##` 表示二级标题,`###` 表示三级标题,以此类推,最多支持六级标题.

示例:

```markdown
# 标题1
## 标题2
```

* 有序列表

> 语法格式：`数字` + `.` + `空格` + `文本`

示例:

```
1. 有序列表1 
2. 有序列表2 
3. 有序列表3 
```

- 无序列表

> 语法格式：'`- 或 * 或 +`' + `空格` + `文本`

示例:

```
- 无序列表1 
* 无序列表2 
+ 无序列表3 
```

哇塞,原来 `markdown` 语言竟然如何简洁,妈妈再也不用担心我记不住复杂的布局按钮了！


笔记时间到,赶紧将上述知识点整理到 `markdown` 目录下,创建 `markdown.md` 文件用于记录刚才的学习笔记.

```bash
snowdreams1006@home MINGW64 /g/workpace/git-bash-demo/markdown
# 编辑文件: 参考"三更灯火五更鸡"章节 
$ vim markdown.md

snowdreams1006@home MINGW64 /g/workpace/git-bash-demo/markdown
# 查看文件: 参考"枸杞茶要慢慢品"章节 
$ cat markdown.md
先学习下 `markdown` 中标题和列表如何书写,想要了解更多请参考我专门介绍 `makdown` 的[系列文章](https://snowdreams1006.github.io/markdown/).

...
```

### 恪尽职责的网盘: git

经过上述内容引导发现 `markdown` 语法确实在某些场景下很好用,于是乎下定决心开始踏上学习 `markdown` 之旅.

工欲善其事必先利其器,本着小白初体验心态,还是先安装一个可视化的编辑器吧!

> 实际上,`markdown` 很常用,主流编辑器基本都有相应插件,比如 `idea`,`vs code` 和 `sublime`等.

`typora` [编辑器](https://typora.io/),支持多平台,	`windows` ,`mac` 和 `linux`,别具一格的首页.

![git-markdown-typora.gif](../images/git-markdown-typora.gif)
