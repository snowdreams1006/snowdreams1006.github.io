# GoAccess禁爬效果显著

> 当网站流量放大了 1000 倍,每小时 1 万多的访问量到 1 千万点击量是如何做到的?

## 前言

**时间**

![](/assets/picgo/19ffbe4859d37368fd8141043cfe245b.gif)

先看一组数据,**13 点到 14 点**这个时间段,访问量放到了一千倍,从`17,788`变成了`14,178,799`,访问量断崖式陡增!

**事件**

![](/assets/picgo/c2e365f7278ff493b00f3b9f67c5382d.gif)

请求文件点击量比较大的来源于 `koala` 请求,是一款防作弊频率控制系统,可能有异常访问或者不合适的使用方式.

13,191,039 和 13,118,782 的流量的数量级别和总体异常的访问量也是相同数字级别.

**对象**

![](/assets/picgo/0868c0036311e02adb1a69617be4054e.gif)

相同访问量级别的 ip 来源于可信任的两台服务器,而非其他攻击 ip.

那么问题来了,既然引起巨大流量的时间和事件都是可信任的服务器发起的请求,那么为啥会在某一时间段特别集中呢?

## 分析

![](/assets/picgo/dd4634cf8b1f842efa7fe30e09ee1df9.png)

浏览器的分析报告显示爬虫的数据和异常的流量相仿,而且操作系统的统计报告也是得到了相同的结论.

![](/assets/picgo/bc6a313b1cc291629e3de36b472bc73e.png)

**查看全部日志**

```bash
cat ~/nginx/logs/access.log \
| awk '{print $1}' \
| sort \
| uniq -c \
| sort -rn
```

**筛选指定时间日志**

```bash
awk '$4 >= "[21/Oct/2024:13:00:00" && $4 < "[21/Oct/2024:14:00:00" {print}' ~/nginx/logs/access.log
```

注意：这个命令假设你的时间戳格式是`[day/month/year:hour:minute:second]`,并且月份是英文缩写（如 Oct 代表 October）.

**统计 IP 访问次数**

```bash
awk '$4 >= "[21/Oct/2024:13:00:00" && $4 < "[21/Oct/2024:14:00:00" {print}' ~/nginx/logs/access.log \
| awk '{print $1}' \
| sort \
| uniq -c \
| sort -rn
```

**查看某 ip 访问情况**

```bash
awk '$4 >= "[21/Oct/2024:13:00:00" && $4 < "[21/Oct/2024:14:00:00" {print}' ~/nginx/logs/access.log \
| grep 'xxx.xxx.xxx.xxx' \
| awk -F '"' '{print $2}' \
| sort \
| uniq -c \
| sort -rn
```

## 总结

经过直观数据统计图表,大致判断出异常日志出现的环境,结合自定义逻辑精确定位,最终能显著减少异常流量,该允许的允许,不允许的就拒绝.

![](/assets/picgo/04a64348e524909194f3917db806b257.gif)

最终,流量趋于稳定,不止于影响到其他业务服务,看最终效果吧!

![](/assets/picgo/0f38c83f615e235254e01554a600492a.png)
