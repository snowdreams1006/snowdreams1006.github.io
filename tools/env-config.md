# 重装系统之后端开发

> [重头构建！开箱即用：Node.js、Python、Java全能开发环境搭建指南](https://mp.weixin.qq.com/s/jysddeGzWrFwa5hDBgkdmA?token=1666461276&lang=zh_CN)

![微信公众号「雪之梦技术驿站」](/assets/picgo/a8c8d81113bf31d9813e6a13cdbbd9b8.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

> 偷偷溜进文章的小广告，别害羞，点进去瞅瞅，说不定能发现什么宝藏呢！文末那个也别错过，说不定是通往秘密花园的钥匙哦！

## 前言

前一阵子电脑出现故障,折腾了好久也没得解决问题.遇到问题如果重启电脑不能解决,那么就只能重装系统了.

因此,开发环境又要重头再来,环境配置简单但复杂,更有甚者官网下载的版本都是最新版本.所以整理出常用的开发环境的安装配置,并且提供直接下载链接以防下次意外!

## Sublime 文本编辑器

> [Sublime Text 官网下载地址](https://www.sublimetext.com/ "Sublime Text 官网下载地址")
>
> [点击下载历史版本](https://www.sublimetext.com/download "点击下载历史版本")

![](/assets/picgo/d4dbe9636cf285d1eee0e444b860b8f4.png)

颜值高,支持丰富的插件,简单高效的文本编辑器!

## Nodejs 开发环境

> [Node.js 官网下载地址](https://nodejs.org/en/download/prebuilt-installer "Node.js 官网下载地址")

![](/assets/picgo/7412f9dd3a780c2fcd94ada3780b8126.png)

如果需要兼容不同项目的不同 `Nodejs` 版本,推荐安装 `nvm` 包管理器,实现随时切换不同版本.

```bash
# 环境变量
NODE_PATH
I:\nodejs\node_modules

#修改npm全局（-g）模块安装所在路径
npm config set prefix I:\nodejs
#修改缓存cache的路径（ps：如果不修改，则默认到C盘位置C:\Users\Administrator\AppData\Roaming\npm）
npm config set cache I:\nodejs\node_cache

# 查看当前使用的镜像地址
npm config get registry
# 设置镜像源
npm config set registry https://registry.npm.taobao.org
npm config set registry https://registry.npmjs.org
```

> 详细安装配置教程可参考: [Node.js安装及环境配置——window10](https://www.cnblogs.com/toddywang/p/17851056.html "Node.js安装及环境配置——window10")

## Python 开发环境

> [python 官网下载地址](https://www.python.org/ftp/python/3.9.13/python-3.9.13-amd64.exe "python 官网下载地址")

![](/assets/picgo/cc4695b166a2f2c5769da8cab3729481.png)

```bash
# 使用国内镜像加速下载
python -m pip install --upgrade pip
pip install -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com -r requirements.txt
```

## Java 开发环境

> [Java SE 8u421官网下载地址](https://www.oracle.com/java/technologies/downloads/?er=221886#java8-windows "Java SE 8u421官网下载地址")

![](/assets/picgo/a454863efe3dcce7eaa0505e25632a6e.png)

关键点: “我的电脑” 右键菜单--->属性--->高级--->环境变量--->系统变量-->新建

```bash
JAVA_HOME
I:\Java\jdk-8\jdk1.8.0_291

CALSS_PATH
.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;

PATH
;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin

java -version
```

> 详细安装配置教程可参考: [Java环境安装配置步骤介绍](https://www.cnblogs.com/hiyong/p/16640825.html "Java环境安装配置步骤介绍")

## Tomcat 开发环境

> [apache-tomcat-8.5 官网下载地址](https://tomcat.apache.org/download-80.cgi "apache-tomcat-8.5 官网下载地址")

![](/assets/picgo/267b86dd2977768ce30c85893ad2aa77.png)

关键点: “我的电脑” 右键菜单--->属性--->高级--->环境变量--->系统变量-->新建

```bash
CATALINA_HOME
I:\tomcat\Tomcat 8.0

Path
;%CATALINA_HOME%\bin

catalina version
```

> 详细安装配置教程可参考: [Tomcat安装与配置（详细教程）](https://blog.csdn.net/weixin_65213208/article/details/126911814 "Tomcat安装与配置（详细教程）")


## maven 开发环境

> [ apache-maven-3.9.8-bin.zip 官网下载地址](https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.zip " apache-maven-3.9.8-bin.zip 官网下载地址")

![](/assets/picgo/a962631f36b7ef7ef746c82bc8a3111c.png)

关键点: “我的电脑” 右键菜单--->属性--->高级--->环境变量--->系统变量-->新建

```bash
MAVEN_HOME
I:\maven\apache-maven-3.6.3

Path
;%MAVEN_HOME%\bin

mvn -version

settings.xml
<localRepository>I:\maven\localRepository</localRepository>
<mirror>
    <id>alimaven</id>
    <name>aliyun-maven</name>
    <mirrorOf>central</mirrorOf>
    <url>http://maven.aliyun.com/nexus/content/groups/public</url>
</mirror>
```

> 详细安装配置教程可参考: [Maven安装配置全教程](https://blog.csdn.net/crayon0/article/details/122216411 "Maven安装配置全教程")

## Git 客户端

> [Download for Windows 官网下载地址](https://git-scm.com/download/win "Download for Windows 官网下载地址")

![](/assets/picgo/90a7a89dd0b0fe87c71bcc87c3ebcef6.png)

## svn 客户端

> [Apache Subversion command-line tools 官网下载地址](https://www.visualsvn.com/downloads/ "Apache Subversion command-line tools 官网下载地址")

![image](/assets/picgo/1ad44ad4e61f197c42c4b2adb4833161.png)

## redis-desktop-manager 客户端

> [RedisDesktopManager 官网下载地址](https://github.com/RedisInsight/RedisDesktopManager/releases/tag/0.9.3 "RedisDesktopManager 官网下载地址")

![](/assets/picgo/0df2471d75e30bd0a798fb1ed3e978a6.png)

## Navicat 数据库管理软件

> [ Navicat Premium 官网下载地址](https://www.navicat.com.cn/products " Navicat Premium 官网下载地址")

![](/assets/picgo/5da1d8e64c32a4fd5742ede718ce6317.png)

> 🌟 工具名称：Navicat  
> 🌐 使用环境：无需梯子,无需注册
> 🔗 工具地址：**扫码关注回复Navicat关键词**

下载安装即可直接使用,简答粗暴的安装方式谁能不爱呢?

```bash
链接：https://pan.baidu.com/s/1sxOKLXyCXv9yzzN5LOYQdA?pwd=9va4 
提取码：9va4
```

## IntelliJ IDEA 旗舰版开发软件

> [IntelliJ IDEA 官网下载地址](https://www.jetbrains.com/idea/download/other.html "IntelliJ IDEA 官网下载地址")

![](/assets/picgo/d04d4afaf4ca46bd24e6c9b275b081e2.png)

一款领先的 Java 和 Kotlin IDE,高颜值,很智能,插件丰富,Java开发必备.同样也是拆箱即用!

![](/assets/picgo/e3aa6ed4d0fb0d7e7fc019cc53155b7f.png)

> 🌟 工具名称：IDEA
> 🌐 使用环境：无需梯子,无需注册
> 🔗 工具地址：**扫码关注回复IDEA关键词**

```bash
链接：https://pan.baidu.com/s/1P-fcDKcMEfEBvzTgUH-ZVg?pwd=igw4 
提取码：igw4
```

## 总结

本文主要分享了常见的开发环境安装配置的关键点,涉及到`Nodejs` , `Python` 以及`Java`等相关环境.

不仅提供了官网下载链接也支持私人上传后分享链接下载,如果链接失效,后台私信回复`关键词`可获取下载地址.

- `Sublime` 强大的文本编辑器,除了`Java`外的开发全靠它!
- `Navcat` 数据库管理软件,官网免费试用,私信链接支持无限期试用
- `IDEA` Java开发集成环境,官网免费试用,私信链接支持无限期试用

## 往期精彩文章

- [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s/CcbhNsdorentS9jHTwAOMQ)
- [GoAccess中配置geoip支持ip地理位置](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HArebnqO4mbeqKrubRMmUIqSqlwjekBCPRKSH5bmrwrxcP3pDPPAoUg2kxZjPVpDUIlyjFo#rd)
- [GoAccess中配置websocket支持实时日志](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484441&idx=1&sn=12996994a835aba76076d0b749ef9aaf&chksm=fd1f2dd3ca68a4c5417ff3b2d02cedf1f6f721db1616f2f8824b9824c000a28226901888f6b5&token=1667898534&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/68bbae62ad45a160e55bd3e49f8e69ca.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`

