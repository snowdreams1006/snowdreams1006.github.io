# 登录和登出远程服务器

## 环境准备

### 服务器要求

如果你已经有云服务器或者虚拟机服务器,首先需要验证服务器上是否已经安装 `ssh` 服务,如果没有安装则需要提前安装.

登录服务器后,在命令行窗口中输入 `rpm -qa | grep ssh` 查看是否包括 `ssh` 相关文件.

```bash
[root@snowdreams1006 ~]# rpm -qa | grep ssh
openssh-clients-7.4p1-16.el7.x86_64
libssh2-1.4.3-12.el7_6.2.x86_64
openssh-server-7.4p1-16.el7.x86_64
openssh-7.4p1-16.el7.x86_64
```

默认情况下运行 `netstat -antp | grep sshd` 命令,可以看到 `sshd` 服务监听的端口正是默认的 `22` 端口.

```bash
[root@snowdreams1006 ~]# netstat -antp | grep sshd
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1051/sshd           
tcp        0      0 *.*.*.*:22        *.*.*.*:46797   ESTABLISHED 17334/sshd: root@pt 
```

其实一般云服务器均已预装好 `ssh` 服务,如果没有上述输出,则说明可能并没有安装 `ssh` 服务,可以使用 `yum install openssh-server` 进行安装.

下面总结一些关于 `sshd` 的常用命令,如下

- 查看 `sshd` 运行状态

```bash
systemctl status  sshd
```

如果运行结果包括 `Active: active (running)` 则证明 `sshd` 服务处于激活状态,如果是 `Active: inactive (dead)` 则表示服务已关闭.

```bash
[root@snowdreams1006 ~]# systemctl status  sshd
● sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
   Active: active (running) since 五 2019-11-29 21:05:08 CST; 16h ago
     Docs: man:sshd(8)
           man:sshd_config(5)
 Main PID: 1051 (sshd)
    Tasks: 1
   Memory: 10.9M
   CGroup: /system.slice/sshd.service
           └─1051 /usr/sbin/sshd -D
```

- 启动|关闭|重启 `sshd` 服务

```bash
systemctl start  sshd
```

> 针对处于已经关闭 `sshd` 状态时,可以再次启动,如果已经启动,则不会输出结果,但还是启动中.

```bash
systemctl stop  sshd
```

> 针对处于正在运行 `sshd` 状态时,可以停止服务,如果已经停止,则不会输出结果,但还是停止中.

```bash
systemctl restart  sshd
```

> 针对处于正在运行 `sshd` 状态或者已经停止状态时,可以重启服务,虽然都不会输出结果,但已经启动.

- 开机自启|禁止自启 `sshd` 服务

```bash
systemctl list-unit-files | grep enabled
```

> 查看全部开机自启服务,如果包括 `sshd` 则表示 `sshd` 已加入开机自启服务,如果没有则不会开机自启.

```bash
systemctl list-unit-files | grep enabled | grep sshd
```

> 如果全部开机自启服务比较多的话,肉眼不太直接看出 `sshd` 是否自启,在上一条命令的基础上多加一个 `grep sshd` 即可过滤是否包含 `sshd` 服务.

```bash
systemctl enable sshd
```

> 开机自启服务,如果某些服务非常重要需要一直后台运行的话,最好加入开机自启,这样能防止意外关机重启服务器后忘记开启服务,比如 `sshd` 服务和 `docker` 服务等等.

```bash
systemctl disable sshd
```

> 针对已经开机自启服务进行禁用,运行 `systemctl list-unit-files | grep enabled | grep sshd` 可以查看当前服务是否会开机自启.

如果你现在还没有服务器但又想学习体验一下,要么**立即花钱**去买服务器要么**免费安装**虚拟机,或者先收藏起来以后再看!

针对立即购买服务器的小伙伴,请私信联系我,用我的推广链接购买,你有优惠,我有分成,何乐而不为呢?

> [我要购买云服务器](https://webhook.snowdreams1006.cn/hooks/query?title=有人打算购买云服务器啦&body=赶紧去查一下阿里云服务器购买链接私信告诉他/她!),最好还是留言或者私信告诉我!

针对免费安装虚拟机体验的用户,可以根据自己的操作系统,参考以下推文进行安装,有问题也可以联系我!

> [我想安装虚拟机](https://webhook.snowdreams1006.cn/hooks/query?title=有人想要安装虚拟机&body=赶紧去查一下虚拟机安装教程!),最好还是留言或者私信告诉我!

- [给你的计算机一种全新的体验](https://mp.weixin.qq.com/s/7_ZxBsxlMoCIr-Qcw1G8Qg)

> 主要介绍了什么是虚拟机以及实例演示如何给 `Windows` 电脑装个 `VMware` 虚拟机.

- [给 windows 虚拟机装个 centos](https://mp.weixin.qq.com/s/7_ZxBsxlMoCIr-Qcw1G8Qg)

> 在 `Windows` 电脑已经装好 `VMware`虚拟机的基础上,装个 `Centos` 镜像就拥有了自己的 `Centos` 服务器.

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
- [Linux 7开机自启项查看并设置](https://www.cnblogs.com/Cherry-Linux/p/11129334.html)
- [SSH简介及两种远程登录的方法](https://blog.csdn.net/li528405176/article/details/82810342)
- [服务器快速免密ssh登录配置](https://juejin.im/post/5da724506fb9a04e2a73d96c)
- [linux 信息查看及命令](https://juejin.im/post/5dad7681f265da5bb86ad2f5)


