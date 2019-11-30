# 登录和登出远程服务器

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


