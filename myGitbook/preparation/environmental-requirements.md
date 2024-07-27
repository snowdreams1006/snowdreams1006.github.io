# 环境要求

`gitbook` 是基于 `node.js` 的命令行工具,首先需要安装并配置好 `node.js` 环境,然后才能安装`gitbook` 相关工具.

由于安装工具全部都是国外网站,因此速度可能会很慢,也可能需要FQ,请耐心等待或者学会科学上网.

> 当然如果安装过程中遇到任何问题,也可以找我要一下安装包或者我帮你免费解决下.

## 环境预检查

### 检查 `git` 环境[可选]

`git` 是免费开源的分布式版本控制系统,主要用于电子书的更新管理和团队协作,如果不需要将电子书托管到`github` 网站上,则可以不安装 `git` .

如果打印出 `git` 版本信息,则表示本机已安装 `git` 环境,跳过此步骤.

```bash
git --version
```

>`git` 安装配置教程请参考[初识 git](https://snowdreams1006.github.io/git/base/about.html)

### 检查 `node.js` 环境[必须]

`node.js` 是 `js` 在服务端运行的环境基础,从而使得 `js` 从浏览器端延伸到服务端领域,而 `gitbook` 则是运行在 `node.js` 基础之上的命令行工具,因此必须先安装好 `node.js` 开发环境.

如果打印出 `node.js` 版本信息,则表示本机已安装 `node.js` 环境,跳过此步骤.

```bash
node --version
```

> `nodejs` 默认的包安装工具 `npm` 国内访问速度有点慢,安装完毕后建议 `npm install cnpm -g --registry=https://registry.npm.taobao.org
` 使用淘宝镜像源代替默认的 `npm` ,详细教程请参考官方 [https://nodejs.org/](https://nodejs.org/en/)
> 推荐版本: [v10.22.0](https://nodejs.org/download/release/v10.22.0/)

```bash
npm config set registry=http://registry.npm.taobao.org
```

> `npm` 安装依赖的默认地址是国外服务器,如果速度过慢的话,建议切换到国内镜像源.

### 检查 `gitbook` 环境[必须]

`gitbook-cli` 是 `gitbook` 的脚手架工具,帮助我们更方便构建 `gitbook` 应用,当然也可以直接安装 `gitbook` ,只不过那样的话,略显麻烦,不推荐.

如果打印出 `gitbook` 和 `cli` 版本信息,则表示本机已安装 `gitbook` 环境,跳过此步骤.

```bash
gitbook --version
```

否则的话,本机可能并没有安装 `gitbook` 环境,则需要安装 `gitbook` 相关工具.

因为 `gitbook` 是基于 `node.js` 环境,而安装好 `node.js` 后默认提供了 `npm` 包管理工具,而我们则是通过 `npm` 来安装其他工具.

#### 安装 `gitbook-cli` 工具[必须]

假设你已经搭建好 `node.js` 环境,现在我们开始安装 `gitbook` 相关工具了!

```bash
npm install -g gitbook-cli
```

> 全局安装可能要有超级管理员权限: `sudo npm install -g gitbook-cli` ,如果使用 `cnpm` 安装的话,使用 `cnpm install -g gitbook-cli` 命令.

安装成功后会带有 `gitbook` 命令,现在再次运行下 `gitbook --version` 查看版本信息.

```bash
# 打印出 `CLI` 和 `GitBook` 版本信息即可,安装版本可能已经大于 `2.3.2`
gitbook --version
# CLI version: 2.3.2
# GitBook version: 3.2.3
```

按照上述脚本,安装出错,尝试解决中...

```bash
$ gitbook --version
# CLI version: 2.3.2
# Installing GitBook 3.2.3
# I:\nodejs\node_modules\gitbook-cli\node_modules\npm\node_modules\graceful-fs\polyfills.js:287
#       if (cb) cb.apply(this, arguments)
#                  ^

# TypeError: cb.apply is not a function
#     at I:\nodejs\node_modules\gitbook-cli\node_modules\npm\node_modules\graceful-fs\polyfills.js:287:18
#     at FSReqCallback.oncomplete (node:fs:203:5)
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

**更新补充**

> 常用命令快速预览

```bash
# 安装Gitbook需要node.js作为前提依赖, 安装时确保主机已经存在node.js
node -v

# 安装Gitbook多版本托管工具, 可同时托管多个Gitbook版本, 且下载最新版的Gitbook驱动
npm install gitbook-cli -g

# 验证下载是否成功
gitbook -V

# 下载历史版本[下载3.0.0版本]
# 3.2.3版本确保为不可用版本, 推荐使用3.0.0
gitbook fetch 3.0.0

# 进入到你的项目文件夹, 初始化一个Gitbook项目
gitbook init

# 生成README.md 和 SUMMARY.md 两个基本文件

# 启动服务
gitbook serve

# 指定gitbook版本启动
gitbook serve --gitbook=3.0.0

# 获取帮助
gitbook --help

# 卸载指定版本Gitbook[卸载3.2.3版本]
gitbook uninstall 3.2.3

# 生成静态网页
gitbook build

# 指定gitbook版本生成静态文件，如果本地没有将先下载
gitbook build --gitbook=3.0.0

# 列出本地所有的gitbook版本
gitbook ls

# 列出远程可用的gitbook版本
gitbook ls-remote

# 更新到gitbook的最新版本
gitbook update

# 安装配置依赖插件
gitbook install

# 指定log的级别
gitbook build --log=debug

# 输出错误信息
gitbook builid --debug

# 将 Gitbook 输出为 PDF 文件(注意需要提前安装软件) 例如: gitbook pdf . snowdreams1006.pdf
gitbook pdf . [PDF_Name]
```
