# 撤销更改

相信你已经了解了 `git` 的基本概念,也清楚了工作区,暂存区和版本库的关系,现在让我们用所学的知识继解决实际问题吧!

## 背景

正常看得见的目录是我们最为熟悉的工作区,在工作中不可能总是100%的精力,难免会犯错,尤其是下午犯困,晚上加班更是如此.下面列举了常见的一些场景

- **场景一: 工作区出现意外更改且尚未添加到暂存区**

北京时间现在是凌晨两点半,你正在赶制一份工作报告,尽管心中一万个不愿意,还是不得不做.

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

还记得在上一节中我们讲解 `git` 版本控制的到底是什么,为了证明 `git` 管理的是更改而不是文件本身,我们特意在第二次更改时没有添加到暂存区,现在我们先把这个遗留问题


- **场景二: 工作区出现意外更改且已经添加到暂存区,但尚未提交到版本库**



- **场景三: 工作区出现意外更改不仅已添加到暂存区,还已提交到版本库,但尚未推送到远程仓库**



- **场景四: 工作区出现意外更改不仅已添加到暂存区,还提交到版本库,还已推送到远程仓库**


## 小结