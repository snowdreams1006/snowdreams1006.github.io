# git 私服搭建教程

前几节我们的远程仓库使用的是 `github` 网站,托管项目大多是公开的,如果不想让任何人都能看到就需要收费,而且 `github` 网站毕竟在国外,访问速度太慢,基于上述两点原因,我们有必要搭建自己的 `git` 服务器.

虽然我们能搭建基本的 `git` 服务器,但是想要做到 `github` 网站那种规模还不是目前能够探讨的,本节的主要目标是使用我们私有服务器对我提供类似于`github`的远程仓库托管服务,以下示例以`centos` 服务器为例说明:

## 安装 git 服务

运行以下命令安装 `git` 服务

```
# 安装 git 相关依赖
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-devel

# 安装 git
yum install git

# 查看 git 版本
git --version
```

> 详情请参考[安装 git](../base/install.md)

## 配置 git 用户

创建 `git` 用户组和 `git` 用户,以便对外提供 `git` 服务

```
# 新增 git 用户组
groupadd git

# 新增 git 用户并归属于 git 用户组
useradd git -g git

# 禁用 git 用户登录 shell
编辑 /etc/passwd

git:x:1001:1001:,,,:/home/git:/bin/bash

更改为

git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell
```

## 收集 git 公钥

回忆一下,在我们使用 `github` 网站时,我们是不是曾经将本地电脑生成的公钥`~/.ssh/id_rsa.pub` 复制到 `Account -> Settings -> SSH and GPG keys -> New SSH key`,而我们现在搭建的`git` 服务还是简单,但是这步骤必不可少,因此只能**手动收集**素有需要访问我们服务器的公钥文件.

我们知道需要登录我们服务器的用户公钥一般是存放在`~/.ssh/id_rsa.pub` ,那当前服务器作为远程服务器将这些公钥存放到哪里呢?还记得上一步我们创建了 `git` 用户吗?

因为 `linux` 系统支持多用户操作,而 `git` 用户就用于专门运行 `git` 服务,负责所有和 `git` 有关的事宜.因此,导入公钥文件的目录就是`/home/git/.ssh/authorized_keys`文件.一个用户公钥占用一行,几个用户就有几行.

```
# 切换到 git 用户主目录
cd /home/git/

# 创建.ssh 目录
mkdir .ssh

# 赋予标准目录权限
chmod 755 .ssh

# 创建authorized_keys文件
touch .ssh/authorized_keys

# 赋予标签文件权限
chmod 744 .ssh/authorized_keys
```

如果团队规模不大,那么上述方案完全可行,如果团队规模几百上千人,通过手动收集每个人的公钥再上传到服务器统一管理就有点力不从心了,这时候推荐 [gitosis](https://github.com/res0nat0r/gitosis) 决这一问题.

## 初始化 git 仓库

同样我们和`github` 网站类比,在 `github` 创建仓库时都会在当前账号下创建项目,完整的访问路径大概是这样的: `git@github.com:snowdreams1006/git-demo.git`,从中我们可以看出项目仓库都有一个前缀即命名空间,这和上一步操作是不是很类似,上一步收集 `git` 公钥时我们也有统一的目录,这次也不例外.

假设 `git` 仓库存放目录在 `/home/git/repos/`,同样的先创建该目录并赋予响应权限.

```
# 切换到 git 用户主目录
cd /home/git/

# 创建 repos 目录
mkdir repos

# 更改 repos 目录属主
chown git:git repos/

# 切换到 repos 目录
cd repos

# 初始化 git 裸仓库
git init --bare git-demo.git

# 更改 git-demo.git 仓库属主
chown -R git:git git-demo.git
```

> 这里搭建git服务器仅为了共享,不考虑用户直接登录该服务器上使用 git 将其作为工作区这一情况

经过上述操作,我们成功在远程服务器部署了 `git` 服务,并且创建了 `git-demo` 测试项目,实际访问路径大概是这样的
`git@snowdreams1006.cn:/home/git/repos/git-demo.git`

如果下次想要继续新建更多仓库,继续初始化本地仓库,客户端克隆完成最简单的工作流程.

```bash
# 初始化 git 裸仓库
git init --bare git-demo-again.git

# 更改 git-demo.git 仓库属主
chown -R git:git git-demo-again.git
```

作为服务端的远程仓库只需要初始化本地仓库即可,剩下的工作交由客户端克隆.


```bash
git clone git@snowdreams1006.cn:git-demo-again.git
```

## 访问授权

总是存在一些公司不仅视源代码为生命,还视员工为窃贼,抑或是深受`svn`毒害,要求在版本控制系统中设置一套完善的权限控制体系,具体到每个账号对每个项目的每个目录是否有读写权限.
然而 `git` 天生并不支持权限控制,这一点和其出身有关,本来就是为了开源而生,并不关心所有人的提交.
不过这并不意味着 `git` 无法实现权限控制功能,因为 `git` 支持钩子函数(`hook`) ,所以在服务器端编写一系列的脚本控制提交行为,从而实现权限控制.详情请参考 [gitolite](https://github.com/sitaramc/gitolite)


## 本地克隆远程仓库

身份回到本地电脑,假设本地已搭建好 `git` 环境,并且生成的`ssh` 公钥上传到远程服务器,那么我们接下来就可以和之前远程服务器是 `github` 网站那样的方式开发我们的项目了,唯一不同的是,接下来我们推送的远程服务器均是我们刚搭建好的主机.

需要做好心里准备,我们搭建的服务器还很简单,没有 `github` 网站那样可以直观操作远程仓库,但是这并不影响我们的 `pull push merge` 等操作哟!

```
git clone git@snowdreams1006.cn:/home/git/repos/git-demo.git
```

> git-指的是 git 用户,snowdreams1006.cn-指的是远程主机域名或ip,/home/git/repos-指的是 git 仓库的目录,git-demo.git-指的是项目名称

现在我们已经成功搭建好自己的 `git`私服了,是不是很简单呢?有没有对 `git` 和 `github` 进一步理解?欢迎大家一起探讨!

## 小结

- `git` 私服就是无 web 界面的简化版 `github`
- 小团队人工收集用户公钥,大团队使用 [gitosis](https://github.com/res0nat0r/gitosis)
- 实现类似 `svn` 那样的权限控制请使用 [gitolite](https://github.com/sitaramc/gitolite)
