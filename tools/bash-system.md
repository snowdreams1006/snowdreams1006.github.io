# Bash脚本判断操作系统

> Bash脚本大揭秘：一键识别macOS、Windows还是Linux，让你的跨平台部署更轻松！

![微信公众号「雪之梦技术驿站」](/assets/picgo/6f3b53a1d54f77563e71b92645f520a7.gif)

> **致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标 ★ ” 加上星标，就不会找不到我啦！

## 引言

由于工作原因需要在`mac`和`windos`电脑之间随时切换,为了方便会写一些脚本解放重复性劳动.

类似于这样的上传文件命令就有很强的操作系统路径强相关性,需要区分到底是`mac`还是`windows`,从而决定不同的上传路径.

```bash
# mac
scp -r /Users/snowdreams1006/generator/* ali:~/generator

# windows
scp -r /g/generator/* ali:~/generator
```

因此,研究一下在`bash`环境中判断识别不同的操作系统,在这里分享一下.

![](/assets/picgo/cd9f7e9d2938f5974adc667be85e1c78.png)

## 思路

### 1. 检查 uname 命令

第一反应就是使用`uname`命令观察在不同操作系统的输出,下面测试了三款操作系统.

```bash
uname -s
# Linux

uname -s
# Darwin

uname -s
# MINGW64_NT-10.0-19045
```

如果是 windows10 原生终端环境`power shell`,是不支持`uname`命令的,会得到如下报错信息.

![](/assets/picgo/962662b8e2d09a91e4132ff0fe4fd175.png)

顺便科普一下`uname`的命令:

![](/assets/picgo/e629fb03249b61a2bc4163a9210d5eed.png)

> 总结: `uname`命令在`Unix-like`系统（包括`macOS 和`Linux`）上可用，但在**原生 Windows 命令行中不可用**。

通过检查 `uname` 的输出,可以区分 `macOS` 和其他 `Unix-like` 系统.

如果是目前的个人需求足矣判断出 mac 即可,其他情况就是 windows,也可以检查 windows 文件或者特殊的环境变量.

### 2. 检查 Windows 特有的环境变量

在我的电脑-高级设置-环境变量-系统环境变量中可以看到很多键值对的环境变量,尽可能挑选出系统自带且特殊的名称.

![](/assets/picgo/5eb7ff849b874d72e8c1c1368dfcadb2.png)

实测下来只有`Windows`会有这些环境变量的值,其他操作系统输出为空,那么就可以判断特殊的环境变量识别出`windows`操作系统.

![](/assets/picgo/18e6c5db25a0a1b0dc2fb3289128a190.png)

```bash
echo $WINDIR
# Linux 输出为空

echo $WINDIR
# Darwin 输出为空

echo $WINDIR
# Windows 输出 C:\Windows

echo $SYSTEMROOT
# Windows 输出 C:\Windows
```

除此之外还可以检查特定文件的存在性（比如`macOS`上的 `/System/Library/CoreServices/SystemVersion.plist` 或 `Windows`上的`C:\Windows\System32\cmd.exe`等等.

## 实现

思路: 使用 `uname -s` 根据输出内容判断`macOS`还是`Linux`,然后再获取特定的环境变量的值来区分是否是`Windows`操作系统.

实现: 脚本如下,亲测有效.

```
if [ "$(uname -s)" == "Darwin" ]; then
    echo "This is macOS."
elif [ "$(uname -s)" == "Linux" ]; then
    echo "This is Linux."
elif [ -n "$WINDIR" ] || [ -n "$SYSTEMROOT" ]; then
    echo "This is Windows."
else
    echo "Unknown Unix-like system."
fi
```

## 总结

值得注意的是`Bash`本质上是为`Unix-like`系统设计的,因此在原生 Windows 环境中直接区分操作系统可能需要一些额外的考虑,特别是如果你不是在使用`WSL`。

最后提供本人亲测好用的检测代码,可以简单识别出操作系统从而做出不同决策.

![](/assets/picgo/9efc5cd2c870d9f471f809314c0a88ad.png)

## 往期精彩文章

- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [网站反爬新招：一键封杀右键菜单，让你的网站数据稳如泰山，打造爆款防护秘籍！
  ](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485592&idx=1&sn=fd2b78bddddca9727d10bf982316ed6d&chksm=fd1f2152ca68a844b97a3deda3182eff380766c74061b492f628394d86aa8af15a3ec6d82408&token=440466482&lang=zh_CN#rd)
- [男人的魅力密码：价值至上的情感攻略](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484248&idx=1&sn=b79b518d3088cc024ac39a91310ea958&chksm=c353888e7c7b3cfae8b4f52ab48f43e685e935e00c36d36a012a3b685448ee75ccf3cd1a8f1f&mpshare=1&scene=1&srcid=08307fmhatFivTVzHEeRDWJU&sharer_shareinfo=aed074a1f25052634a60f95b5ae3c9f4&sharer_shareinfo_first=aed074a1f25052634a60f95b5ae3c9f4#rd)
- [每天一道美味佳肴《糖醋排骨》](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484315&idx=2&sn=dc77fadf4cd5dd3a22bf055b3fee300f&chksm=c2150278f5628b6eb64dd78ebef9d0dda668bdef2a5d73214a1f622235a00212dbcae7058092&token=658409695&lang=zh_CN#rd)

![](/assets/picgo/31f9180b2c2601eb166e885a92d804e3.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
