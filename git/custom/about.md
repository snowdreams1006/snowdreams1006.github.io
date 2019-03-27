# 个性化 git

## 前情概要

初识 `git` 时,我们就已经接触过 `git` 的基本配置,使用 `git config` 命令配置用户名和邮箱:

```
# 配置当前项目(`local`)的用户名(`snowdreams1006`)
git config --local user.name "snowdreams1006"

# 配置当前项目(`local`)的邮箱(`snowdreams1006@163.com`)
git config --local user.email "snowdreams1006@163.com"
```

快速回忆一下配置的相关语法:

```
# 查看默认全部配置: `local>global>system`
git config --list

# 查看当前项目配置,等同于 `.git/config` 文件
git config --local --list

# 查看当前用户配置,等同于 `~/.gitconfig` 文件 或 `~/.config/git/config` 文件
git config --global --list

# 查看当前系统配置,等同于 `/etc/gitconfig` 文件
git config --system --list
```

> `man git-config` 查看帮助文档,`git` 的配置文件是普通文本,也可以直接编辑.

## 基本配置

总体来说,`git` 的配置项基本分为两类: 客户端和服务端.其中大部分属于客户端配置, 除非使用自己搭建私服,否则没机会手动配置服务端(第三方服务器基本都支持可视化配置,比如禁止强制推送等配置).

### `core.editor` 编辑器

默认情况下,`git` 使用的是 `$VISUAL` 或 `$EDITOR` 配置的文本编辑器,如果没有设置,则调用 `vi` 编辑器创建和编辑文本信息.

查看当前编辑器配置项:

```
# 查看编辑器配置项: 若没配置过,则无内容输出,已配置过的话,会输出相应编辑器信息
git config core.editor
```

假设使用 `sublime` 作为默认编辑器,那么便可如下设置:

```
# `Mac` 系统如下设置: 设置成自己的 `Sublime` 的安装路径
git config --local core.editor "'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n -w"

# `Windows` 系统如下设置: 设置成自己的 `Sublime` 的安装路径
git config --local core.editor "'F:\Sublime Text 3 sublime text.exe' -n -w"
```

此时再次查看编辑器配置项应该会输出刚才配置信息,接下来我们验证下编辑器的效果:

![git-custom-config-editor.gif](./images/git-custom-config-editor.gif)

查看提交历史,已经提交成功(之前备注信息是在命令行中直接输入的,而现在是在编辑器中编辑)

```
$ git log --pretty=oneline --abbrev-commit
43fa8aa (HEAD -> master) validate sublime successfully
00e16d7 ok
2400f11 git config --local core.editor "'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n -w"
0d60cb8 ok
8fe5aba (origin/master, origin/HEAD) Merge branch 'master' of github.com:snowdreams1006/git-demo
$ 
```

> 如果只是输入简单备注,根本用不到编辑器,若提交备注有格式化要求时再手动输入就显得力不从心了!



## 忽略特定文件 `.gitignore`

