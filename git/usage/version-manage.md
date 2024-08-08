# 版本管理

## 背景

在上一节中我们已经成功创建版本库并且已经添加`test.txt`等文件,这一节我们继续讲解如何进行版本控制.

首先我们先查看`test.txt` 文件有什么内容吧!

```
# 查看文件内容
$ cat test.txt
git test
git init
git diff 
$
```

接下来模拟正常工作,接着输入一下内容:

```
# 追加新内容到 test.txt 文件
echo "understand how git control version" >> test.txt

# 查看当前文件内容
$ cat test.txt
git test
git init
git diff
understand how git control version
$ 
```

紧接着运行 **`git status`** 看一下输出结果:

```
# 查看文件状态
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   test.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   test.txt

$ 
```

从上述 `git status` 命令输出的结果可以看出,`test.txt` 已经被修改但还没提交,但是具体发生了什么变化却没能告诉我们,如果能够告诉我们具体修改细节那就好了!

运行**`git diff`**命令可以实现上述需求

```
$ git diff
diff --git a/test.txt b/test.txt
index 729112f..989ce33 100644
--- a/test.txt
+++ b/test.txt
@@ -1,3 +1,4 @@
 git test
 git init
 git diff
+understand how git control version
$ 
```

`git diff` 命令即查看差异(difference),从输出结果可以看出我们在最后一行新增了`understand how git control version` 文字.

通过`git status` 知道文件发生了改动,`git diff` 让我们看到了改动的细节,现在我们提交到版本库就放心多了,还记得上节课如何添加版本库的命令吗?

分两步操作: `git add <file>` 和 `git commit -m <remark>` 

第一步: `git add <file>`

```
$ git add test.txt
$ 
```

等一下,在执行 `git commit` 命令之前,我们再运行 `git status` 命令查看一下当前仓库状态:

```
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   test.txt

$ 
```

此时 `git status` 命令告诉我们 `test.txt` 文件已被修改等待提交,好了,那么接着第二步的commit吧!

第二步: `git commit -m <remark>` 

```
# 提交到版本库并添加备注
$ git commit -m "add understand how git control version"
[master 36f234a] add understand how git control version
 1 file changed, 2 insertions(+)
$ 
```

提交后,我们此时再次运行`git status` 命令查看当前仓库状态:

```
$ git status
On branch master
nothing to commit, working tree clean
$ 
```

输出结果显示没有需要提价的改动,工作目录是干净的.

## 小结

- 查看工作区状态 `git status`
- 比较修改差异 `git diff`
