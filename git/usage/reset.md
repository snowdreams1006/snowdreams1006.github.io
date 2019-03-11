# 回到过去

## 背景

现在你已经掌握`git`的基本操作了,文件发生更改首先使用 `git add` 添加更改,然后 `git commit` 提交全部更改,当本地文件再次发生更改时,仍然需要`git add` 和 `git commit` 两步操作,中途如何想查看文件是否发生更改,使用`git status` 查看版本库状态,`git diff` 命令帮助我们查看更改详情.

像这样重复的操作其实每次都会产生一个快照,用于保存文件状态,只不过这个快照不是完整的文件,被称为提交或者版本`commit` .一旦发生意外,假如文件修改乱了或者误删了文件,我们可以从最近的一个 `commit` 中进行恢复,然后继续工作,这就是`git` 管理的好处之一.

每一次重大更新或者你认为比较重要的时刻,我们总会留作纪念,添加些什么特殊标记来区分平时的提交,还记得我们每次提交都会添加备注吗?`git commit -m <remark>` 这条命令现在就可以大显身手了,我们现在要做的就是找到我们提交的历史记录,而历史记录中有我们提交的详情,这样即使过了一个月或者更长时间,我们也能清楚知道当时的情景!

**查看提交历史记录 `git log`**,接下来我们赶紧试一下吧

```
$ git log
commit 36f234a60d858871f040cb0d7ca3e78251df82f7 (HEAD -> master)
Author: snowdreams1006 <snowdreams1006@163.com>
Date:   Thu Mar 7 22:19:00 2019 +0800

    add understand how git control version

commit 2006f72ffe2ce2278b5974313b8598847cf445e4
Author: snowdreams1006 <snowdreams1006@163.com>
Date:   Tue Mar 5 13:27:46 2019 +0800

    add 3 files.

commit eaa4850070354ae987dc5108a9fd57fda9d64730
Author: snowdreams1006 <snowdreams1006@163.com>
Date:   Tue Mar 5 12:18:57 2019 +0800

    add git init

commit 6ad8956bc09a6a62c731711eabe796690aa6471c
Author: snowdreams1006 <snowdreams1006@163.com>
Date:   Tue Mar 5 12:17:51 2019 +0800

    add test.txt
```

`git log` 命令默认显示最近到最远的提交历史,这一点也很好理解,毕竟我们是在命令行操作,输入`git log` 完毕后自然先要定位到命令处,看到最新提交记录方便我们确认是否符合我们预期,还有一点就是如果提交历史过多,从头开始到最新提交记录岂不是眼花缭乱,简直不敢想象啊!

下面以最新的一次提交 `commit` 为例,简单解释一下输出内容:

```
# 提交唯一标示id: 36f234a60d858871f040cb0d7ca3e78251df82f7
commit 36f234a60d858871f040cb0d7ca3e78251df82f7 (HEAD -> master)

# 作者: snowdreams1006 邮箱: <snowdreams1006@163.com>
Author: snowdreams1006 <snowdreams1006@163.com>

# 日期: Thu Mar 7 22:19:00 2019 +0800
Date:   Thu Mar 7 22:19:00 2019 +0800

# 提交备注: add understand how git control version

    add understand how git control version
```

默认输出内容有点多,不仅有提交 id ,提交备注还有作者时间之类的,由于每个 `commit` 都如此,这样一来,满屏都展示不下,那能不能简化些呢?

一行显示提交日志 ** `--pretty=oneline ` **,即`git log --pretty=oneline`

```
$ git log --pretty=oneline
36f234a60d858871f040cb0d7ca3e78251df82f7 (HEAD -> master) add understand how git control version
2006f72ffe2ce2278b5974313b8598847cf445e4 add 3 files.
eaa4850070354ae987dc5108a9fd57fda9d64730 add git init
6ad8956bc09a6a62c731711eabe796690aa6471c add test.txt
$ 
```

相比无参数`git log`,是不是简短了一些呢? 和之前日志相比少了作者和时间等信息,仍然保留提交 id 和提交备注.

因为提交 `commit` 是 `git` 的基础,当然不能省略,而提交备注能够帮助我们理解`commit` 的含义,毕竟提交备注使我们自定义的内容,这也是我们为什么提交时要写提交备注的原因!

现在我们已经了解到版本库存放了我们的提交,接下来让我们验证一下是否能够回到过去吧!

**回到上一个提交**,上一个提交自然是相对当前提交而言,只有知道当前提交才能知道上一个提交以及上一个提交的上一个提交.
提交id `36f234a60d858871f040cb0d7ca3e78251df82f7`,那么上一个提交`HEAD^`,上上一个提交是`HEAD^^`.如果此时我想回到往上数100个版本,那么是不是可以这么写?

`HEAD^^^^...^^^` 其中`^` 有100个,如果需要手动打出100个`^`的话,那么绝对是疯了!
既然有这种相对定位方式,自然也有绝对定位方式,用绝对定位方式解决就是这样: `HEAD~100`

```
$ git log
commit 36f234a60d858871f040cb0d7ca3e78251df82f7 (HEAD -> master)
Author: snowdreams1006 <snowdreams1006@163.com>
Date:   Thu Mar 7 22:19:00 2019 +0800

    add understand how git control version
```

**回到上一个版本 `git reset --hard HEAD^` **

```
$ git reset --hard HEAD^
HEAD is now at 2006f72 add 3 files.
$ 
```

现在让我们看一下,`test.txt` 的内容:

TODO


sunpodeMacBook-Pro:demo sunpo$ cat test.txt
git test
git init



看看readme.txt的内容是不是版本add distributed：

$ cat readme.txt
Git is a distributed version control system.
Git is free software.
果然被还原了。



## 小结