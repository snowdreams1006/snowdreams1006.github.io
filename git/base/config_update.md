# 配置 git

安装完成后,还需要最后一步配置就可以愉快使用了,在命令行输入：

```
git config --global user.name "your username"
git config --global user.email "example@example.com"
```

因为Git是分布式版本控制系统,所以每个机器都必须自报家门:你的名字和Email地址.

## 配置文件

`git` 提供`git config`工具,专门用来配置相应的工作环境变量,支持三种不同的位置.

- `/etc/gitconfig`  配置文件 (优先级最低)

系统中对所有用户都生效的配置,效果等同于`git config --system`

- `~/.gitconfig` 配置文件 (优先级其次)

系统中仅仅对当前登录用户生效的配置,效果等同于`git config --global`

- `$(pwd)/.git/config` 配置文件 (优先级最高)

仅仅对当前项目生效,效果等同于`git config`

>每一级别的配置都会自动覆盖上级相同配置,当前项目配置优先于其余配置

## 查看配置

如果要查看已有的配置信息,可以输入 `git config --list` 命令,如果看到重复变量名,表示来自不同配置文件(比如`/etc/gitconfig` 和 `~/.gitconfig`),实际上`git`会采用**最后一个**!

```
# 查看已有配置信息
git config --list

# 查看当前用户配置信息
cat ~/.gitconfig

# 查看系统级别配置信息
cat /etc/gitconfig
```

也可以直接查看某项环境变量值,比如

```
# 查看用户名称变量
git config user.name
```




