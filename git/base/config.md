# 配置

## 文件
`git` 提供`git config`工具,专门用来配置相应的工作环境变量,支持三种不同的位置.

- `/etc/gitconfig`  配置文件 (优先级最低)

系统中对所有用户都生效的配置,效果等同于`git config --system`

- `~/.gitconfig` 配置文件 (优先级其次)

系统中仅仅对当前登录用户生效的配置,效果等同于`git config --global`

- `$(pwd)/.git/config` 配置文件 (优先级最高)

仅仅对当前项目生效,效果等同于`git config`

>每一级别的配置都会自动覆盖上级相同配置,当前项目配置优先于其余配置





安装完成后,还需要最后一步设置,在命令行输入：

```
git config --global user.name "your username"
git config --global user.email "example@example.com"
```

因为Git是分布式版本控制系统，所以，每个机器都必须自报家门：你的名字和Email地址。你也许会担心，如果有人故意冒充别人怎么办？这个不必担心，首先我们相信大家都是善良无知的群众，其次，真的有冒充的也是有办法可查的。

注意git config命令的--global参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置，当然也可以对某个仓库指定不同的用户名和Email地址。