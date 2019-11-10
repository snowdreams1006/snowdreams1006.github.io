# 运维部署

## 密码登录

- 登录

```bash
$ ssh <登录账号>@<服务器公网 ip>
```

示例:

> `ssh root@121.40.223.69`

- 退出

我们可以通过 `Ctrl+D` 或者 `exit` 命令退出登录

## 密钥登录

- 本机生成密钥

```bash
$ ssh-keygen -t rsa
```

- 上传公钥到服务器

```bash
$ ssh-copy-id <登录账号>@<服务器公网 ip>
```

示例:

> `ssh-copy-id root@121.40.223.69`

- 免密登录

```bash
$ ssh <登录账号>@<服务器公网 ip>
```

示例:

> `ssh root@121.40.223.69`

## 简化登录

- 修改 `ssh` 配置文件 ` ~/.ssh/config`

```config
Host <名称 id>
    HostName <服务器公网 ip>
    User <登录账号>
```

示例:

```config
Host snowdreams1006
    HostName 121.40.223.69
    User root
```

- 快速登录

```bash
$ ssh <名称 id>
```

示例:

> `ssh snowdreams1006`

## 推荐登录

- 修改 `ssh` 配置文件 ` ~/.ssh/config`

```config
Host <名称 id>
    HostName <服务器公网 ip>
    User <登录账号>
```

示例:

```config
Host snowdreams1006
    HostName 121.40.223.69
    User root
```

-  本机生成密钥

```bash
$ ssh-keygen -t rsa
```

- 上传公钥到服务器

```bash
$ ssh-copy-id <登录账号>@<服务器公网 ip>
```

示例:

> `ssh-copy-id root@121.40.223.69`

- 远程登录

```bash
$ ssh <HostName>
```

示例:

> `ssh snowdreams1006`

- 禁用密码登录

> `/etc/ssh/ssh_config`


```config
Host *
  PasswordAuthentication no
```

## 系统版本

- 查看系统版本

```bash
$ uname -a
```

- 查看 centos 版本号

```bash
$ cat /etc/centos-release
```

## 内存配额

```bash
$ free -h
```

## 公网 ip

- `ifconfig.me`

```bash
$ curl ifconfig.me
```

- `icanhazip.com`

```bash
$ curl icanhazip.com
```

## 内网 ip

```bash
$ ifconfig eth0
```

## 登录用户

- `who`

```bash
$ who -u
```

- `last`

```bash
$ last -a | head -5
```

## 参考文档

- [SSH简介及两种远程登录的方法](https://blog.csdn.net/li528405176/article/details/82810342)
- [服务器快速免密ssh登录配置](https://juejin.im/post/5da724506fb9a04e2a73d96c)
- [linux 信息查看及命令](https://juejin.im/post/5dad7681f265da5bb86ad2f5)

