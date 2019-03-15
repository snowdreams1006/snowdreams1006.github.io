# 分支总览

分支就是一条独立的时间线,既有分支,必有主干,正如一棵树谈到树枝,必有树干一样的道理.我们先前对`git` 的全部操作默认都是在主干上进行的,这个主干也是一种特殊的分支,名为 `master` 分支.

无论是穿越历史还是撤销更改,我们都或多或少接触过时间线,`git` 管理的版本串在一起就组成了这个时间线,其中`master` 分支是当前分支,`HEAD` 指向`master` ,因此`HEAD` 相当于指向了最新的版本.

![git-commit.gif](../images/git-commit.gif)

基于分支上的操作,每一次 `commit` 都会提交一个新版本,并且新的 `commit` 指向原来的 `commit`,这来最新的 `commit` 就可以往前找,直到找到最初的`commit`.这就是 `git` 的时间线.

当我们打算开辟新的时间线时,`git` 在当前 `HEAD` 指向的 `master` 分支的 `commit` 处新建一个 `dev` 分支.如果主角没有主动进入时间线的话,那么仍然处于 `master` 分支,进入的方法就是 `HEAD`指向新建的 `dev` 分支.

不考虑孙悟空的分身特效,主角不能同时处于不同的时空下,`git` 也是如何,`HEAD` 只能指向某一个 `commit` ,既然刚刚已经指向了 `dev` 分支,所以原来的 `master` 分支就没有 `HEAD` 了,因为相当于`master` 分支静止了.

当主角在 `dev` 分支独自闯荡干出一番事业时,决定回到故乡 `master` 分支,并将出门在外所学的本领带回家乡,建设美好家园.`master` 分支因为合并了 `dev` 分支,所以一下子增添了很多内容,家乡焕然一新!

主角这次携带 `dev` 分支归来,`HEAD` 分支自然又回到了 `master` 分支上,年轻的心向往外面的世间,相信不久后还会有同样的故事发生...

![git-branch.gif](../images/git-branch.gif)

下面详解分支相关命令

## 创建分支

创建 `dev` 分支,列出分支.

```
# 创建分支
$git branch dev
# 列出分支
$ git branch
  dev
* master
$ 
```

> \* `master` 前面的 \* 标记表明当前仍然处于 `master` 分支

![git-on-master.png](../images/git-on-master.png)



