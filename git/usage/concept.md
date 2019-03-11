# 基本概念

了解工作区,暂存区和版本库的区别和联系有助于我们更好理解 `git` 的工作流程,了解命令的操作意图.

> `git` 和其他版本控制系统如 `svn` 的不同之处就是有暂存区的概念.

## 基本概念

- **工作区 | Working Directory**

正常情况下能看到的目录(不包括隐藏文件),也就是用户主动创建的目录

![working-directory](../images/working-directory.png)

- **暂存区 | Stage** 

工作区下的隐藏`.git`目录下的`.index`文件,因此也称为索引.

- **版本库 | Repository**

工作区下的隐藏目录`.git`目录

![repository](../images/repository.png)

通过前几节我们知道,将文件纳入版本控制,需要分两步操作:

- 第一步 `git add` 添加文件,实际上是将文件更改添加到暂存区.
- 第二步 `git commit` 提交更改,实际上是将暂存区所有内容提交到当前分支.

我们使用 `git init` 命令初始化创建 `git` 仓库时,`git` 会自动创建唯一一个 `master` 分支,默认所有操作是在 `master` 分支上进行的,所以 `git commit` 就是徃 `master` 分支上提交更改的.

通俗地讲,文件更改可以多次添加到暂存区,即允许多次执行 `git add` 命令,然后一次性提交暂存区的全部更改到版本库,即只需要执行一次 `git commit` 命令即可.


## 图解

下图展示了工作区,暂存区,版本库之间的关系:

![relationship](../images/relationship.jpg)

图中左侧是工作区,右侧是版本库,版本库中标记`index` 的区域是暂存区,标记 `master` 的是 `master` 分支所代表的目录树.

`HEAD` 是指向 `master` 分支的指针,标记 `objects` 的区域是 `git` 的对象库,真实路径位于`.git/objects`目录下,用于表示创建的对象和内容.

### 意图说明

- **`git add` 添加文件**

工作区的修改或者新增的文件执行`git add` 命令后,暂存区(index)的目录树会自动更新,同时引发这次变化的文件内容会被记录下来,即生成对象库(objects)中的新对象,而对象的 id会被记录到暂存区的文件索引(index)中.

- **`git commit` 提交文件**

暂存区的目录树写入到对象库(objects),`master` 分支的目录树自动更新.

- **`git reset HEAD` 撤销文件**

暂存区的目录树被重写,被`master` 分支的目录树所替换,但是工作区不受影响.

- **`git rm --cached <file>` 删除缓存文件**

删除暂存区文件,工作区不受影响.

- **`git checkout .` 检出文件**

暂存区的文件替换工作区文件,注意:当前尚未添加到暂存区的改动会全部丢失!

- **`git checkout HEAD .` 检出文件**

`HEAD` 指针指向的 `master` 分支中的文件替换暂存区以及工作区文件,注意:不仅清除工作区未提交的改动,连暂存区未提交的改动也会被清除!

### 小结

以上就是常用命令的背后意图,主要是工作区,暂存区和版本库之间文件同步策略的关系.

- `git add` 是工作区更新到暂存区
- `git commit` 是暂存区更新到版本库
- `git reset HEAD` 是版本库更新到暂存区
- `git checkout -- <file>` 是暂存区更新到工作区
- `git checkout HEAD <file>` 是版本库同时更新暂存区和工作区
- `git rm --cached` 清空暂存区

