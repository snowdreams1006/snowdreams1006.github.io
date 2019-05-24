# git bash 扩展命令(下)

## 剧情回顾

在上一节中我们已经介绍了两种方式来扩展 `git bash` 命令,解决了一般性命令不足的问题,最后我们还留下了一个疑问,如果两种方式均无法扩展某些命令又该怎么办?

再介绍最后一个大招之前,我们首先来回忆一下前面两种扩展方式.

- `bash` 不足 `cmd` 来凑

`git bash` 命令行终端和 `windows` 系统自带的 `cmd` 命令行终端互为补充,某些 `git bash` 命令没有并不意味着 `cmd` 也没有,所以遇到 `git bash` 无某些命令的情况下,首先应该去看看 `cmd` 有没有这个命令.

如果碰巧 `cmd` 存在该命令,那么既可以在 `cmd` 中直接运行该命令,也可以在 `git bash` 中借助 `winpty + cmd 原生命令` 方式调用该命令.

示例: 

```
F:\workspace\git-bash-extend>tree
卷 常用 的文件夹 PATH 列表
卷序列号为 62AE-62CA
F:.
├─extend-cmd
├─extend-gitforwindows-sdk
└─extend-gnuwin
```

> `cmd` 命令行中有 `tree` 命令,不过该命令的后缀名是 `.com` 而不是 `.exe`.

```bash
Administrator@snowdreams1006 MINGW64 /f/workspace/git-bash-extend
$ winpty tree.com
卷 常用 的文件夹 PATH 列表
卷序列号为 62AE-62CA
F:.
├─extend-cmd
├─extend-gitforwindows-sdk
└─extend-gnuwin
``` 

> `git bash` 命令行中没有 `tree` 命令,通过调用 `cmd` 命令行中的 `tree.com` 命令变相支持 `tree` 命令.

- `bash` 没有 `gnuWin` 填补

如果 `git bash` 命令行中没有的命令,`cmd` 也没有的话,那么应该想办法扩展 `git bash` 命令,最简单的方式是找同源的命令.

正所谓"物以类聚人以群分",如果有现成的命令可以直接扩展过来,岂不是很方便,幸运的是,`gnuwin` 开源项目适用于 `git`!

我们可以从 [gnuwin32](https://sourceforge.net/projects/gnuwin32/files/) 项目下载所需的扩展命令并复制到 `git bash` 的安装位置下面的 `/usr/bin` 目录下即可轻松扩展更多命令.

示例:

```bash
Administrator@snowdreams1006 MINGW64 /f/workspace/git-bash-extend
$ tree
.
├── extend-cmd
│   └── cmd.md
├── extend-gitforwindows-sdk
│   └── gitforwindows-sdk.md
└── extend-gnuwin
    └── gnuwin.md

3 directories, 3 files
```

> 轻松扩展的 `tree` 命令,功能更强大更像 `linux` 系统的 `tree` 命令.

## 回顾问题

如果没有第三方**现成的**命令文件供我们轻松扩展,意味着前面两种方式均已失效!

如果真的遇到这种情况,一般会有两种方式来解决问题.

- 直接放弃,寻找新的替代方案
- 定制开发,创造自定义解决方案

两种方案没有谁对谁错,应该根据自身情况选择适合自己的哪一种,针对 `git bash` 命令不足的问题,我们具体分析一下是否可行.

## 直接放弃,另寻新欢

如果选择方案一,意味着我们需要放弃 `git bash` 命令行工具并寻求新的替代方案,也就是说我们首先需要弄清楚两个问题.

- 能不能直接放弃 `git bash` 命令行

`Git Bash` 是命令行工具,是为了使用 `git` 而默认提供的命令行工具,与此同时,`Git Bash` 还有一个双胞胎兄弟叫做 `Git GUI` 图形化工具.

![git-bash-extend-down-gitbash-and-gitgui-install.png](../images/git-bash-extend-down-gitbash-and-gitgui-install.png)

由此可见,`Git Bash` 并不是 `Git` 的关键核心,可有可无的工具类而已.

![git-bash-extend-down-gitbash-and-gitgui-use.png](../images/git-bash-extend-down-gitbash-and-gitgui-use.png)

- 寻找哪一款替代方案?

既然已经决定放弃了 `git bash` 命令行,那么我们就要找一个功能更加强大的命令行工具来替代 `git bash`.

但是,`windows` 始终是 `windows` ,是不可能真正变成 `linux` 系统的,所以我们要寻找的第三方工具充其量也是一种模拟系统而已.

市面上,`windows` 的命令行工具有很多,有些是单纯的命令行工具有的是虚拟系统工具,但是不管怎么样,我们这一次要选择的命令行工具一定要满足以下几点.

- 方便集成 `git` 服务,这是初衷,不可违背.
- 命令行语法类似 `linux` 语法,降低学习成本.
- 自带包安装工具,这是最关键部分也是 `git bash` 没有提供的部分.
- 安装配置简单,无需繁琐的配置即可轻松上手.

根据以上几点,推荐一款 `Babun` 工具,正如官方标语宣传的那样,一款一会爱上的`Windows Shell` .

![git-bash-extend-down-babun-official.png](../images/git-bash-extend-down-babun-official.png)

> [Babun](https://babun.github.io/) : a Windows shell you will love!

当然除了上述基本要求外,再谈一谈为什么推荐这一款软件?

- 安装简单,下载安装包执行安装脚本自动安装配置.
- 自带包管理工具,且静默安装无需过多交互式询问.
- 基于 `Cygwin` 预配置大量常用插件,包括 `git` 和 `shell`.
- 默认终端模拟器是 `Mintty`,支持两种类型的 `shell`,分别是 `bash` 和 `zsh`.

> 翻译成人话就是: `Babun` 和 `Git Bash` 一脉相承,不仅是亲戚还是近亲,`Babun` 比 `Git Bash` 体积更大,功能更强.

### `babun` 初体验

[下载 babun](http://projects.reficio.org/babun/download) 并解压缩,然后双击 ` install.bat` 脚本进行自动化安装.

![git-bash-extend-down-babun-install.png](../images/git-bash-extend-down-babun-install.png)

自动安装成功后会自动创建桌面快捷方式并输出 `babun` 基本信息.

![git-bash-extend-down-babun-success.png](../images/git-bash-extend-down-babun-success.png)

### 配置你的新欢

- 配置 `git` 

默认已经集成 `git` ,因此我们可以像 `git bash` 那样使用 `git`.

```bash
{ ~ }  » git --version                                                                          ~
git version 2.1.4
```

接下来进行一些关于 `git` 的常规配置,彻底拥抱 `babun`.

```bash
# 添加用户名和邮箱
git config --global user.name "your name"
git config --global user.email "your@email.com"

# gitalias 插件提供的 git 别名配置项
gitalias['alias.cp']='cherry-pick'
gitalias['alias.st']='status -sb'
gitalias['alias.cl']='clone'
gitalias['alias.ci']='commit'
gitalias['alias.co']='checkout'
gitalias['alias.br']='branch'
gitalias['alias.dc']='diff --cached'
gitalias['alias.lg']="log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all"
gitalias['alias.last']='log -1 --stat'
gitalias['alias.unstage']='reset HEAD --'
```

- 更改默认 `shell`

```bash
# 查看当前shell类型: zsh
{ ~ }  » babun shell                                                                            ~
/bin/zsh

# 切换当前shell类型: zsh -> bash
{ ~ }  » babun shell /bin/bash                                                                  ~
/bin/zsh
/bin/bash
```

- 自定义配置

命令行窗口内通过命令运行的配置命令一般都是临时性的,下次电脑重启或者新开命令行窗口就会失效,如果想要永久性生效,一般会将配置写入到配置文件中,`babun` 也不例外,配置文件默认存放于 `~/.babunrc`

```bash
# JVM options
export JAVA_OPTS="-Xms128m -Xmx256m"

# Modify these lines to set your locale
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Uncomment these lines to the set your machine's default locale (and comment out the UTF-8 ones)
# export LANG=$(locale -uU)
# export LC_CTYPE=$(locale -uU)
# export LC_ALL=$(locale -uU)

# Uncomment this to disable daily auto-update & proxy checks on startup (not recommended!)
# export DISABLE_CHECK_ON_STARTUP="true"

# Uncomment to increase/decrease the check connection timeout
# export CHECK_TIMEOUT_IN_SECS=4

# Uncomment this lines to set up your proxy
# export http_proxy=http://user:password@server:port
# export https_proxy=$http_proxy
# export ftp_proxy=$http_proxy
# export no_proxy=localhost
```

> 如果当前用户家目录下没有 `.babunrc` 配置文件,运行 `touch ~/.babunrc` 自行创建该配置文件即可.

### 体验新欢之美

`babun` 看起来像是我们真的运行在 `linux` 系统一样,那么流畅顺滑,是一款遇上再也不会错过的`Windows Shell` .

```bash
# tree 命令 babun 有
{ ~ }  » tree                                                                                   ~
.
├── a
├── bin -> /home/vm-win7/.local/bin
└── will

1 directory, 2 files

# wget 命令 babun 也有
{ ~ }  » wget www.baidu.com                                                                     ~
--2019-05-24 14:33:01--  http://www.baidu.com/
Resolving www.baidu.com (www.baidu.com)... 115.239.211.112, 115.239.210.27
Connecting to www.baidu.com (www.baidu.com)|115.239.211.112|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://www.baidu.com/ [following]
--2019-05-24 14:33:02--  https://www.baidu.com/
Connecting to www.baidu.com (www.baidu.com)|115.239.211.112|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: ‘index.html’

index.html                   [ <=>                                 ] 152.70K  --.-KB/s   in 0.05s

2019-05-24 14:33:02 (2.98 MB/s) - ‘index.html’ saved [156365]     
```

> 不论是 `tree` 命令还是 `wget` 命令,`babun` 默认全部集成,这下真的要彻底替代 `cmd` 了呢!

但是,不知道你是否注意到在推荐 `babun` 时,我们曾经说过 `babun` 和 `git bash` 不仅是亲戚而且还是近亲.

这句话又从何谈起?

首先,`babun` 是基于 `Cygwin`,`git bash` 或者说 `git for windows` 也是基于 `Cygwin`,两者一脉相承.
再者,`babun` 支持 `shell` 和 `zsh` 两种 `shell`,而 `git for windows` 仅支持 `bash`.
还有,`babun` 和 `git for windows` 的默认终端都是 `mintty` 模拟器.

最后一点是差异性比较大的,`babun` 是直接基于 `Cygwin` 而 `git for windows` 则是间接基于 `Cygwin` ,两者确实存在一定的差异性!

再问最后一个问题,我们为什么要使用 `Cygwin` 而抛弃 `git bash` ?

那是因为 `git bash` 默认提供的命令有限却又没有提供相应的**包管理工具**,导致我们无法自定义扩展更多命令.

所以,我们何不试一试 `babun` 的包管理工具呢?

- 包管理工具帮助文档

```bash
{ ~ }  » pact --help                                                                            ~
pact: Installs and removes Cygwin packages.

Usage:
  "pact install <package names>" to install given packages
  "pact remove <package names>" to remove given packages
  "pact update <package names>" to update given packages
  "pact show" to show installed packages
  "pact find <patterns>" to find packages matching patterns
  "pact describe <patterns>" to describe packages matching patterns
  "pact packageof <commands or files>" to locate parent packages
  "pact invalidate" to invalidate pact caches (setup.ini, etc.)
Options:
  --mirror, -m <url> : set mirror
  --invalidate, -i       : invalidates pact caches (setup.ini, etc.)
  --force, -f : force the execution
  --help
  --version
```

- 安装第三方命令

```bash
{ ~ }  » pact install arj                                                                     ~ 2
Working directory is /setup
Mirror is http://mirrors.kernel.org/sourceware/cygwin/
--2019-05-24 14:26:46--  http://mirrors.kernel.org/sourceware/cygwin//x86/setup.bz2
Resolving mirrors.kernel.org (mirrors.kernel.org)... 198.145.21.9, 2001:19d0:306:6:0:1994:3:14
Connecting to mirrors.kernel.org (mirrors.kernel.org)|198.145.21.9|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3893609 (3.7M) [application/x-bzip2]
Saving to: ‘setup.bz2’

setup.bz2                100%[====================================>]   3.71M  5.89KB/s   in 4m 5s

2019-05-24 14:30:51 (15.5 KB/s) - ‘setup.bz2’ saved [3893609/3893609]

Updated setup.ini

Installing arj
Found package arj
--2019-05-24 14:30:52--  http://mirrors.kernel.org/sourceware/cygwin//x86/release/arj/arj-3.10.22-3.tar.xz
Resolving mirrors.kernel.org (mirrors.kernel.org)... 198.145.21.9, 2001:19d0:306:6:0:1994:3:14
Connecting to mirrors.kernel.org (mirrors.kernel.org)|198.145.21.9|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 134244 (131K) [application/x-xz]
Saving to: ‘arj-3.10.22-3.tar.xz’

arj-3.10.22-3.tar.xz     100%[====================================>] 131.10K  5.02KB/s   in 17s

2019-05-24 14:31:10 (7.61 KB/s) - ‘arj-3.10.22-3.tar.xz’ saved [134244/134244]

Unpacking...
Package arj requires the following packages, installing:
cygwin
Package cygwin is already installed, skipping
Package arj installed
```

- 卸载第三方命令

```bash
{ ~ }  » pact remove arj                                                                        ~
Removing arj
Package arj removed
```

> `babun` 在手,`linux` 我有!妈妈再也不用担心我的 `Windows Shell` 不好用了!

## 忠贞不二,开发扩展

方案一让我们另寻新欢,方案二让我们坚持己见,面对问题不逃避而是想办法解决.

再一次回忆一下需要解决的问题: `git bash` 命令行默认没有提供**包管理工具**以至于我们只能使用已集成的命令,所以不支持自定义扩展命令.

### 解铃还须系铃人

`git bash` 是 `git` 的命令行工具,而 `git` 原来仅仅支持 `linux` 系统,后来又支持了 `windows` ,值得注意的是,这种所谓的支持并不是原生支持,而是**变相支持**.

如果你打开 `git` 的官网 [https://git-scm.com/download](https://git-scm.com/download),你会发现 `git` 也是跨平台的呢,竟然支持 `mac` ,`windows` 和 `linux` 三大主流操作系统!

然而,真相却不是这样的,`windows` 平台的 `git` 其实不是真正的 `git`,或者说 `windows` 和另外两个并不是一家人.

首先看一下 `Mac OS X` 的下载页面介绍,请注意源码地址: [https://github.com/git/git/](https://github.com/git/git/)

![git-bash-extend-down-gitformac-download.png](../images/git-bash-extend-down-gitformac-download.png)


源码托管于 `github`,是 `git` 组织下面的 `git` 项目,其项目地址是 [https://github.com/git/git/](https://github.com/git/git/)

![git-bash-extend-down-gitformac-sourcecode.png](../images/git-bash-extend-down-gitformac-sourcecode.png)

接下来我们再看一下 `Linux and Unix` 的下载页面,虽然下载页面推荐我们使用包管理工具进行安装,但仍然给我提供了源码地址: [https://www.kernel.org/pub/software/scm/git/](https://www.kernel.org/pub/software/scm/git/)

![git-bash-extend-down-gitforlinux-download.png](../images/git-bash-extend-down-gitforlinux-download.png)

虽然源码下载地址不是 `github`,但是我们却可以从项目地址中窥见一斑,仍然属于 `scm/git/` 项目,也是亲儿子.

![git-bash-extend-down-gitforlinux-sourcecode.png](../images/git-bash-extend-down-gitforlinux-sourcecode.png)

如果 `mac` 和 `linux` 是 `git` 原生支持的亲儿子,那么 `windows` 则是变相支持的干儿子.

![git-bash-extend-down-gitforwindows-download.png](../images/git-bash-extend-down-gitforwindows-download.png)

`windows` 和 `mac` 一样,源码同样托管在 `github`,但是地址却不一样!项目地址: [https://github.com/git-for-windows/git](https://github.com/git-for-windows/git)

![git-bash-extend-down-gitforwindows-sourcecode.png](../images/git-bash-extend-down-gitforwindows-sourcecode.png)

这下局面瞬间清楚了,`git for windows` 并不是 `git` **原生支持**的 `windows` 版本,或者说 `windows` 系统的 `git` 是另外一个团队开发的,这个开发团队就是 `git for windows`.

