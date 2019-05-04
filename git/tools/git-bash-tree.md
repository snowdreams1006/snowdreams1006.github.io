# git bash 没有tree命令?

## 开门见山

`git bash` 是 `Windows` 用户安装 `git` 时默认安装的命令行工具,不仅界面漂亮功能也不错,大多数情况下可以替代 `Windows` 原生的 `cmd` 命令行.

然而,`git bash` 命令行不是万金油,并不能完全替代 `cmd` ,详情请参考 `mintty` 官网的[相关说明](https://mintty.github.io/#Compatibility).

![git-bash-tree-mintty.png](../images/git-bash-tree-mintty.png)

> mintty is not a full replacement for the Windows Console window

`git bash` 命令行默认使用 `mintty` 作为终端模拟器,而 `mintty` 官宣表示自己不能完全替代 `cmd`,也就是说 `git bash` 可能不具备某些 `cmd` 命令.

![git-bash-setup-terminal.png](../images/git-bash-setup-terminal.png)

举个简单的例子,如果想要查看当前目录的文件结构,最好是以目录树的形式展现,聪明的你获取已经猜到了`tree` 命令.

`git bash` 命令行中输入 `tree` 命令发现并无此命令.

```bash
snowdreams1006@home MINGW64 /g/sublime/test
$ tree
bash: tree: command not found
```

为了验证,确实没有 `tree` 命令,我们直接打开 `git bash` 支持的命令文件目录,查看到底有没有 `tree.exe` 文件.

![git-bash-bin.gif](../images/git-bash-bin.gif)

> 在 `git bash` 桌面快捷方式**右键**,选择**打开文件位置**,当前正处于 `git` 的安装目录,进入`.\usr\bin` 文件夹.

经过验证,`git bash` 支持的命令文件确实没有发现 `tree.exe` 文件,因此真的不支持 `tree` 命令.

然而,`cmd` 自带的命令行中输入 `tree` 中竟然发现能够输出目录树,原来 `cmd` 支持 `tree` 命令.

```bash
G:\sublime\test>tree
卷 工作 的文件夹 PATH 列表
卷序列号为 00000081 CC3C:50D0
G:.
├─cmd
└─git
```

![git-bash-tree-cmd.png](../images/git-bash-tree-cmd.png)

> `tree` 命令其实调用的是 `tree.com` 并不是常见的 `tree.exe` 格式.

## 科普时间

现在我们已经知道 `git bash` 提供的终端模拟器不支持某些 `linux` 命令,但是为什么不支持以及如何才能支持这些命令呢?


这些问题必须等我们弄清楚 `mintty` 的朋友圈关系才能更好地解决上述问题,接下来简单科普下 `mintty` 的朋友圈.

> 关于科普知识的来源,请参考上一篇文章: <<git bash 背后的朋友圈>>

### `mintty` 究竟是什么

> `Mintty` 是 `Cygwin`，`MSYS` 或 `Msys2` 的终端模拟器,派生项目和 `WSL`.

`mintty` 开源终端模拟器,基于 `putty` 的终端仿真和 `Windows` 前端页面.

![git-bash-tree-mintty-homepage.png](../images/git-bash-tree-mintty-homepage.png)

### `git bash` 和 `mintty` 关系

`mintty` 是优秀的终端模拟器,不仅是其他系统上默认的终端,也是 `git bash` 的默认终端.

```bash
$ mintty --help
Usage: mintty [OPTION]... [ PROGRAM [ARG]... | - ]

Start a new terminal session running the specified program or the user's shell.
If a dash is given instead of a program, invoke the shell as a login shell.

Options:
  -c, --config FILE     Load specified config file
  -e, --exec            Treat remaining arguments as the command to execute
  -h, --hold never|start|error|always  Keep window open after command finishes
  -i, --icon FILE[,IX]  Load window icon from file, optionally with index
  -l, --log FILE|-      Log output to file or stdout
  -o, --option OPT=VAL  Override config file option with given value
  -p, --position X,Y    Open window at specified coordinates
  -s, --size COLS,ROWS  Set screen size in characters
  -t, --title TITLE     Set window title (default: the invoked command)
  -u, --utmp            Create a utmp entry
  -w, --window normal|min|max|full|hide  Set initial window state
      --class CLASS     Set window class name (default: mintty)
  -H, --help            Display help and exit
  -V, --version         Print version information and exit
```

如果想要自定义 `mintty` 终端,在 `git bash` 命令行界面右键选择选项设置即可打开设置页面.

![git-bash-tree-options.png](../images/git-bash-tree-options.png)

### `mingw` 是什么

> Minimalist GNU for Windows



