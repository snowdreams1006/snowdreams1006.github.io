# 版本切换管理

> 【省时省力】告别 Node.js 安装配置的繁琐！国内镜像源加速，版本切换轻松搞定

![微信公众号「雪之梦技术驿站」](/assets/picgo/6f3b53a1d54f77563e71b92645f520a7.gif)

> **致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标 ★ ” 加上星标，就不会找不到我啦！

## 前言

最近电脑开发环境又意外出现了异常,每次更新系统都是冒着很大的风险,这次最直接的影响就是一些基于`nodejs`的前端项目.

![](/assets/picgo/897c57496fc5aa1287c5de40da50ff64.png)

不同项目的版本环境要求不一致,最新的`nodejs`并不总是满足项目要求,因此为了重新部署自己开发的以及别人开发的项目,需要根据项目随时切换到相应的版本.

**安装`nodejs`大致分为三步:**

- 下载: 根据操作系统下载相应的版本
- 安装: 便携式安装或者源码安装
- 配置: 环境变量配置以及指定国内镜像源

其中,`nvm`作为`nodejs`版本管理器还是支持跨平台操作,是个不错的选择.

![](/assets/picgo/008ba8c3d0ef8c990650a7b3a9756164.png)

如果是简单的安装教程就不会出现这篇文章,直到发现了`gitee`上一个神奇的脚本,将上述步骤简化到一行命令,强烈安利!

## 使用

`nvm-cn` 解决的是 `NodeJS` 自身的国内下载问题，而 npm 包 的国内下载问题，您可阅读最下方手动进行换源，或通过 `RubyMetric/chsrc` 多平台自动测速换源。

> 项目地址: [https://gitee.com/RubyMetric/nvm-cn](https://gitee.com/RubyMetric/nvm-cn "https://gitee.com/RubyMetric/nvm-cn")

**安装 nvm**

```bash
bash -c "$(curl -fsSL https://gitee.com/RubyMetric/nvm-cn/raw/main/install.sh)"
```

**卸载 nvm**

```bash
bash -c "$(curl -fsSL https://gitee.com/RubyMetric/nvm-cn/raw/main/uninstall.sh)"
```

**设置 npm 国内镜像源**

```bash
# 查看配置
npm config ls

# 手动设置镜像源
npm config set registry https://registry.npmmirror.com
```

推荐全平台换源工具 `RubyMetric/chsrc` 自动测速挑选最快镜像站.

```bash
chsrc set npm
```

> 详情请参考: [https://gitee.com/RubyM
> etric/chsrc](https://gitee.com/RubyMetric/chsrc)

```bash
# 手动方式安装，则会下载到当前目录，可直接通过 ./chsrc 运行
curl -L https://gitee.com/RubyMetric/chsrc/releases/download/pre/chsrc-x64-macos -o chsrc; chmod +x ./chsrc

# chsrc set node | nodejs # 同时换 npm, yarn 和 pnpm 3个，也可以3个独立换源
chsrc set npm

# 查看镜像源
npm config get registry
```

## 总结

本文主要介绍了如何使用 `nvm` 进行 `nodejs` 版本管理,方便在不同项目独立启用不同的项目环境.

下面总结出个人常用的命令,非常实用,觉得有用的欢迎留下您的评论哟~

**常用命令**

```bash
# 列出本地已安装版本
nvm ls

# 列出所有可安装版本
nvm ls-remote

# 安装某个版本Node
nvm install lts/fermium
nvm install v12.20.1
nvm install v15.5.1

# 切换Node版本
nvm use system
nvm use 14.15    # 不用全部打出版本号

# 显示当前的版本
nvm current

# 更新nvm
nvm-update
```

![](/assets/picgo/cd9f7e9d2938f5974adc667be85e1c78.png)

## 往期精彩文章

- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [网站反爬新招：一键封杀右键菜单，让你的网站数据稳如泰山，打造爆款防护秘籍！
  ](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485592&idx=1&sn=fd2b78bddddca9727d10bf982316ed6d&chksm=fd1f2152ca68a844b97a3deda3182eff380766c74061b492f628394d86aa8af15a3ec6d82408&token=440466482&lang=zh_CN#rd)
- [重装系统之必装神器！错过它们？你的电脑将失去灵魂！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484698&idx=1&sn=c874dbfa2f3550b4ea1e88854d4ef80d&chksm=fd1f2cd0ca68a5c6dffa5bf67da755a09aee73d26bb97e67f42d18e0463d3cad2a2fe9e1703f&token=312545539&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连 UserAgent 都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)

![](/assets/picgo/31f9180b2c2601eb166e885a92d804e3.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`
