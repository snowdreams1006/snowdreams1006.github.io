# 版本控制

我们知道 `git` 是分布式版本控制系统,所以称被控制对象是版本本身没错,但是从`git` 命令中发现,并没有版本这个名词,有的只是`commit`,所以前几节我一直称其为**提交**.

为了避免后续教程引发歧义,特意说明,无论是**版本**也好,**提交**也罢,都是中文翻译而已,不必太过较真,直接原汁原味称`commit`也可以啊!

假设你已掌握暂存区的相关概念,简单来说,暂存区就是更改文件的缓存集合,等待一次性全部提交到版本库,正因如此,方便我们批量操作相关性文件,打包提交到版本库,这正是暂存区的独特魅力.

我们反复在说 `git` 是分布式版本控制系统,分布式的概念已经粗略讲过多次了,下面我们讲一下版本控制,谈谈 `git` 的版本控制和其他系统的版本控制有什么不同,为什么 `git` 这么优秀,如此流行?

`git` 跟踪并管理的是更改,而非文件本身.正如`linux 一切皆文件`,`java 一切皆对象`一样,`git 一切皆更改`.新增文件是一个更改,新增文件内容是一个更改,修改文件内容是一个更改,删除文件内容也是一个更改,换言之,`git` 管理的正是这一个个的更改,并不是文件本身.

下面我们用事实说话,证明 `git` 管理的是更改而不是文件本身:

第一步,追加 `git tracks changes` 到 `test.txt` 文件

```
# 查看 test.txt 文件内容
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
# 追加 git tracks changes 文件内容到 test.txt 文件
$ echo "git tracks changes" >> test.txt
# 再次查看 test.txt 文件内容
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes
$ 
```

第二步,添加`test.txt` 文件到暂存区并查看文件状态

```
$ git add test.txt
sunpodeMacBook-Pro:demo sunpo$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   test.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

$ 
```

对于上述内容应该不必再解释了吧,无外乎说`test.txt` 文件已修改(modified),即将被提交(to be committed).

但是,此时偏偏不提交,继续修改 `test.txt` 文件:(这种情况实际工作中也有可能出现,比如你正在研发某功能,本以为已经开发完毕,满心欢喜添加到暂存区,然后意外发现一个小bug,分分钟就修复了,时间间隔很短以至于你根本不记得还需要再次添加到暂存区.)

第三步,继续修改文件内容,忘记再次添加到暂存区

```
# 编辑 test.txt 文件,将 git tracks changes 更改为 git tracks changes of files
vim test.txt
# 查看 test.txt 文件内容
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
$ 
```

第四步,正常提交暂存区的全部更改到版本库

```
$ git commit -m "git tracks changes"
[master 2daa74a] git tracks changes
 1 file changed, 1 insertion(+)
```

此次提交后,我们再看一下文件状态:

```
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

发现有什么不同吗?以往提交后再次查看文件状态,工作区都是干净的,这次居然提示我们 `test.txt` 文件已经修改但未添加到暂存区?!

等一下,我们先回忆一下我们的操作流程:

第一次修改(git tracks changes) -> `git add` -> 第二次修改(git tracks changes of files) -> `git commit`

这样就很好理解了,`git` 管理的是更改而不是文件本身,如果是文件本身的话,应该将文件的内容全部提交才对,所以管理的是更改.

第一次修改过后使用 `git add` 命令将工作区的第一次修改内容放到暂存区准备提交,但是此时工作区发生了第二次修改,注意,这次修改并没有放到暂存区,所以下一步的`git commit` 命令提交的暂存区内容中自然也就没有第二次修改的内容了!所以`git commit` 完毕后运行`git status`命令才会发现此时工作区和暂存区还存在版本差异,即此时工作区不是干净的!

这一次的实验很好理解,工作区的修改需要**主动**告诉暂存区,暂存区的全部更改再提交到版本库.所以版本库的提交取决于暂存区,而暂存区又取决工作区是否主动将更改添加进去了吗!

理论再多不如亲身体验,让我们直接比较一下工作区和版本库的差异吧!

```
# 比较 test.txt 文件在工作区和版本库的差异
$ git diff HEAD -- test.txt
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

由此可见,工作区比版本库多了`git tracks changes of files`,少了`git tracks changes`,所以说第二次修改内容 `git tracks changes of files` 并没有被提交.

现在我们再解释一下`-git tracks changes` 和 `+git tracks changes of files` 的问题:

首先查看工作区 `test.txt` 文件内容

```
$ cat test.txt
git test
git init
git diff
understand how git control version
how git work
git tracks changes of files
$ 
```

根据上述分析,我们知道第一次的修改`git tracks changes` 已被提交到版本库,第二次的修改`git tracks changes of files` 没有被提交而是继续留在工作区.

因此,可以推断出目前版本库的文件应该是这样的:

```
git test
git init
git diff
understand how git control version
how git work
git tracks changes
```

既然如何,工作区和版本库相比岂不刚好是少了一个`git tracks changes`,多了`git tracks changes of files`,其余文件内容完全相同!

透过现象看本质,已经分析了现象也解释了产生现象的原因,是时候分析一下本质了.

抛出问题:因为`git tracks changes of fiels` 和 `git tracks changes` 被视为不同的更改,所以才会造成上述现象.如果`git tracks changes of fiels` 被认为是`git tracks changes` + `of fiels` 两者叠加产生的更改,还会产生上述现象吗?

答案是否定的,如果两个更改可以叠加的话,按照版本控制的思路,第二次的修改即便没有提交也只是 `of fiels` 没有加入到版本库而已,如此一来,工作区和版本库的差异将不再是少了一个`git tracks changes`,多了`git tracks changes of files`,而仅仅是多了`of files`!

由此可见,`git` 版本控制系统其实是**全量更新**的思维模式,并不是**差量更新**模式.

## 小结

- 工作区的更改需要`git add` 添加到暂存区,`git commit` 将暂存区的全部更改提交到版本库.
- 工作区,暂存区,版本库三者既相关独立又密切关联,三者是传递性依赖的关系.
- `git` 版本控制的是文件的更改,而不是文件本身,是全量更新模式,而不是差量更新模式.

