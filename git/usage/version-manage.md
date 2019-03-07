# 版本管理

## 要求
- 巩固上一节本地仓库的相关知识
- 了解版本控制的相关概念和实际应用场景
- 掌握如何进行版本控制,熟悉相关常用命令

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



```
# 添加到本地仓库: 第二步指定添加文件备注
git commit -m "add test.txt"
```

经过上述两步操作,`test.txt` 文件已经纳入到版本控制中了,这里你可能会有疑问了为什么需要`add` `commit`两步呢?
因为`commit` 可以一次性提交很多文件,所以你可以多次`add`不同的文件,比如:

```
# 创建三个文件file1.txt file2.txt file3.txt
touch file1.txt file2.txt file3.txt

# 添加一个文件file1.txt
git add file1.txt

# 添加两个文件file2.txt file3.txt
git add file2.txt file3.txt

# 一次性提交全部文件
git commit -m "add 3 files."
```

## 小结
- 初始化本地仓库 `git init ` 
- 添加文件到本地仓库分两步 `git add <file>` 和 `git commit -m <message>`
- 实际工作中,大致以下流程

```
# 在工作空间创建指定目录
mkdir demo

# 切换至工作目录
cd demo

# 初始化本地仓库
git init 

# 创建新文件
touch test.txt

# 编辑新文件,输入 git test
echo "git test" > test.txt

# 添加到本地仓库: 第一步指定要添加的文件
git add test.txt

# 添加到本地仓库: 第二步指定添加文件备注
git commit -m "add test.txt"

...

# 继续编辑目标文件,追加 git init
echo "git init" >> test.txt

# 将目标文件添加到本地仓库
git add test.txt

# 添加本次新增文件的备注
git commit -m "add git init"

```
