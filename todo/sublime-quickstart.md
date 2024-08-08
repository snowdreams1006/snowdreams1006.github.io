# sublime快速入门

> 官网地址: [https://www.sublimetext.com/](https://www.sublimetext.com/)

- 自定义删除当前行快捷键

> `Preferences:Key Bindings:run_macro_file`

```json
[
	{ "keys": ["ctrl+d"], "command": "run_macro_file", "args": {"file": "res://Packages/Default/Delete Line.sublime-macro"} }
]
```

- 设置失去焦点自动保存

> `Preferences:Setting:save_on_focus_lost`

```json
// Settings in here override those in "Default/Preferences.sublime-settings",
// and are overridden in turn by syntax-specific settings.
{
	// Set to true to automatically save files when switching to a different file
    // or application
    "save_on_focus_lost": true
}
```

## 参考资料

- [Sublime 删除一行快捷键](https://blog.csdn.net/weixin_39407291/article/details/88537661)
- [sublime text 3 失去焦点自动保存功能，避免ctrl + s 的繁琐](https://blog.csdn.net/LXM_Bill/article/details/71514764)