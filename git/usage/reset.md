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

在操作之前我们先看一下当前文件 `test.txt` 的内容:

```
$ cat test.txt
git test
git init
git diff
understand how git control version
```

现在让我们开始回到过去,运行 `git reset --hard HEAD^` 命令:

```
$ git reset --hard HEAD^
HEAD is now at 2006f72 add 3 files.
$ 
```

现在让我们再看一下,`test.txt` 的内容有没有被还原:

```
$ cat test.txt
git test
git init
```

果然被还原了!这就是`git`的神奇之处,说明我们已经能够回到过去了!

现在我们先用`git log` 查看下提交历史:

```
$ git log
commit 2006f72ffe2ce2278b5974313b8598847cf445e4 (HEAD -> master)
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
$ 
```

和上次相比,少了一条提交记录:

```
commit 36f234a60d858871f040cb0d7ca3e78251df82f7 (HEAD -> master)
Author: snowdreams1006 <snowdreams1006@163.com>
Date:   Thu Mar 7 22:19:00 2019 +0800

    add understand how git control version
```

这样是正常的,毕竟你已经处于 *过去* 了,当然看不到 *未来* 的提交记录.

正如影视穿越剧那样,主人公意外穿越过去,总是想要回到未来,怎么办,没有法器没有未来的确切目标怎么行?!

`git` 的穿越剧也需要这样一种法器,能准确告诉时光机把我们带到具体的那个时间点,当然这个时间点不一定是未来时刻,过去时刻也行,反正就是一个准确的坐标.

聪明的你肯定已经猜测到这个任务是由`commit` 担任的,所有我们现在要找到未来的时间点,也就是`commit` id,就是那一长串 hash 字符串.

只要当前命令行窗口还没有关闭,慢慢往上翻,总是能找到当初我们的穿越点`commit`的,即`36f234a60d858871f040cb0d7ca3e78251df82f7`

**回到当初提交 `git reset --hard <commit>` **
万事俱备只欠东风,已经成功定位到未来坐标,等待穿越到未来!

```
$ git reset --hard 36f234a60d858871f040cb0d7ca3e78251df82f7
HEAD is now at 36f234a add understand how git control version
$ 
```

现在我们再次查看 `test.txt` 内容:

```
$ cat test.txt
git test
git init
git diff
understand how git control versi
```

果然成功穿越回到未来!

上述穿越回到未来的场景是我们知道目标 `commit` ,也就是在当前命令行窗口没有关闭的情况下,手动查找穿越点 `commit`.那如果命令行窗口已关闭或者没办法通过查阅历史命令来定位穿越点 `commit` 情况下怎么办呢?

这种情况下也是有补救措施的,`git` 提供了命令历史 `git reflog`,记录了我们操作的命令历史.

**翻阅历史命令 `git  reflog` **

```
$ git reflog
36f234a (HEAD -> master) HEAD@{0}: reset: moving to 36f234a60d858871f040cb0d7ca3e78251df82f7
2006f72 HEAD@{1}: reset: moving to HEAD^
36f234a (HEAD -> master) HEAD@{2}: commit: add understand how git control version
2006f72 HEAD@{3}: commit: add 3 files.
eaa4850 HEAD@{4}: commit: add git init
6ad8956 HEAD@{5}: commit (initial): add test.txt
```

确实记录了我们操作的关键命令,从上述输出结果可以看出,穿越点 `commit` 正是`36f234a60d858871f040cb0d7ca3e78251df82f7`,剩下的事情应该不必多说了吧!

## 小结

- `HEAD` 是当前提交的指针,指向的提交就是当前提交,上一个提交是 `HEAD^`,上上个提交是 `HEAD^^`,前100个提交是`HEAD~100`.
- `git log` 查看提交历史,`git log --pretty=oneline` 简短化输出提交历史.
- `git reflog` 查看命令历史,以便我们重拾关键步骤信息.
- `git reset --hard <commit>` 穿越到指定提交,比如上一个提交就是 `git reset --hard HEAD^` .





