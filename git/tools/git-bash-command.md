# git bash 常见命令

已投稿给**脚本之家**公众号,如需查看请访问: 

[从 git bash 命令行中窥探人生](https://mp.weixin.qq.com/s/5bSogfIMqmhgMcZ5NoYNlA)

> [https://mp.weixin.qq.com/s/5bSogfIMqmhgMcZ5NoYNlA](https://mp.weixin.qq.com/s/5bSogfIMqmhgMcZ5NoYNlA)

## 常见问题

- bash: open: command not found

`open` 命令不存在,`windows` 系统可使用 `start` 命令实现同等效果.

```bash
# 打开cmd窗口
start

# 打开当前目录
start .

# 打开下一级目录,注意目录结尾不要添加斜杠/
start draft

# 打开上一级目录,注意目录需要\\转义
start ..\\snowdreams1006.github.io
```

- 更改默认路径

> [更改git bash默认的路径](https://www.cnblogs.com/wuyuankun/p/4214836.html)
> E:\workspace

```bash
# 目标 D:\Git\git-bash.exe --cd-to-home
# 起始位置: %HOMEDRIVE%%HOMEPATH%
$ echo $HOMEDRIVE$HOMEPATH
C:\Users\Administrator
```