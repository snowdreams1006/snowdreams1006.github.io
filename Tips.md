```bash
# markdown文件图片处理器
winpty python /g/git/myserver/python/markdown-convert-image.py /g/git/blog/

python3 /Users/snowdreams1006/Documents/workspace/git/myserver/python/markdown-convert-image.py /Users/snowdreams1006/Documents/workspace/git/blog/tools/news-tools.md
```

```bash
scp -r *.html ali:~/nginx/html/blog
scp -r assets/js/* ali:~/nginx/html/blog/assets/js
```

```bash
# 查看公钥
cat ~/.ssh/id_rsa.pub

# 添加 Gitee 推送地址
git remote set-url --add origin git@gitee.com:snowdreams1006/snowdreams1006.git
# 添加 Gitlab 推送地址
git remote set-url --add origin git@gitlab.com:snowdreams1006/snowdreams1006.gitlab.io.git

% git remote -v
origin  git@github.com:snowdreams1006/snowdreams1006.github.io.git (fetch)
origin  git@github.com:snowdreams1006/snowdreams1006.github.io.git (push)
origin  git@gitee.com:snowdreams1006/snowdreams1006.git (push)
origin  git@gitlab.com:snowdreams1006/snowdreams1006.gitlab.io.git (push)
```

```js
// https://zhuanlan.zhihu.com/p/689707885
// https://blog.csdn.net/y662225dd/article/details/135742404
window.open("about:blank", "_self");

// 禁止右键菜单
document.oncontextmenu = function(event) {
    event.preventDefault();
    return false;
};
// 恢复右键菜单
document.oncontextmenu = function(event) {
    return true;
};

// 禁止F12快捷键
document.onkeydown = document.onkeyup = document.onkeypress = function(event) {
    let e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 123) {
        e.returnValue = false;
        return false;
    }
};
// 恢复F12快捷键
document.onkeydown = document.onkeyup = document.onkeypress = function(event) {
    let e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 123) {
        e.returnValue = true;
        return true;
    }
};

// 禁止开发者控制台
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

```bash
node -v 
# v10.24.1
npm -v 
# 6.14.12

sudo npm install -g gitbook-cli
gitbook install
gitbook serve
```