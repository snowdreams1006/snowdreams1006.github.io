# 环境要求

`gitbook` 是基于 `node.js` 的命令行工具,首先需要安装并配置好 `node.js` 环境,然后才能安装`gitbook` 相关工具.

由于安装工具全部都是国外网站,因此速度可能会很慢,也可能需要FQ,请耐心等待或者学会科学上网.

> 当然如果安装过程中遇到任何问题,也可以找我要一下安装包或者我帮你免费解决下.

## 环境预检查

### 检查 `git` 环境[可选]

`git` 是免费开源的分布式版本控制系统,主要用于电子书的更新管理和团队协作,如果不需要将电子书托管到`github` 网站上,则可以不安装 `git` .

如果打印出 `git` 版本信息,则表示本机已安装 `git` 环境,跳过此步骤.

```
$ git --version
```

>`git` 安装配置教程请参考[初识 git](https://snowdreams1006.github.io/git/base/about.html)

### 检查 `node.js` 环境[必须]

`node.js` 是 `js` 在服务端运行的环境基础,从而使得 `js` 从浏览器端延伸到服务端领域,而 `gitbook` 则是运行在 `node.js` 基础之上的命令行工具,因此必须先安装好 `node.js` 开发环境.

如果打印出 `node.js` 版本信息,则表示本机已安装 `node.js` 环境,跳过此步骤.

```
$ node -v
```

>`node.js` 安装配置教程请参考 [https://nodejs.org/](https://nodejs.org/en/)

### 检查 `gitbook` 环境[必须]

`gitbook-cli` 是 `gitbook` 的脚手架工具,帮助我们更方便构建 `gitbook` 应用,当然也可以直接安装 `gitbook` ,只不过那样的话,略显麻烦,不推荐.

如果打印出 `gitbook` 和 `cli` 版本信息,则表示本机已安装 `gitbook` 环境,跳过此步骤.

```
$ gitbook -V
```

否则的话,本机可能并没有安装 `gitbook` 环境,则需要安装 `gitbook` 相关工具.

因为 `gitbook` 是基于 `node.js` 环境,而安装好 `node.js` 后默认提供了 `npm` 包管理工具,而我们则是通过 `npm` 来安装其他工具.

#### 安装 `gitbook-cli` 工具[必须]

假设你已经搭建好 `node.js` 环境,现在我们开始安装 `gitbook` 相关工具了!

```
$ sudo npm install -g gitbook-cli
```

> 全局安装的话,可能需要超级管理员权限,输入下相应密码即可继续安装,如无报错,则表示安装成功.

安装成功后会带有 `gitbook` 命令,现在再次运行下 `gitbook -V` 查看版本信息.

```
# 打印出 `CLI` 和 `GitBook` 版本信息即可,安装版本可能已经大于 `2.3.2`
$ gitbook -V
CLI version: 2.3.2
GitBook version: 3.2.3
$ 
```

#### 安装 `GitBook Editor` 编辑器[可选]

`gitbook` 官方客户端编辑器,支持 `windows`, `mac` 和 `linux` ,主要用于可视化编辑文档,组织文档结构.

下载相应平台的 [GitBook Editor](https://legacy.gitbook.com/editor),正常安装即可.

![gitbook-editor-preview.png](../images/gitbook-editor-preview.png)

`gitbook` 的使用方法大致可以有三种,而 `GitBook Editor` 编辑器只是其中一种,所以这一步是可选的.

-  使用 `gitbook-cli` 脚手架提供的各种命令直接在命令行管理 `gitbook`,适合一定编程经验的软件从业人员.
-  使用 `GitBook Editor` 编辑器管理 `gitbook` ,适合无任何编程的文学创作者.
-  使用 `gitbook.com` 官网在线管理 `gitbook` ,适合不具备本地开发环境的萌新体验者.

## 小结

`gitbook` 基于 `node.js` 开发环境,因此首先要安装好 [nodejs](https://nodejs.org/en/) 环境,其次再使用 `node.js` 提供的 `npm` 包管理工具来安装 `gitbook`.

只需运行 `sudo npm install -g gitbook-cli` 即可安装,接着运行 `gitbook -V` 查看安装版本信息确认已经安装成功.

至此 `gitbook` 的必要开发环境已经准备妥当,接下来让我们赶紧体验一下 `gitbook` 的魅力吧!


