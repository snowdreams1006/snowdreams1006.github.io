# 重装开发环境

## 重装系统的实验环境

由于莫名其妙的原因,系统总是在我正在敲代码敲得正入迷时意外重启,我以为这一次和往常一样只要关机再重新开机就能恢复正常状态.

遗憾的是,这一次竟然卡死在关机界面,登录界面之间无限循环,于是乎在苹果客服的电话支持下经过多重方式重试均无效,只能降级重装系统.

身在老家农村的我,哪来的 WiFi 也没有超大硬盘,只能含泪接受了抹除硬盘并用热点共享的方式重装系统的解决方案.

......

(内心崩溃中,已省略一万字,想要查看更多心理历程,请解锁: `AES` 对称加密并含有密钥!)

```bash
U2FsdGVkX1+R6u5DTm0gElVut7ICgmOmOp6YA2L90vYOEB9T0D27maRPThnnsSGI
VHW0N39zZ7dVaaOBxe1f3xsHQ3OwD6TDg78M1/xQ0Td68Y8NjKuN5hwqF43UHmHJ
ueVAuBRvI9MSV3nJKoNoC12V+ZYHeAtxu6daHjOwGVtBAbXbWSJWbvfvor1tjAuy
```

热点共享一下午,用掉了我整整 `10g` 的流量,恐怖如斯,不敢回想,不过总算能正常开机了,此次降级后的系统版本真的好低,恢复出厂设置的系统感觉要被众多软件放弃了呢!

![dev-env-install-machine-system-version.png](../dev-env-install-machine-system-version.png)

**总结** 

恢复出厂设置的新电脑,不再是熟悉的开发环境,所以只能动手重新打造开发环境.

当然一起从流量出发,只能安装最核心软件,想不到的软件只能说明是暂时不需要的也可能是可有可无的工具.

## 先从输入法开始搞起

> 下载链接传送门: [http://cdn2.ime.sogou.com/d902446f85c2478e05fb37d385817173/5e4ce413/dl/index/1574950329/sogou_mac_56b.zip](http://cdn2.ime.sogou.com/d902446f85c2478e05fb37d385817173/5e4ce413/dl/index/1574950329/sogou_mac_56b.zip)

先用系统自带的浏览器输入关键字**搜狗输入法**并打开官网找到下载链接,下载完成后双击进行安装,稍后自行登陆账号以获取同步设置.

![dev-env-install-input-method-sougou.png](../dev-env-install-input-method-sougou.png)

切换到搜狗输入法并手动删除系统自带的输入法,防止多个输入法之间来回切换,能删则删,干净利落!

![dev-env-install-input-method-remote.png](../dev-env-install-input-method-remote.png)

**总结** 

搜狗输入法是国内下载源,下载速度还是非常快的,大小在 50Mb 左右,非常良心,毕竟随随便便一款手机聊天软件都要一二百兆.

## 动手改造默认浏览器

> 下载链接传送门: [https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg](https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg)

没有 Chrome 浏览器,不是完整的 web 开发体验,Safari 浏览器虽好但还是不敌 Chrome 浏览器,嫌弃的同时还下载 Chrome 浏览器再说!

![dev-env-install-browser-chrome.png](../dev-env-install-browser-chrome.png)

下载安装包后双击进行安装,并将其设置为默认浏览器,打开 Chrome 浏览器后更改默认搜索引擎为百度.

![dev-env-install-browser-chrome-setting-engine.png](../dev-env-install-browser-chrome-setting-engine.png)

> 默认搜索引擎是谷歌,所以不更改默认行为的话,大概率无法正常上网,除非先解决 FQ 问题.

打开浏览器地址栏,搜索关键字"谷歌助手"下载插件帮助访问谷歌服务,进而登陆谷歌账号同步浏览器设置.

![dev-env-install-browser-chrome-setting-googlehelper.png](../dev-env-install-browser-chrome-setting-googlehelper.png)

下载完成后双击解压文件夹,得到源码以及打包文件,两者任选其一进行安装,值得注意的是,需要打开扩展程序右上角的开发模式.

![dev-env-install-browser-chrome-setting-plugin.png](../dev-env-install-browser-chrome-setting-plugin.png)

随后就可以无障碍访问谷歌服务,包括但不限于登录谷歌账号进行同步浏览器设置,同步后的浏览器基本上已经可以满足使用了,但是还有一些细节需要手动设置.

![dev-env-install-browser-chrome-setting-console.png](../dev-env-install-browser-chrome-setting-console.png)

> 窗口控制台的设置并没有同步过来,因此这些细节一定要注意,调试程序时不要想当然,出问题了先检查工具是否正常.

**总结** 

Chrome 浏览器虽然是国外网站,但是下载速度还是很快的,文件大小也只有 90MB 左右,安装后需要先解决上网问题再同步云设置,心有余力时再手动检查一遍设置是否完成.

## 开发环境最佳实践

开发环境主要包括基础环境以及语言环境,比如版本控制工具 git 或者 svn 就是管理源码的网盘,无论是 python 环境还是 java 环境,只要涉及到源码就需要做版本控制,所以先保证这一部分基础环境安装正常才能继续搭建语言环境.

### 基本工具开发环境

- 版本控制工具 git

默认情况下,Mac 自带 git 环境,因此不需要额外下载,只需要配置 git 账号保证能够正常查看并提交代码即可.

```bash
$ git --version
#git version 2.10.1 (Apple Git-78)
```

Git 的配置过程包括本地开发环境以及远程开发环境,如果仅仅是个人单独使用 Git 不涉及多人合作,并不需要配置远程开发环境.

- step 1 : 配置本地开发环境

> 这里修改成自己的用户名和邮箱,例如我的用户名是: `git config --global user.name "snowdreams1006"`

```bash
$ git config --global user.name "your username" 
# 配置 Git 账号用户名

$ git config --global user.email "example@example.com"
# 配置 Git 账号邮箱
```

- step  2 : 配置远程开发环境

> 这里要修改成自己的邮箱,例如我的邮箱是: `ssh-keygen -t rsa -C "snowdreams1006@163.com"`,生成 ssh 密钥对的过程一路回车默认设置即可,最后生成的公钥文件位于 `~/.ssh/id_rsa.pub`

```bash
$ ssh-keygen -t rsa -C "youremail@example.com"
# 配置 Git 账号邮箱

$ cat ~/.ssh/id_rsa.pub
# 查看生成 ssh 公钥
```

- step 3 : 上传公钥到远程服务器

如果远程服务器是 Github 网站的话,可以复制公钥内容粘贴到 Github 网站,完成后就可以使用 ssh 方式免密拉取或提交代码了.

![dev-env-install-tools-github-ssh.png](../dev-env-install-tools-github-ssh..png)

如果远程服务器是自搭建的 Git 服务器,那么需要将公钥内容追加到服务器认证文件(`~/.ssh/authorized_keys`),实现免密使用 Git 协议的目的.

### nodejs 开发环境

```
https://registry.npmjs.org

https://registry.npm.taobao.org

```

### python 开发环境

- 安装真实环境

> 下载链接传送门: [https://www.python.org/ftp/python/3.8.1/python-3.8.1-macosx10.9.pkg](https://www.python.org/ftp/python/3.8.1/python-3.8.1-macosx10.9.pkg)


阿里云: http://mirrors.aliyun.com/pypi/simple/
清华大学：https://pypi.tuna.tsinghua.edu.cn/simple/
中科大 https://pypi.mirrors.ustc.edu.cn/simple/
豆瓣: http://pypi.douban.com/simple/

```bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ virtualenv

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ -r requirements.txt
```

- 安装虚拟环境

```bash
pip3 install virtualenv
```

### java 开发环境

