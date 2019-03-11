# 知识速查

## 创建 | Create

### 克隆一个已存在的仓库 | Clone an existing repository

```
git clone git@github.com:snowdreams1006/snowdreams1006.github.io.git
```

### 创建一个新的本地仓库 | Create a new local repository

```
git init 
```


## 本地更改 | Local Changes

###  工作目录中已更改文件 | Changed files in your working directory

```
git status
```

### 已追踪文件的更改 | Changes to tracked files

```
git diff 
```

### 添加当前全部更改到下次提交版本 | Add all current changes to next commit

```
git add . 
```

### 添加文件中某些更改到下次提交版本 | Add some changes in <file> to next commit

```
git add -p <file>
```

### 提交已追踪文件的全部本地更改 | Commit all local changes in tracked files

```
git commit -a
```

### 提交上一次暂存区更改 | Commit previously staged changes

```
git commit 
```

### 更改上次提交 | Change the last commit 
> 没有更改已发布的提交 | Don't amend publishd commits!

```
git commit --amend
```


## 提交历史 | Commit history

### 显示全部提交,以最新的开头 | Show all commits,starting with newest

```
git log
```

### 显示某个文件一段时间内的更改 | Show changes over time for a specific file

```
git log -p <file>
```

### 某文件是谁在什么时候更改了什么内容 | Who changed what and when in <file>

```
git blame <file>
```


## 分支和标签 | Branches & Tags

### 列出全部已存在的分支 | List all existing branches

```
git branch -av
```

### 切换到 HEAD 分支 | Switch HEAD branch

```
git checkout <branch>
```

### 基于当前 HEAD 创建新分支 | Create a new branch based on your curent HEAD

```
git branch <new-branch>
```

### 基于远程分支创建新的正在追踪分支 | Create a new tracking branch based on a remote branch

```
git checkout --track <remote/branch>
```

### 删除一个本地分支 | Delete a local branch

```
git branch -d <branch>
```

### 为当前提交打上标签 | Make the current commit with a tag

```
git tag <tag-name>
```


## 更新和发布 | Update & Publish

### 列出当前全部已配置的远程仓库 | List all currently configured remotes

```
git remote -v
```

### 显示远程仓库信息 | Show information about a remote

```
git remote show <remote>
```

### 添加<remote>的远程仓库 | Add new remote repository named <remote>

```
git remote add <shortname> <url>
```

### 下载来自<remote>远程仓库的所有更改但是不合并到 HEAD | Download all changes from <remote> but don't integrate into HEAD

```
git fetch <remote>
```

### 下载来自<remote>远程仓库指定分支的所有更改并且自动合并到 HEAD | Download changes and directly merge/integrate into HEAD

```
git pull <remote> <branch>
```

### 在<remote>远程仓库上发布本地更改 | Publish local changes on a remote

```
git push <remote> <branch>
```

### 在<remote>远程仓库上删除分支 | Delete a branch on the branch 

```
git branch -dr <remote/branch>
```

### 发布你的标签 | Publish your tags

```
git push --tags
```


## 合并和变基 | MERGE & REBASE

### 合并指定分支到你的 HEAD | Merge <branch> into your current HEAD

```
git merge <branch>
```

### 变基到当前HEAD | Rebase your current HEAD onto <branch>

> 不要变基已发布的提交 | Don't rebase published commits!

```
git rebase <branch>
```

### 取消变基 | Abort a rebase

```
git rebase --abort
```

### 使用已配置的冲突工具去解决冲突 | Use your configured merge tool to solve conflicts

```
git mergetool
```

### 使用编辑器手工解决冲突然后(解决之后)标记文件已解决冲突 | Use your editor to manually solve conflicts and (after resolving) mark file as resolved

```
git add <resolved-file>
git rm <resolved-file>
```


## 撤销 | UNDO

### 丢弃工作区全部更改 | Discard all local changes in your working directory

```
git reset --hard HEAD
```

### 丢弃指定文件的本地更改 | Discard local changes in a specific file

```
git checkout HEAD <file>
```

### 抵消一个提交(通过产生一个新的相反的提交) | Revert a commit (by producing a new commit with contrary changes)

```
git revert <file>
```

### 重置当前 HEAD 指针到上一个提交...然后丢弃自那以后的全部更改 | Reset your HEAD pointer to a previous commit ... and discard all changes since then

```
git reset --hard <commit>
```

### ...然后作为未缓存更改保存全部更改 | ... and preserve all changes as unstaged change

```
git reset <commit>
```

### ...然后保存未提交的本地更改 | ... and preserve all changes as unstaged change

```
git reset --keep <commit>
```


## 建议 | SUGGESTION

### 提交相关更改 | COMMIT RELATED CHANGES

提交应该是相关更改的包装,例如,修复两个不同的 bug 应该产生两个单独的提交.
小的提交让其他开发者更容易理解此次更改,并且万一出错方便回滚.
在暂存区这类工具以及暂存部分文件的能力下,git 很容易创建细粒度的提交.

A commit should be a wrapper for related changes,
For example,fixing two different bugs should produce two separete commits.
Small commits make it easier for other developers to understand the changes and roll them back if something went wrong.
With tools like the staging area and the ability to stage only parts of a file.
Git makes it easy to create very granular commits.

### 经常提交 | COMMIT OFTEN

经常提交使得你的提交很小并且有助于仅提交相关更改.
此外,这样允许你更频繁地和其他人分享你的代码,对于每个人来说更容器定期合并更改,避免了遭遇合并冲突.
,很少的大提交,很少分享它们.相反很难解决冲突.

Commiting often keeps your commits small and again helps you commit only related changes.
Moreover,it allows you to share your code more frequently with others.
That way it's easier for everyone to integrate changes regularly and avoid having merge conflicts.Having few large commits and sharing them rarely.in contrast,makes it hard to solve conflicts.

### 不要提交未完成工作 | DON'T COMMIT HALF-DONE WORK

你应该仅提交已完成代码,这并不意外着提交前你不得不完成一个完整的,很大的功能分支.恰恰相反,将功能分支划分成很多逻辑块并且记得早一点,频繁些提交.
如果仅仅是为了下班前仓库该有点什么就不要提交,如果你尝试提交仅仅是因为你需要一个干净的工作副本(检出分支,拉取更改),考虑使用 `git` 的 `stash` 特性. 

You should only commit code when it's completed.
This doesn't mean you have to complete a whole ,large feature before commiting.
Quite the contrary:split the feature's implementatiion into logical chunks and remember to commit early and often.
But don't commit just to have something in the repository before leaving the ofice at the end of the day.
If you're tempted to commit just because you need a clean working copy (to check out a branch,pull in changes ,etc.) consider using Git's <Stash> feature instead.

### 提交前测试代码 | TEST CODE BEFORE YOU COMMIT

抵制自以为已完成的提交.
直接测试来确保它真的已完成并且没有副作用(显而易见的).
当提交半成品到本地仓库时要求你不得不自我谅解,让你的代码进过测试对发布或者分享你的代码也很重要.

Resist the temptation to commit something that you *think* is completed.
Test it thoroughly to make sure it really is completed and has no side effect (as far as one can tell).
While committing half-baked thing in your local repository only requires you to forgive yourself,having your code tested is even more important when it comes to publishing/sharing your code with others.

### 编写代码提交信息 | WRITE CODE COMMIT MESSAGE

对你的更改以简短总结进行描述(达到50字符作为准则).
以包括空白行作为分割下述内容.
提交信息体应该提供下述问题的详细答案:

- 此次更改的动机是什么?
- 和上一个实现有什么不同?

使用必要的现在时语态(更改,不是已更改,或者变更)和使用形如 `git merge` 命令生成的信息保持一致.

Begin your message with short summary of your changes(up to 50 characters as a guideline).
Separate it from the following body by including a blank line.
The body of your message should provide detailed answers to the following questions:

- What was the motivation for the change?
- How does it differ from the previous implementation?

Use the imperative ,present tense(`change`,not `changed` or `changes`) to be consistent with generated messages from commands like git merge.

### 版本控制不是一个备份系统 | VERSION CONTROL IS NOT A BACKUP SYSTEM

在远程服务器存有文件的备份是版本控制系统的一个很好副作用.但是你不应该将`VCS` 视为一个备份系统.
当做版本控制时,你应该注意语义化提交,而不是死记硬背文件.

Having your files backed up on a remote server is a nice side effect of having a version control system.
But you should not use your `VCS` like it was a backup system.
When doing version control,you should pay attention to committing semantically(see `related changes`) - you shouldn't just cram in files.

### 利用分支 | USE BRANCHES

分支是 `git` 最强大的特性之一,这不是偶然.
从第一天开始快速而简单的分支就是一个核心需求.
分支是帮助你避免弄混不同开发线的完美工具.
在你的开发流程中应该广泛使用分支,像新功能,修复 bug,新想法...

Branching is one of Git's most powerful features-and this is not by accident:quick and easy branching was a central requirement from day one.
Branches are the perfect tool to help you avoid mixing up different lines of development.
You should use branches extensively in your development workflows:for new features,bug fixes,ideas...

### 认同工作流 | AGREE ON A WORKFLOW

`Git` 允许你从大量不同的工作流中选择一个:长期运行的分支,主题分支,合并或变,基工作流...
具体选择哪一个取决于一系列因素:你的项目,你的总体开发和部署工作流和(可能是最重要的)你和你的团队的个人偏好.
不论你选择哪一个去工作,你需要确保准守一个大家都认同的工作流.

Git lets you pick from a lot of different workflows:long-running branches,topic branches,merge or rebase,git-flow...
Which one you choose depends on a couple of factors:your project,your overall development and deployment workflows and (maybe most importantly ) on your and your teammate's personal preferences.
However you choose to work,just make sure to agree on a common workflow that everyone follows.

### 帮助和文档 | HELP & DOCUMENTATION 

命令行下获取 `git` 帮助

```
git help <command>
```

Git help on the command line

```
git help <command>
```

### 免费在线资源 | FREE ONELINE RESOURCES

- [http://www.git-tower.com/learn](http://www.git-tower.com/learn)
- [http://rogerdudler.github.io/git-guide/](http://rogerdudler.github.io/git-guide/)
- [http://www.git-scm.org/](http://www.git-scm.org/)



---

# 知识速查

## 创建版本库

### 初始化项目 git init 

从零开始创建项目

**示例** 

```
git init 
```

### 克隆项目 git clone

将已有项目拷贝到本地

**示例** 

```
git clone git@github.com:snowdreams1006/snowdreams1006.github.io.git
```

## 添加文件 git add

将新文件或已修改文件添加到缓存区

**示例** 

```
git add README.md
```

## 查看状态 git status

查看当前文件是否和上次提交内容是否有修改

**示例** 

```
git status README.md
```

## 比较差异 git diff

查看当前文件和上次提交内容的具体差异

- 尚未缓存的修改: `git diff`
- 查看已缓存修改: `git diff --cached`
- 查看已缓存与未缓存的所有修改: `git diff HEAD`
- 显示摘要而非整个差异: `git diff --stat`

**示例** 

```
git diff README.md
```

## 提交文件 git commit

将缓存区内容添加到版本库

**示例** 

```
git commit -m "remark"
```

## 取消已缓存内容 git reset HEAD

将缓存区内容添加到版本库

**示例** 

```
git reset HEAD 
```

## 删除文件 git rm <file>

- 从暂存区中移除且不保留在工作目录: `git rm <file>`
- 强制从暂存区中移除且不保留在工作目录: `git rm -f <file>`
- 从暂存区中移除但保留工作目录: `git rm --cached <file>`

**示例** 

```
git rm README.md
```

## 移动文件 git mv <file_old> <file_new>

移动或重命名文件,目录,软连接

**示例** 

```
git mv README.md README_NEW.md
```

`commit push pull fetch merge` 的区别与含义:

- `git commit` : 将本地修改过的文件提交到本地仓库中
- `git push` : 将本地仓库的最新版本推送到远程库中
- `git pull` : 从远程库获取最新版本到本地,并自动`merge`
- `git fetch` : 从远程库获取最新版本到本地,不会自动`merge`
- `git merge` : 将指定版本合并到当前分支

## 替换本地改动

丢弃当前文件修改内容,已添加到暂存区以及新文件都不会受到影响

**示例** 

```
git checkout -- <file>
```

丢弃本地所有改动

**示例** 

```
git reset --hard 
```

## 分支管理

### 创建分支 git branch <name>

创建本地分支,但不自动切换新分支
  
**示例** 

```
git branch dev
```

### 切换分支 git checkout <name>

切换到指定分支

**示例** 

```
git checkout dev
```

### 创建并切换分支 git checkout -b <name>

创建本地分支并自动切换到新分支

**示例** 

```
git checkout -b feature
```

### 合并分支 git merge <name> 

将指定分支合并到当前分支

**示例** 

```
git merge dev
```

### 删除分支 git branch -d <name> 

删除指定分支

**示例** 

```
git branch -d dev
```

### 列出分支 git branch 

列出本地全部分支

**示例** 

```
git branch
```

## 提交日志 git log 
 
查看纳入版本库的提交日志

**示例** 

```
git log
```

## 标签管理

### 创建标签 git tag -a <name>

创建标签并提交备注
  
**示例** 

```
git tag -a v1.0.0
```

### 追加标签 git tag -a <name> <commit>

追加标签并更新备注
  
**示例** 

```
git tag -a v0.9.0 6ad8956bc09a6a62c731711eabe796690aa6471c
```

### 删除标签 git tag -d <name> 

删除指定标签

**示例** 

```
git tag -d v1.0.0
```

### 查看标签 git show <name> 

查看指定标签

**示例** 

```
git show v1.0.0
```

### 列出标签 git tag 

列出本地全部标签

**示例** 

```
git tag
```