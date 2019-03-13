# 删除文件

回忆一下文件的常见操作,新增文件,修改文件,删除文件等,新增和修改文件都单独讨论过,现在我们来研究一下如何删除文件.

你可能会说删除文件还不简单啊,直接 `rm -rf <file>` 即可,但是这仅仅是本地文件被删除了,对于 `git` 来说,文件并没有被删除.

还记得我们开篇介绍`git` 时就说过,`一切操作皆版本` ,对于新增是一个版本,修改也是一个版本,就连删除都是一个版本.

下面让我们看一下 `git` 中如何删除文件吧!

## 背景

```
# 查看当前文件列表
$ ls
file1.txt   file2.txt   file3.txt   newFile.txt test.txt
# 新建待删除文件
$ touch delete.txt
# 再次查看当前文件列表,确保新建文件成功
$ ls
delete.txt  file2.txt   newFile.txt
file1.txt   file3.txt   test.txt
# 查看当前文件状态: 新文件 `delete.txt` 还没被跟踪
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store
    delete.txt

nothing added to commit but untracked files present (use "git add" to track)
# 添加新文件 `delete.txt`
$ git add delete.txt
# 查看文件状态: 已添加到暂存区,待提交到版本库
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   delete.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

# 提交新文件 `delete.txt`
$ git commit -m "add delete.txt"
[master 7df386a] add delete.txt
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 delete.txt
# 再次查看文件状态: 已经没有新文件 `delete.txt` 的更改信息
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)
$ 
```

以上操作,我们简单创建 `delete.txt` 文件,添加(`git add`)并提交(`git commit`) 该文件,完成准备工作后,开始删除文件!

```
# 删除前文件列表
$ ls
delete.txt  file2.txt   newFile.txt
file1.txt   file3.txt   test.txt
# 删除刚刚创建的文件 `delete.txt`
$ rm delete.txt
# 删除后文件列表
$ ls
file1.txt   file2.txt   file3.txt   newFile.txt test.txt
# 当前文件状态: `delete.txt` 文件已被删除,且未添加到暂存区
$ git status
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    deleted:    delete.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

no changes added to commit (use "git add" and/or "git commit -a")
$ 
```

本地删除 `delete.txt` 文件后,再次查看文件状态 `git status` 发现 `git` 给了我们两条建议,其中一条 `git checkout -- <file>` 我们很熟悉,就是丢弃工作区的更改,此时此景下如果丢弃删除操作,相当于撤销删除,难怪说删除也是一个版本呢!

现在我们重点来看第一条建议 `git add/rm <file>` ,`rm` 是 `remove` 单词的缩写,即删除文件.

```
# 删除文件
$ git rm delete.txt
rm 'delete.txt'
# 查看文件状态: `delete.txt` 文件待提交
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    deleted:    delete.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

# 提交文件
$ git commit -m "remove delete.txt"
[master 6298070] remove delete.txt
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 delete.txt
# 再次查看文件状态
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    .DS_Store

nothing added to commit but untracked files present (use "git add" to track)
$ 
```

删除文件和添加文件类似,都是一次`commit` ,本地文件的任何更改都要添加到暂存区,然后提交到版本库.

## 小结  

删除文件和新增文件类似逻辑,`git rm` 删除文件后,依然需要 `git commit` 提交版本.

