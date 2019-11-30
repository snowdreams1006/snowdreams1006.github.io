# 倒计时提醒


```bash
#! /bin/sh

leftDays=$((($(date +%s -d '20191215') - $(date +%s ))/86400))
title="***!"
body="***${leftDays}天,您真的准备好了吗?"

echo "title=${title} body=${body}"

curl -i -X GET \
 "https://bark.snowdreams1006.cn/***/${title}/${body}?automaticallyCopy=1&copy=${body}&url=https://blog.snowdreams1006.cn/"

curl -i -X GET \
 "https://sc.ftqq.com/***.send?text=${title}---$(uuidgen)&desp=${body}"
```

```bash
whereis crontab
```

```bash
crontab -e
```

```
*/1 * * * * sudo ~/reminder/tiaotiao.sh >> ~/reminder/tiaotiao.log
```

> 每一分钟执行一次 shell 脚本并输出到日志

```bash
crontab -l
```

```
00 08,10,14,17,22 * * * sudo ~/reminder/tiaotiao.sh >> ~/reminder/tiaotiao.log
```

- [crontab 在线表达式](https://tool.lu/crontab/)
- [Shell 变量](https://www.runoob.com/linux/linux-shell-variable.html)
- [shell 计算两个日期之间的天数](https://blog.csdn.net/mydriverc2/article/details/78592107)
- [使用crontab定时执行shell脚本](https://blog.csdn.net/liao392781/article/details/79278811)