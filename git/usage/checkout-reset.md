# 撤销更改

相信你已经了解了 `git` 的基本概念,也清楚了工作区,暂存区和版本库的关系,现在让我们用所学的知识继解决实际问题吧!

## 背景

正常看得见的目录是我们最为熟悉的工作区,在工作中不可能总是100%的精力,难免会犯错,尤其是下午犯困,晚上加班更是如此.下面列举了常见的一些场景

- **场景一: 工作区出现意外更改且尚未添加到暂存区**

北京时间现在是晚上10点钟,你正在赶制一份工作报告,尽管心中一万个不愿意,还是不得不做.

开始模拟意外更改前,先查看一下 `test.txt` 文件相关信息:

```
# 列出当前目录的文件
$ ls
file1.txt   file2.txt   file3.txt   newFile.txt test.txt
# 查看 `test.txt` 文件内容
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
# 查看 `test.txt` 文件状态
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   test.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

no changes added to commit (use "git add" and/or "git commit -a")
# 查看 `test.txt` 文件差异
$ git diff 
diff --git a/test.txt b/test.txt
index d31bdd2..56c76b7 100644
--- a/test.txt
+++ b/test.txt
@@ -3,4 +3,4 @@ git init
 git diff
 understand how git control version
 how git work
-git tracks changes
+git tracks changes of files
$ 
```

还记得在上一节中我们讲解 `git` 版本控制的到底是什么,为了证明 `git` 管理的是更改而不是文件本身,我们特意在第二次更改时没有添加到暂存区,现在我们先把这个遗留问题解决掉.

```
# 工作区更改添加到暂存区
$ git add test.txt
# 暂存区内容提交到版本没哭
$ git commit -m "git tracks changes of files"
[master b7bda05] git tracks changes of files
 1 file changed, 1 insertion(+), 1 deletion(-)
# 查看文件状态
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)
$ 
```

现在正在加班加点干活,一不小心将心中的不满表露出来了,于是有了下面的内容:

```
# 意外更改正是这么犯傻的一句话
$ echo "My stupid boss still prefers svn" >> test.txt
# 当前文件内容
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
My stupid boss still prefers svn
$ 
```

虽然强打精神,可还是很困,于是打算喝杯咖啡提提神,猛然发现 **stupid boss** 可能会让你丢掉这个月的奖金!

暗自庆幸,咖啡果然是个好东西,既然发现了问题,那就事不宜迟赶紧修复,因为不适宜的话正是 **stupid boss** ,所以你完全可以手动删除,但是假如你说了一大堆不合适的话,或者复制粘贴时弄错了,这就不是删除一两行那么简单了!

既然手动解决比较麻烦,那`git` 有没有什么好方法来解决这类问题呢?在寻求`git` 帮助前,首先再看一下当前文件状态(`git status`).正所谓"知己知彼方能百战百胜",还是看一眼吧!

```
# 查看文件状态
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   test.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

no changes added to commit (use "git add" and/or "git commit -a")
$ 
```

`git` 不负众望,果然给了我们希望,`(use "git checkout -- <file>..." to discard changes in working directory)` 这句话的告诉我们可以丢弃工作区的更改!

脑海中在快速回忆一下工作区,暂存区,版本库三者之间的关系,其实`git checkout -- <file>` 命令的意思是用暂存区的内容替换掉工作区内容,因此也就是丢弃掉工作区的更改了.

事不宜迟,运行 `git checkout -- <file>` 命令试试看吧:

```
# 丢弃工作区的更改
$ git checkout -- test.txt
# 查看文件内容: My stupid boss still prefers svn 终于不见了
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
# 查看文件状态
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)
$ 
```

一顿操作猛如虎,撤销掉意外更改,回到上一次版本控制状态,世界如此美好...

> 注意: `git checkout -- <file>` 中的 `--` 至关重要,没有它就是**切换分支**了!

- **场景二: 工作区出现意外更改且已经添加到暂存区,但尚未提交到版本库**

时间一分一秒过去了,转眼间已经11点了,假设你不但写了一些胡话,还添加到暂存区了(`git add`).可想而知,这次意外比**场景一**要糟糕.

```
# 模拟正常提交(不然岂不是从场景一到场景二你什么都没做,那还能叫做赶制工作报告吗?!)
$ echo "someone prefers svn,but i don't care it" >> test.txt
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it
$ git add test.txt
$ git commit -m "normal commit"
[master ab1cbd2] normal commit
 1 file changed, 1 insertion(+)

# 意外更改的前夕 
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it

# 意外更改内容: my teammate is stupid too.
$ echo "my teammate is stupid too." >> test.txt
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it
my teammate is stupid too.

# 意外操作: 将意外更改内容提交到暂存区
$ git add test.txt 
```

不过庆幸的是,在提交到版本库(`git commit`)之前及时发现问题,还是看一下现在的文件状态(`git status`)吧!

```
# 查看文件状态: 救命稻草 (use "git reset HEAD <file>..." to unstage)
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   test.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

$ 
```

`git` 同样告诉我们,可以使用 `git reset HEAD <file>` 命令撤销暂存区更改.

其实 `git reset HEAD <file>` 命令是用版本库的内容替换掉暂存区的内容,也就是说原来暂存区的内容已被丢弃了!

所以说这个命令并不会影响工作区内容,不如我们现在再看一眼工作区内容,方便执行 `git reset HEAD <file>` 命令后证实我们的结论.

```
# 查看文件内容: my teammate is stupid too.
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it
my teammate is stupid too.
$ 
```

迫不及待执行 `git reset HEAD <file>` 命令,先睹为快!

```
# 救命稻草: 版本库内容替换掉暂存区内容
$ git reset HEAD test.txt
Unstaged changes after reset:
M   test.txt

# 效果: 目标文件已修改但未添加到暂存区
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   test.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

no changes added to commit (use "git add" and/or "git commit -a")

# 目标文件内容: 仍然保持不变
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it
my teammate is stupid too.
$ 
```

现在**场景二**已经退化成**场景一**了,目标文件发生意外更改但还没添加到暂存区,如何撤销工作区更改,请参考**场景一**方法.

> 提示:  `git checkout -- test.txt` 

- **场景三: 工作区出现意外更改不仅已添加到暂存区,还已提交到版本库,但尚未推送到远程仓库**

时间不紧不慢地已经到凌晨了,困意越来越浓,洋洋洒洒写下几千字的工作报告,总算是写完了,添加到暂存区(`git add`),提交到版本库(`git commit`)一气呵成,等等,好像有什么不对劲,难免会犯糊涂,这不又发生意外了!

```
# 衔接场景二
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it

# 正常提交一
$ echo "i love working,work makes me happy" >> test.txt
$ git add test.txt
$ git commit -m "encourage myself"
[master a44cf7a] encourage myself
 1 file changed, 1 insertion(+)

# 正常提交二
$ echo "fix 110 bugs,so happy" >> test.txt
$ git add test.txt
$ git commit -m "fix bugs"
[master c66399d] fix bugs
 1 file changed, 1 insertion(+)
sunpodeMacBook-Pro:demo sunpo$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)

# 意外更改: hate to work overtime
$ echo "hate to work overtime" >> test.txt
$ git add test.txt
$ git commit -m "test.txt"
[master c965724] test.txt
 1 file changed, 1 insertion(+)
 $ 
```

天妒英才,加班加点做事情,本想赢得老板的赏识,没想到最后一句话"hate to work overtime"让所有的努力都付之一炬,怎么办?

死马当活马医,还是照例看看`git status` 能提供什么建议吧!

```
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)
$ 
```

没有提供任何意见能帮助我们撤销意外更改,先别慌,容我深思三秒钟...

既然意外更改已经提交到版本库,那么应该用什么内容替换版本库内容呢?有了,既然最新版本库不可用,那上一个版本库内容可用的啊,完全可以用上一个版本库内容替换最新版本库内容,真乃"天生我材必有用"!

```
# 当前文件内容: 闯祸的"hate to work overtime"
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it
i love working,work makes me happy
fix 110 bugs,so happy
hate to work overtime

# 版本回退: 回到过去假装什么都没发生过
$ git reset --hard HEAD^
HEAD is now at c66399d fix bugs
sunpodeMacBook-Pro:demo sunpo$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)

# 岁月静好,一切似乎都没发生过
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
someone prefers svn,but i don't care it
i love working,work makes me happy
fix 110 bugs,so happy

# 当前文件状态
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)
$ 
```

详情请参考[回到过去](./reset.md),时空穿越之旅就是这么方便哈!

> 提示: `git reset --hard HEAD^`

- **场景四: 工作区出现意外更改不仅已添加到暂存区,还提交到版本库,还已推送到远程仓库**

场景一到场景三都是本地仓库,所有的文件更改只能本机访问,小伙伴也好,上级领导也罢都无法查看到你本地更改,但是一旦你推送到远程仓库了,那么其他人就能查看你的更改了!

正常的提交更改还好,怕就怕这种"stupid boss"被领导看到就不好了,那应该怎么办?暂时还是自求多福吧!

## 小结

- 丢弃工作区更改: `git checkout -- <file>` 
- 丢弃暂存区更改: `git reset HEAD <file>` 
- 丢弃本地版本库更改: `git reset --hard HEAD^` 
- 丢弃远程版本库更改: 自求多福

