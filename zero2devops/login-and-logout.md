# 登录和登出远程服务器

## 环境准备

### 服务器要求

如果你现在并没有服务器,不妨在电脑上装个**虚拟机**体验一下其他操作系统,具体可以参考之前的推文:

#### `Window` 用户

- [给你的计算机一种全新的体验](https://mp.weixin.qq.com/s/7_ZxBsxlMoCIr-Qcw1G8Qg)

> 主要介绍了什么是虚拟机以及实例演示如何给 `Windows` 电脑装个 `VMware` 虚拟机.

- [给 windows 虚拟机装个 centos](https://mp.weixin.qq.com/s/7_ZxBsxlMoCIr-Qcw1G8Qg)

> 在 `Windows` 电脑已经装好 `VMware`虚拟机的基础上,装个 `Centos` 镜像就拥有了自己的 `Centos` 服务器.

#### `Mac` 用户

- [工具资源系列之给mac装个虚拟机](https://mp.weixin.qq.com/s/ToXjx06xlehHpsCcfOWliw)

> 主要介绍了什么是虚拟机以及实例演示如何给 `Mac` 电脑装个 `VMware` 虚拟机.

- [工具资源系列之给虚拟机装个centos](https://mp.weixin.qq.com/s/D1Fdpp2vcBnX0eVbMzPV1A)

> 在 `Mac` 电脑已经装好 `VMware`虚拟机的基础上,装个 `Centos` 镜像就拥有了自己的 `Centos` 服务器.


### 客户端要求

因为登录服务器需要使用到 `ssh` 协议,所以首先需要验证本机客户端命令行是否支持 `ssh` 协议.

打开你正在使用的命令行,直接输入 `ssh` 如果有下列提示证明是可以的,如果没有请安装支持 `ssh` 协议命令行终端.

如果你是 `Mac` 用户,打开默认的 `terminal` 终端输入 `ssh` 返回用法说明,证明是支持 `ssh` 协议的.

```bash
snowdreams1006$ ssh
usage: ssh [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface]
           [-b bind_address] [-c cipher_spec] [-D [bind_address:]port]
           [-E log_file] [-e escape_char] [-F configfile] [-I pkcs11]
           [-i identity_file] [-J [user@]host[:port]] [-L address]
           [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
           [-Q query_option] [-R address] [-S ctl_path] [-W host:port]
           [-w local_tun[:remote_tun]] destination [command]
```

> `Mac` 自带的 `terminal` 终端是支持 `ssh` 协议的,`Windows` 的 `Git Bash` 命令行也是支持的!

如果你是 `Windows` 用户正在使用 `cmd` 命令行窗口,很遗憾并不支持 `ssh` 协议,请自行选择类 `unix` 终端进行操作.

```cmd
Microsoft Windows [版本 6.1.7601]
版权所有 (c) 2009 Microsoft Corporation。保留所有权利。

C:\Users\Administrator>ssh
'ssh' 不是内部或外部命令，也不是可运行的程序
或批处理文件。

C:\Users\Administrator>
```

> `Windows` 用户不妨安装 [Git for Windows](https://git-scm.com/download/win) ,默认自带的 `Git Bash` 命令行就很好用,比 `cmd` 终端更加简单优雅,给你一种类 `unix` 操作体验.

## 命令行登录

### 本机环境

```bash
rm -rf ~/.ssh/known_hosts
```

> [linux 远程连接ssh提示IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY解决](https://blog.csdn.net/watsy/article/details/12611919)

- 密码登录

> 直接登录

```bash
$ ssh <登录账号>@<服务器公网 ip>
```

> `ssh root@snowdreams1006.cn`

> 禁用密码登录

> `/etc/ssh/ssh_config`

```config
Host *
  PasswordAuthentication no
```

- 密钥登录

```bash
$ ssh-keygen -t rsa
```

```bash
$ ssh-copy-id <登录账号>@<服务器公网 ip>
```

> `ssh-copy-id root@snowdreams1006.cn`

```bash
$ ssh <登录账号>@<服务器公网 ip>
```

> `ssh root@snowdreams1006.cn`

- 简化登录

```
Host <主机 id>
User <登录账号>
HostName <主机名称>
```

```
Host github.com
User snowdreams1006
Hostname ssh.github.com

Host snowdreams1006.cn
User root
Hostname ssh.snowdreams1006.cn
```

```bash
$ ssh <主机 id>
```

> `ssh snowdreams1006.cn`

## 图形化登录


## 云服务登录

远程连接->连接密码->用户名/密码

## 参考文档

- [CentOS下开启SSH Server服务](https://www.cnblogs.com/DiDiao-Liang/articles/8283686.html)
- [linux 远程连接ssh提示IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY解决](https://blog.csdn.net/watsy/article/details/12611919)
- [SSH简介及两种远程登录的方法](https://blog.csdn.net/li528405176/article/details/82810342)
- [服务器快速免密ssh登录配置](https://juejin.im/post/5da724506fb9a04e2a73d96c)
- [linux 信息查看及命令](https://juejin.im/post/5dad7681f265da5bb86ad2f5)


