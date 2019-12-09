# 微信防撤回

> ![MustangYM/WeChatExtension-ForMac](https://github.com/MustangYM/WeChatExtension-ForMac)

## 目录结构

### 微信目录

```bash
$ tree /Applications/WeChat.app/ -L 3
/Applications/WeChat.app/
└── Contents
    ├── Frameworks
    │   ├── AFNetworking.framework
    │   ├── CocoaLumberjack.framework
    │   ├── JietuFramework.framework
    │   ├── MMLibHooks.framework
    │   ├── WCDB.framework
    │   └── matrixreport.framework
    ├── Info.plist
    ├── MacOS
    │   ├── WeChat
    │   ├── WeChatExtension.framework
    │   └── WeChat_backup
    ├── PkgInfo
    ├── PlugIns
    │   └── WeChatMacShare.appex
    ├── Resources
    │   ├── AppIcon.icns
    │   ├── Assets.car
    │   ├── Base.lproj
    │   ├── zh-Hans.lproj
    │   └── zh-Hant.lproj
    ├── _CodeSignature
    │   └── CodeResources
    └── _MASReceipt
        └── receipt
```
- app_bundle_path : `/Applications/WeChat.app/Contents/MacOS/`
- app_executable_path : `/Applications/WeChat.app/Contents/MacOS/WeChat`
- app_executable_backup_path : `/Applications/WeChat.app/Contents/MacOS/WeChat_backup`
- framework_path : `/Applications/WeChat.app/Contents/MacOS/WeChatExtension.framework`

### 插件结构

```bash
$ tree /Users/snowdreams1006/Documents/workspace/WeChatExtension-ForMac-master/WeChatExtension/Rely - L 3
/Users/snowdreams1006/Documents/workspace/WeChatExtension-ForMac-master/WeChatExtension/Rely
├── Install.sh
├── Plugin
│   ├── WeChatExtension
│   │   ├── Update.sh
│   │   └── WeChatExtension.framework
│   │       ├── Resources
│   │       │   ├── Base.lproj
│   │       │   │   ├── TKAboutWindowController.nib
│   │       │   │   └── TKRemoteControlWindowController.nib
│   │       │   └── zh-Hant.lproj
│   │       │       ├── Localizable.strings
│   │       │       ├── TKAboutWindowController.nib
│   │       │       ├── TKAboutWindowController.strings
│   │       │       ├── TKRemoteControlWindowController.nib
│   │       │       └── TKRemoteControlWindowController.strings
│   │       ├── Versions
│   │       └── WeChatExtension
│   └── WeChatExtension.zip
├── Uninstall.sh
└── insert_dylib
```

- WeChatExtension.framework : `./Plugin/WeChatExtension/WeChatExtension.framework`

```bash
${shell_path}/insert_dylib --all-yes "${framework_path}/${framework_name}" "$app_executable_backup_path" "$app_executable_path"
```

## install

```bash
#!/bin/bash

wechat_path="/Applications/WeChat.app"

if [ ! -d "$wechat_path" ]
then
wechat_path="/Applications/微信.app"
if [ ! -d "$wechat_path" ]
then
echo -e "\n\n应用程序文件夹中未发现微信，请检查微信是否有重命名或者移动路径位置"
exit
fi
fi

app_name="WeChat"
shell_path="$(dirname "$0")"
framework_name="WeChatExtension"
app_bundle_path="${wechat_path}/Contents/MacOS"
app_executable_path="${app_bundle_path}/${app_name}"
app_executable_backup_path="${app_executable_path}_backup"
framework_path="${app_bundle_path}/${framework_name}.framework"


# 对 WeChat 赋予权限
if [ ! -w "$wechat_path" ]
then
echo -e "\n\n为了将小助手写入微信, 请输入密码 ： "
sudo chown -R $(whoami) "$wechat_path"
fi

# 判断是否已经存在备份文件 或者 是否强制覆盖安装
if [ ! -f "$app_executable_backup_path" ] || [ -n "$1" -a "$1" = "--force" ]
then
# 备份 WeChat 原始可执行文件
cp "$app_executable_path" "$app_executable_backup_path"
result="y"
else
read -t 150 -p "已安装微信小助手，是否覆盖？[y/n]:" result
fi

if [[ "$result" == 'y' ]]; then
    cp -r "${shell_path}/Plugin/WeChatExtension/${framework_name}.framework" ${app_bundle_path}
    ${shell_path}/insert_dylib --all-yes "${framework_path}/${framework_name}" "$app_executable_backup_path" "$app_executable_path"
fi
```

## uninstall

```bash
# !/bin/bash

wechat_path="/Applications/WeChat.app"

if [ ! -d "$wechat_path" ]
then
wechat_path="/Applications/微信.app"
if [ ! -d "$wechat_path" ]
then
echo -e "\n\n应用程序文件夹中未发现微信，请检查微信是否有重命名或者移动路径位置"
exit
fi
fi

app_name="WeChat"
framework_name="WeChatExtension"
app_bundle_path="${wechat_path}/Contents/MacOS"
app_executable_path="${app_bundle_path}/${app_name}"
app_executable_backup_path="${app_executable_path}_backup"
framework_path="${app_bundle_path}/${framework_name}.framework"

# 备份WeChat原始可执行文件
if [ -f "$app_executable_backup_path" ]
then
rm "$app_executable_path"
rm -rf "$framework_path"
mv "$app_executable_backup_path" "$app_executable_path"

if [ -f "$app_executable_backup_path" ]
then
	echo "卸载失败，请到 /Applications/WeChat.app/Contents/MacOS 路径，删除 WeChatPlugin.framework、WeChat 两个文件文件，并将 WeChat_backup 重命名为 WeChat"
else
	echo "\n\t卸载成功, 重启微信生效!"
fi

else
echo "\n\t未发现微信小助手"
fi
```


## 初识逆向工程

下面是在iOS逆向分析中使用到的一些工具，大家可以先看看了解下，在后面的课程中会给大家讲解一些工具的使用及其原理。

### 一、砸壳工具:

- dumpdecrypted: [https://github.com/stefanesser/dumpdecrypted](https://github.com/stefanesser/dumpdecrypted)

- Clutch: [https://github.com/KJCracks/Clutch](https://github.com/KJCracks/Clutch)

### 二、界面分析工具:

Reveal: [https://revealapp.com/](https://revealapp.com/)

### 三、监控工具:

- snoop-it: https://code.google.com/archive/p/snoop-it

- introspy: [https://github.com/iSECPartners/Introspy-iOS](https://github.com/iSECPartners/Introspy-iOS)

### 四、静态分析工具

- IDA: [https://www.hex-rays.com/products/ida/support/download_demo.shtml](https://www.hex-rays.com/products/ida/support/download_demo.shtml)

- Hopper: [https://www.hopperapp.com/](https://www.hopperapp.com/)

### 五、动态调试工具

ldb: [http://lldb.llvm.org/](http://lldb.llvm.org/)

### 六、动态脚本工具

- cycript: [http://www.cycript.org/](http://www.cycript.org/)

- frida: [http://www.frida.re](https://www.frida.re/)

### 七、抓包工具

- BurpSuite: [https://portswigger.net/burp/download.html](https://portswigger.net/burp/download.html)

- Charles: [https://www.charlesproxy.com/](https://www.charlesproxy.com/)

- Wireshark: [https://www.wireshark.org/download.html](https://www.wireshark.org/download.html)

### 八、Mac工具

- MachOView: [http://github.com/gdbinit/MachOView](https://github.com/gdbinit/MachOView)

- class-dump: [https://github.com/nygard/class-dump](https://github.com/nygard/class-dump)

- thoes: [https://github.com/theos/theos/wiki/installation](https://github.com/theos/theos/wiki/installation)

- iOSOpenDev: https://code.google.com/archive/p/iosopendev/downloads

- insert_dylib: [https://github.com/Tyilo/insert_dylib](https://github.com/Tyilo/insert_dylib)

- iTerm: [http://www.iterm2.com/](https://www.iterm2.com/)

- Alfred: [https://www.alfredapp.com/](https://www.alfredapp.com/)

- iTools: [http:/wwW.itools.cn/](http://www.itools.cn/)

- iFunBox: [http://www.i-funbox.com/](http://www.i-funbox.com/)

lipo , otool

## 认识越狱设备

本节课中涉及Cydia里面的工具:

系统定制工具: Cloaky

命令行工具: adv-cmds

文件管理工具: iFile

### 越狱环境配置

本节课涉及到的一些工具:

- OpenSSH

- usbmuxd

- appsync

- Apple File Conduit'2'

### 一、OpenSSH安装使用

```bash
ssh root@ip

password:alpine
```

修改密码

```bash
passwd

passwd mobile
```

### 二、免密码登录

```bash
ssh-keygen -t rsa -P ''
scp /Users/用户名/.ssh/id_rsa.pub root@Ip:/tmp
cat /tmp/id_rsa.pub >> .ssh/authorized_keys
```


### 三、通过USB连接

下载地址: [https://cgit.sukimashita.com/usbmuxd.git](https://cgit.sukimashita.com/usbmuxd.git)

usbmuxd-1.0.8

```bash
python tcprelay.py -t 22:2222
ssh root@localhost -p 2222
scp -P 2222 ./test.txt root@localhost:/tmp
```

### 四、SSH中文

1. 创建".inputrc"

```bash
set convert- meta off 
set meta-flag on
set output-meta on
```

2. 导入文件到 `var/root` 下面

### 五、key不匹配的问题

打开 `/Users/monkey/.ssh/know_hosts` 文件，删除对应 `IP` 的 `key` 即可。

### 六、查看进程列表

```bash
ps aux | grep xXx
```
      
## 快速SSH登入设备的方法

这里给大家安利一个快速快速SSH登录设备的方法。

1. 切换到目最

```bash
cd /Users/monkey/.ssh  #monkey为当前用户名
```

2. 如果没有 `config` 文件，新建一个。

```bash
touch config
```

3. 编辑内容

```conf
Host 5c  #这个名称是自定义的设备名,自己定义一个就行
Hostname localhost  #我是通过USB端口映射,所以写localhost
User root  #以root用户登录
Port 2222  #指定端口号为映射的端口号 2222
IdentityFile /Users/monkey/.ssh/id_rsa #rsa key的路径
```

4. 端口映射

```bash
python tcprelay.py 22:2222
```

5. 一键登录

```bash
ssh 5c
```

6. 设置启动时端口自动映射:

安装:

```bash
brew install libimobiledevice
```

创建文件:

```bash
-/Library/LaunchAgents/com.usbmux.iproxy.plist
```

写入内容:

```xml
<?xml version ="l.0" encoding ="UTF- -8"?><IDOCTYPE plist PUBLIC "-//Apple//DTD PLIST1.0//EN" "http://www.apple.com/DTDs/PropertyList-l.0.dtd">
<plist version="l.0">
    <dict>
        <key>Label</key>
        <string>com.usbmux.iproxy</string>
        <key>ProgramArguments</key>
        <array>
            <string>/usr/local/bin/iproxy</string>
            <string>2222</string>
            <string>22</string>
        </array>
        <key>RunAtLoad</key><true/>
        <key>KeepAlive</key><true/>
    </dict>
</plist>
```

执行命令: 

```bash
launchctl load -/Library/LaunchAgents/com.usbmux.iproxy.plist
```

7. 安装 `iterm2` , 点击 `Preferences` ,然后点击 `Profiles Command` 为 `ssh 5c`
以后只需要 `Command + O` ，打开对应的 `Profile` 即可。






- [Shell 教程](https://www.runoob.com/linux/linux-shell.html)
- [linux：shell脚本（逻辑判断和字符串比较）](https://blog.csdn.net/wxc_qlu/article/details/82826106)
