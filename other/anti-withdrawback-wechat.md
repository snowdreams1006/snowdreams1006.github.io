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

- [Shell 教程](https://www.runoob.com/linux/linux-shell.html)
- [linux：shell脚本（逻辑判断和字符串比较）](https://blog.csdn.net/wxc_qlu/article/details/82826106)
