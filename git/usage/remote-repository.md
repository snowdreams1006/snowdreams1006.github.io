# 远程仓库

如果说本地仓库已经足够个人进行版本控制了,那么远程仓库则使多人合作开发成为可能.
如果你只是打算自己使用`git`,你的工作内容不需要发布给其他人看,那就用不到远程仓库的概念.

`git` 是**分布式版本控制系统**,分布式意味着同一个`git 仓库` 可以部署在不同的机器上,正如"鸡生蛋蛋生鸡"问题一样,不论如何,先要有一个原始仓库,然后才能分布到其他机器上去.

充当原始仓库的机器要有一个特点那就是24h 开机且大家都能访问到,这个概念类似于"中央服务器".这样一来大家都可以从"中央服务器"下载最新代码,克隆到本地,本地发生更改后再推送给"中央服务器".如此一来,大家交流方便很多,轻松实现文件内容的共享.

这种"中央服务器"比较有名的是国外的网站 [github](https://github.com/),当然国内也有不少类似服务.像这种"中央服务器"也可以自己搭建,现阶段搭建的话简直就是"杀鸡焉用牛刀"!

## 背景

关于如何注册配置相关请参考 [github 教程](../github/usage.md)

为了和上述教程保持一致,项目名`git-demo`,先看一下当前工作区状态:

```
# 查看文件列表
$ ls
LICENSE     README.md   test.txt
# 查看文件内容
$ cat test.txt
add test.txt
```

现在测试一下本地更改能否推送到远程仓库,先在本地文件 `test.txt` 随便写点东西,然后添加(`git add`),提交(`git commit`),最后推送到远程仓库(`git push origin master`).

```
# 写入新的内容并提交到本地仓库
$ echo "see https://snowdreams1006.github.io/git/usage/remote-repository.html" >> test.txt
$ git add test.txt
$ git commit -m "see https://snowdreams1006.github.io/git/usage/remote-repository.html"
[master b3d8193] see https://snowdreams1006.github.io/git/usage/remote-repository.html
 1 file changed, 1 insertion(+)

# 推送到远程仓库
$ git push origin master
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 359 bytes | 359.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:snowdreams1006/git-demo.git
   8e62564..b3d8193  master -> master
$ 
```

命令行没有报错证明我们已经成功推送到 `github`,现在登录 `github` 看一下有没有刚才我们提交的新内容.

![github-updated](../images/github-updated.png)

现在本地版本库和远程版本库已经能够正常建立关联了,此刻起将不再是独自一人在战斗!

## 小结

- 创建已有本地仓库和远程仓库的关联

```
# 添加远程仓库关联
git remote add origin git@github.com:username/repos.git

# 首次推送 master 分支的全部内容
git push -u origin master

# 后续推送 master 分支的最新更改
git push origin master
```

- 从已有远程仓库克隆到本地仓库

```
# 克隆远程仓库到本地仓库
git clone git@github.com:username/repos.git

# 推送 master 分支的最新更改
git push origin master
```
