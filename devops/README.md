# 运维部署

> https://blog.csdn.net/li528405176/article/details/82810342

## 密码登录

- 登录

```bash
$ ssh <登录账号>@<服务器公网 ip>
```

> `ssh root@121.40.223.69`

- 退出

我们可以通过 `Ctrl+D` 或者 `exit` 命令退出登录

> https://juejin.im/post/5dad7681f265da5bb86ad2f5

## 密钥登录

- 本机生成秘钥

```bash
$ ssh-keygen -t rsa
```

- 上传公钥到服务器

```bash
$ ssh-copy-id <登录账号>@<服务器公网 ip>
```

- 免密登录

```bash
$ ssh <登录账号>@<服务器公网 ip>
```

## linux 版本和 centos 版本

- 查看系统版本

```bash
$ uname -a
```

- 查看 centos 版本号

```bash
$ cat /etc/centos-release
```

