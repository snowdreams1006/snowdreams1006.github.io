# 反爬之禁止开发者控制台

```js
(() => {
    function ban() {
      setInterval(() => {
        debugger;
      }, 50);
    }
    try {
      ban();
    } catch (err) { }
})();
```

![](https://files.mdnice.com/user/71390/891cd70e-0a63-432e-89c4-512331515902.gif)

- 禁用断点`Deactivate breakpoints(Ctrl + F8)`

![](https://files.mdnice.com/user/71390/0f60fb96-8840-49d8-a587-0e373175c163.png)

- 添加日志断点`Add logpoint`

![](https://files.mdnice.com/user/71390/2b4ea410-b8c1-4a31-b783-85dcda9d4f1d.png)

![](https://files.mdnice.com/user/71390/de57bb56-cd6c-4a53-94e2-b7cf1293ea24.png)

- 在这从不暂停`Never pause here`

![](https://files.mdnice.com/user/71390/12c10d33-3c88-4b2a-ba85-19bcf0e900b8.png)

- 加入到忽略脚本列表`Add script to ignore list`

![](https://files.mdnice.com/user/71390/28681b56-2679-4a03-a813-d4c2b79b5156.png)

加入忽略列表后,`Source`源码选项卡底部会有忽略列表配置项提示也可以移除忽略列表.

![](https://files.mdnice.com/user/71390/789babd9-1971-41ed-ba5b-1e7035214df1.png)

通过上述方式禁用断点再点击 `Resume Script Execution(F8)` 按钮继续脚本执行,然后即使再次刷新网站,也不会无限`debugger`断点调试了.

> 除了第一个禁用断点全局生效,其他方式只针对单个`debugger`有用!

![](https://files.mdnice.com/user/71390/315e82a8-ccec-41dd-a694-b1027eb868ac.png)

```js
(() => {
  function ban() {
    setInterval(() => { debugger; }, 50);
  }
  try {
    ban();
  } catch (err) { }
})();
```

## 升级

解决方案: 将 `debugger` 替换成 `Function('debugger')()`

这种`Function`构造器生成的 `debugger` 会在每一次执行时开启一个**临时 js 文件**

```js
(() => {
  function ban() {
    setInterval(() => {
      Function('debugger').call();
    }, 50);
  }
  try {
    ban();
  } catch (err) { }
})();
```

![](https://files.mdnice.com/user/71390/d35564a3-f789-483f-bc21-4066329c9c00.gif)

> 这种方式只有禁用断点`Deactivate breakpoints(Ctrl + F8)`一种方式可以破解,其余在断点位置右键菜单选项均失效!
