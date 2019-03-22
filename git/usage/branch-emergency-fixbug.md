# 紧急修复

和往常一样,团队的开发者每个人都在自己的本地分支开发,相互独立又相互联系,一直以来相安无事,可是某天下午,上级领导突然急冲冲的打电话告诉你线上出`bug`了,需要紧急修复,立刻马上修复问题!

然而我们天生就是创造 `bug` 的特殊群体,每天都在和各种各样的 `bug` 打交道,早已经习惯了这样的工作节奏,再也没有当初刚刚遇到紧急问题的手足无措,先喝杯茶,冷静一下,然后汇报领导说:放心吧,保证`30min` 内解决!

## 背景

学习了分支操作的相关知识,团队内部就基本的开发流程达成一致:

线上是 `master` 主分支,开发是 `dev` 分支,团队成员分支自定义 `custom`,平时开发时在自定义 `custom` 分支上,完成任务后合并到开发 `dev` 分支,开发分支功能稳定后合并到主干分支 `master` .

> 开发流程的简化版,实际上各复杂,后续再介绍 `gitflow` 工作流.

由于是线上分支出现 `bug`,理所当然基于 `master` 分支检出临时分支,代号`issue-110`,接下来 `git checkout -b issue-110` ,然后定位 `bug` 并修复,重新提交再合并回 `master` 分支,成功修复 `bug`,心安理得下班回家!

如果真的向上述步骤那样操作,显然还不够冷静,刚才那一杯茶是白喝了!那样会丢失你现场数据,下面简单演示一下:

### 错误示例

1. 事发前正在自定义 `snow` 分支上愉快编码中:

```
# 线上分支 `master`,开发分支 `dev`,自定义分支 `snow`,当前正处于自定义分支
$ git branch
  dev
  master
* snow
# 接到领导电话前正在自定义 `snow` 分支上进行愉快编码中...
$ echo "Happy coding" >> test.txt
$ git add test.txt
$ git commit -m  "Happy coding"
```

![git-branch-snow.png](../images/git-branch-snow.png)

2. 事发时直接检出主分 `master` 分支紧急修复 `bug` 并提交:

```
# 事发时正在思考人生,更改尚未添加到暂存区
$ echo "who am i" >> test.txt
$ git status
On branch snow
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   test.txt

no changes added to commit (use "git add" and/or "git commit -a")

# 默认情况下不允许直接切换到其他分支,因为工作区更改会被重写,这里为了演示错误示例,强制切换!
$ git checkout dev
error: Your local changes to the following files would be overwritten by checkout:
    test.txt
Please commit your changes or stash them before you switch branches.
Aborting

# 基于主干 `master` 分支检出修复 `issue-110`分支
$ git checkout -b issue-110
Switched to a new branch 'issue-110'

# 定位线上 `bug`并修复,假设将 `fast forward` 更改为 `fast forward not recommend`,瞬间修复 `bug`有没有!
$ cat test.txt
add test.txt
see https://snowdreams1006.github.io/git/usage/remote-repository.html
learn git branch
see https://snowdreams1006.github.io/git/usage/branch-overview.html
git commit c1
git commit c2 and c3
git checkout -b dev
fast forward
$ vim test.txt
$ cat test.txt
add test.txt
see https://snowdreams1006.github.io/git/usage/remote-repository.html
learn git branch
see https://snowdreams1006.github.io/git/usage/branch-overview.html
git commit c1
git commit c2 and c3
git checkout -b dev
fast forward not recommend

# 提交更改
$ git add test.txt
$ git commit -m "fix bug about issue-110"
[issue-110 e60c8ad] fix bug about issue-110
 1 file changed, 1 insertion(+), 1 deletion(-)
sunpodeMacBook-Pro:git-demo sunpo$ git status
On branch issue-110
nothing to commit, working tree clean
$ 
```

![git-branch-issue-110.png](../images/git-branch-issue-110.png)

切换回主干 `master` 分支,并合并修复 `issue-110` 分支:

```
# 切换回 `master` 分支,合并修复 `issue-110` 分支
$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
$ git merge issue-110
Updating 3fe94c0..e60c8ad
Fast-forward
 test.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
# 验证 `bug` 已修复: 更改为 `fast forward not recommend`
$ cat test.txt
add test.txt
see https://snowdreams1006.github.io/git/usage/remote-repository.html
learn git branch
see https://snowdreams1006.github.io/git/usage/branch-overview.html
git commit c1
git commit c2 and c3
git checkout -b dev
fast forward not recommend
$ 
```

![git-branch-fixbug-master.png](../images/git-branch-fixbug-master.png)

3. 事发后切换到自定义 `snow` 分支,打算下班回家:

```
# 切换回 `snow` 分支,发现丢失了事发前的未保存更改:`who am i`
$ git checkout snow
Switched to branch 'snow'
$ cat test.txt
add test.txt
see https://snowdreams1006.github.io/git/usage/remote-repository.html
learn git branch
see https://snowdreams1006.github.io/git/usage/branch-overview.html
git commit c1
git commit c2 and c3
git checkout -b dev
fast forward
Happy coding
$ 
```

![git-branch-fixbug-snow.png](../images/git-branch-fixbug-snow.png)

> 现在还打算下班吗?你所做的更改因为没有提交或者不能提交造成全部丢失!

#### 后果

因为手头工作进行到一半无法提交或者忘记提交等原因,为了临时修复紧急 `bug` 而**直接切换**到目标分支再回来时发现更改全部丢失,相当于那部分工作白忙活了!
