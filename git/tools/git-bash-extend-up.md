# git bash 扩展命令(上)

## 什么是 `git bash`

`git bash` 是 `Windows` 系统安装 `git` 时默认集成的命令行工具,可以执行一系列的 `git` 命令.

![git-bash-extend-up-gitversion.png](../images/git-bash-extend-up-gitversion.png)

如果不熟悉命令行操作的话,`git bash` 还有个双胞胎兄弟叫做 `git gui`,默认情况下两兄弟会同时安装.

![git-bash-extend-up-gitgui.png](../images/git-bash-extend-up-gitgui.png)

如果选中文件右键没有弹出 `Git Bash Here` 和 `GIt GUI Here` 选项的话,可能安装 `Git` 时没有集成这两个工具,请检查安装 `Git` 时下图是否已经勾选!

![git-bash-extend-up-setupconfig.png](../images/git-bash-extend-up-setupconfig.png)


不论是命令行工具还是图形化工具,两者都是提供服务的一种方式,不应该是排他性而应该是互补性.

当然,如果涉及到某些命令而恰恰有没有相应的图形化选项时,那么图形化工具就无能为力,正是命令行工具大显身手的好机会!

## `git bash` 和 `cmd` 

`git bash` 是命令行工具,提供了内置终端,不仅可以运行 `git` 命令还可以运行基本的 `linux` 命令.

但是,用过 `Windows` 电脑的小伙伴可能或多或少都听说过 `Windows` 电脑默认也自带了一个命令行工具,也就是 `cmd` 工具.

唤出 `cmd` 的方式不如 `git bash` 那么直观方便,需要调用快捷键 `Win + R` 然后输出 `cmd` ,也是命令行工具.

![git-bash-extend-up-cmd-gitversion.png](../images/git-bash-extend-up-cmd-gitversion.png)

既然两者都是命令行工具,那么为什么 `Git Bash` 要重复造轮子?直接用 `cmd` 不行吗?







