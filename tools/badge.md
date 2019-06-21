# github 上各式各样的小徽章从何而来?

## 前言

平时大家在在逛 `github` 时或多或少都看到过项目首页各式各样的小徽章,不知道你是否和我一样好奇这些小徽章都是哪来的呢?

首先我们先来一睹为快目前前端开发的三大主流框架: `var` ,看一看他们的 `github` 项目首页有哪些小徽章吧!

- `Vue` : [https://github.com/vuejs/vue](https://github.com/vuejs/vue)

[![Build Status](https://img.shields.io/circleci/project/github/vuejs/vue/dev.svg)](https://circleci.com/gh/vuejs/vue/tree/dev)
[![Coverage Status](https://img.shields.io/codecov/c/github/vuejs/vue/dev.svg)](https://codecov.io/github/vuejs/vue?branch=dev)
[![Downloads](https://img.shields.io/npm/dm/vue.svg)](https://npmcharts.com/compare/vue?minimal=true)
[![Version](https://img.shields.io/npm/v/vue.svg)](https://www.npmjs.com/package/vue)
[![License](https://img.shields.io/npm/l/vue.svg)](https://www.npmjs.com/package/vue)
[![Chat](https://img.shields.io/badge/chat-on%20discord-7289da.svg)](https://chat.vuejs.org/)

- `Angular` : [https://github.com/angular/angular](https://github.com/angular/angular)

[![CircleCI](https://circleci.com/gh/angular/angular/tree/master.svg?style=shield)](https://circleci.com/gh/angular/workflows/angular/tree/master)
[![BrowserStack Status](https://www.browserstack.com/automate/badge.svg?badge_key=LzF3RzBVVGt6VWE2S0hHaC9uYllOZz09LS1BVjNTclBKV0x4eVRlcjA4QVY1M0N3PT0=--eb4ce8c8dc2c1c5b2b5352d473ee12a73ac20e06)](https://www.browserstack.com/automate/public-build/LzF3RzBVVGt6VWE2S0hHaC9uYllOZz09LS1BVjNTclBKV0x4eVRlcjA4QVY1M0N3PT0=--eb4ce8c8dc2c1c5b2b5352d473ee12a73ac20e06)
[![Chat](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/angular/angular?utm_source=badge&amp;utm_medium=badge&amp;utm_campaign=pr-badge&amp;utm_content=badge)
[![npm version](https://badge.fury.io/js/%40angular%2Fcore.svg)](https://www.npmjs.com/@angular/core)

- `React` : [https://github.com/facebook/react](https://github.com/facebook/react)

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/facebook/react/blob/master/LICENSE)
[![npm version](https://img.shields.io/npm/v/react.svg?style=flat)](https://www.npmjs.com/package/react)
[![CircleCI Status](https://circleci.com/gh/facebook/react.svg?style=shield&amp;circle-token=:circle-token)](https://circleci.com/gh/facebook/react)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://reactjs.org/docs/how-to-contribute.html#your-first-pull-request)

小结:

前端三大框架的徽章均不相同,由此可见,这应该不是 `github` 统一分发而是自定义行为!

> 虽然不是统一分配的,但也不是毫无规律可寻,想要制作专属的小徽章,其实真的很简单!

## 什么是徽章

徽章是一种小巧精美的小图标,一般配有相关文字进行辅助说明,富有表现力.

不仅出现于 `github` 项目主页,凡是能够表现图片的地方都可以出现徽章,本质上是一种 `svg` 格式的矢量图标.

下面以自定义 `github-snowdreams1006-brightgreen.svg` 徽章为例,简单认识一下徽章.

- 在线链接

> 在线链接: [github-snowdreams1006-brightgreen.svg](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)

```plain
https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg
```

- 浏览器效果

> 打开在线链接,并检查当前网页,豁然开朗,徽章是一种 `svg` 实现的矢量图标.

![badge-inspect-github-snowdreams1006-brightgreen.png](./images/badge-inspect-github-snowdreams1006-brightgreen.png)

- `svg` VS `png`

> 如果说 `svg` 是矢量图形而 `png` 却不是,所以不妨将 `png` 姑且称之为标量图形.

`svg` 是矢量图形,`png` 是标量图形,两者均能实现类似效果,只不过矢量图形不论怎么方法都能保持原样,并不会像 `png` 那样会失真而已.

既然两种均能表现相同的效果,现在我们就来演示一下 `png` 的实现效果.

![badge-github-snowdreams1006-brightgreen.png](./images/badge-github-snowdreams1006-brightgreen.png)

> `svg` 转 `png` 在线网站: [https://cloudconvert.com/svg-to-svg](https://cloudconvert.com/svg-to-svg)

![badge-github-snowdreams1006-svg-png.png](./images/badge-github-snowdreams1006-svg-png.png)

> 左侧的 `svg` 无论放大多少倍,依然保持原样,清晰度保持不变.右侧的 `png` 一旦放大,立马变得模糊不清.

## 如何使用徽章

大多数徽章都是 `svg` 格式,当然也不排除某些徽章是 `png` 格式,不论怎么说,一律当成图标使用就可以了.

如果你和我一样,希望在 `markdown` 文件中使用徽章,那么建议使用在线链接,或者引入本地 `svg` 相关文件.

> 徽章格式 : `[![图片文字说明](图片源地址)](超链接地址)` 即超链接内部嵌套图片

```markdown
[![github](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)](https://github.com/snowdreams1006)
```

[![github](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)](https://github.com/snowdreams1006)

如果你是在 `html` 文件使用徽章,同样先取得在线徽章地址,然后按照 `html` 语法插入图片即可.

> 徽章格式 : `<a href="超链接地址"><img src="图片源地址" alt="图片文字说明"></a>` 即超链接内部嵌套图片

```html
<a href="https://github.com/snowdreams1006">
	<img src="https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg" alt="github">
</a>
```

<a href="https://github.com/snowdreams1006">
	<img src="https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg" alt="github">
</a>

不论是什么语法,最核心最根本的获得到**徽章链接**,至于不同语言有着各自的语法,按照语言规则手动拼接就好.

- `Badge URL`

```plain
https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg
```

- `Markdown`

```markdown
[![github](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)](https://github.com/snowdreams1006)
```

- `HTML`

```html
<a href="https://github.com/snowdreams1006"><img src="https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg" alt="github"></a>
```

- `Textile`

```textile
!https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg!:https://github.com/snowdreams1006
```

- `RDOC`

```rdoc
{<img src="https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg" alt="github" />}[https://github.com/snowdreams1006]
```

- `AsciiDoc`

```asciidoc
image:https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg["github", link="https://github.com/snowdreams1006"]
```

- `RST`

```rst
.. image:: https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg
    :target: https://github.com/snowdreams1006
```

## 徽章分类

如果以徽章的**格式**为标准,那么可以分为`svg` 和 `png` 两类.

- `svg`

```plain
https://badge.fury.io/js/gitbook-plugin-mygitalk.svg
```

![gitbook-plugin-mygitalk.svg](https://badge.fury.io/js/gitbook-plugin-mygitalk.svg)

- `png`

```plain
https://badge.fury.io/js/gitbook-plugin-mygitalk.png
```

![gitbook-plugin-mygitalk.png](https://badge.fury.io/js/gitbook-plugin-mygitalk.png)

如果以徽章的**样式**为标准,那么可以分为默认样式和自定义样式两类.

- 默认样式

```plain
https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io.svg?style=social
```

![GitHub stars](https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io.svg?style=social)

- 自定义样式

```plain
https://img.shields.io/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg
```

![雪之梦技术驿站](https://img.shields.io/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)

如果以徽章的**内容数据是否动态**为标准,那么可以分为静态数据和动态数据两类.

> 静态数据意味着数据本身是不变的,只要在线链接不变,那么生成的徽章永远不会改变,而动态数据意味着生成徽章的数据是动态变化的,即使在线链接不变,当数据本身发现变化时,徽章自然随之更新.

- 静态数据

```plain
https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg
```

![github-snowdreams1006-brightgreen.svg](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)

- 动态数据

```plain
https://badge.fury.io/js/gitbook-plugin-mygitalk.svg
```

![gitbook-plugin-mygitalk.svg](https://badge.fury.io/js/gitbook-plugin-mygitalk.svg)

> 静态数据示例中 `github-snowdreams1006-brightgreen.svg` 数据不会更改,自然生成的徽章也不会变.动态数据示例中 `gitbook-plugin-mygitalk.svg` 是 `npm` 的版本号,当项目升级后,版本号会发生更改,那么生成的徽章也会随之更新.

如果以徽章的**内容数据来源**为标准,那么可以有无数多的分类.

- `GitHub`

```plain
https://badgen.net/github/stars/snowdreams1006/gitbook-plugin-mygitalk
```

![gitbook-plugin-mygitalk](https://badgen.net/github/stars/snowdreams1006/gitbook-plugin-mygitalk)

- `Npm`

```plain
https://badgen.net/npm/dt/gitbook-plugin-mygitalk
```

![gitbook-plugin-mygitalk](https://badgen.net/npm/dt/gitbook-plugin-mygitalk)

- `Docker`

```plain
https://badgen.net/docker/stars/library/centos
```

![centos](https://badgen.net/docker/stars/library/centos)

如果以徽章的**内容数据用途**为标准,那么也可以有无数多的分类.

- 构建状态

```plain
https://img.shields.io/travis/GitbookIO/gitbook.svg
```

![Travis (.org)](https://img.shields.io/travis/GitbookIO/gitbook.svg)

- 代码覆盖率

```plain
https://img.shields.io/codecov/c/github/vuejs/vue.svg
```

![Codecov](https://img.shields.io/codecov/c/github/vuejs/vue.svg)

- 代码分析

```plain
https://img.shields.io/github/languages/top/snowdreams1006/snowdreams1006.github.io.svg
```

![GitHub top language](https://img.shields.io/github/languages/top/snowdreams1006/snowdreams1006.github.io.svg)

## 徽章来源

徽章有不同的分类,不管是哪种分类,在线徽章最为简单便捷,下面就简单介绍下提供在线生成徽章的网站.

- [https://shields.io/](https://shields.io/)
- [https://badgen.net/](https://badgen.net/)
- [https://forthebadge.com/](https://forthebadge.com/)
- [https://badge.fury.io/](https://badge.fury.io/)
- [https://github.com/boennemann/badges](https://github.com/boennemann/badges)

### https://shields.io/

> 适用于绝大多数情况,默认按照徽章内容分类,`Build`,`Code Coverage`,`Analysis` 等多主题,同时支持自定义徽章和动态徽章.

如果徽章的主题明确,那么根据网站提供的主题对号入座即可在线生成徽章,下面以 `gitbook-plugin-mygitalk` 为例,简要说明如何获得相应徽章链接.

> [gitbook-plugin-mygitalk](https://www.npmjs.com/package/gitbook-plugin-mygitalk) 是 `gitbook` 的一款评论插件.

![badge-shields.io-theme.png](./images/badge-shields.io-theme.png)

打开网站后按照分类,选择其中一个主题,点击进去后填写目标信息,即可在线生成徽章.

- 浏览已支持的主体,选择 `License` 许可证主题.

![badge-shields.io-theme-license.png](./images/badge-shields.io-theme-license.png)

- 浏览已支持的 `License` 许可证列表,选择 `NPM` 许可证.

![badge-shields.io-theme-license-npm.png](./images/badge-shields.io-theme-license-npm.png)

- 填写好正确的 `npm` 包信息并实时预览,然后点击按钮复制徽章链接或者或者特定格式的徽章.

```markdown
![NPM](https://img.shields.io/npm/l/gitbook-plugin-mygitalk.svg)
```

![NPM](https://img.shields.io/npm/l/gitbook-plugin-mygitalk.svg)

> 按照主题生成徽章真的很简单,首先对号入座,然后按需生成相应徽章即可,唯一的要求就是**对号入座**!

如果默认提供的徽章主题没有适合自己的徽章,或者想要自定义徽章效果,那么也可以在线制作私人订制徽章.

- 打开网站后往下拉,找到 `Your Badge` 区域,准备制作专属徽章.

![badge-shields.io-custom.png](./images/badge-shields.io-custom.png)

- 填写(`Label`)标签-(`Message`)信息-(`Color`)颜色等信息后,点击(`Make Badge`)生成徽章.

![badge-shields.io-custom-make.png](./images/badge-shields.io-custom-make.png)

- 点击生成徽章后默认会在当前标签页面打开该链接,手动复制链接并调整成目标格式即可.

![badge-shields.io-custom-make-preview.png](./images/badge-shields.io-custom-make-preview.png)

```markdown
![微信公众号-雪之梦技术驿站-brightgreen.svg](https://img.shields.io/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)
```

![微信公众号-雪之梦技术驿站-brightgreen.svg](https://img.shields.io/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)

### https://badgen.net/

> 徽章内容来源种类较多,默认按照平台分类,按照特定规则生成徽章,需要手动拼接在线链接,略显繁琐.

```plain
https://badgen.net/badge/:subject/:status/:color?icon=github
                   ──┬──  ───┬───  ──┬───  ──┬── ────┬──────
                     │       │       │       │       └─ Extra Options (label, list, icon, color)
                     │       │       │       │
                     │      TEXT    TEXT    RGB / COLOR_NAME ( optional )
                     │
                  "badge" - default (static) badge generator
```

![badge-badgen.net.png](./images/badge-badgen.net.png)

虽然支持颜色,图标以及查询参数等高级用法,但是还是习惯性采用默认设置,下面动手开始制作徽章吧!

- 切换到默认动态徽章选项卡,选择 `GitHUb` 徽章.

![badge-badgen.net-live-github.png](./images/badge-badgen.net-live-github.png)

- 选择 `stars` 徽章,将 `micromatch` 替换成目标信息.

`/github/stars/micromatch/micromatch` 替换成 `/stars/snowdreams1006/snowdreams1006.github.io`

- 预览徽章效果并手动修改成目标格式.

![badge-badgen.net-live-github-snowdreams1006.png](./images/badge-badgen.net-live-github-snowdreams1006.png)

```markdown
![snowdreams1006.github.io](https://badgen.net/github/stars/snowdreams1006/snowdreams1006.github.io)
```

![snowdreams1006.github.io](https://badgen.net/github/stars/snowdreams1006/snowdreams1006.github.io)

除了支持动态徽章,同样也支持静态徽章,切换到 `STATIC BADGES` 选项卡,一起来生成静态徽章吧!

![badge-badgen.net-static.png](./images/badge-badgen.net-static.png)

```markdown
![★★★★☆](https://badgen.net/badge/stars/%E2%98%85%E2%98%85%E2%98%85%E2%98%85%E2%98%86)
```

![★★★★☆](https://badgen.net/badge/stars/%E2%98%85%E2%98%85%E2%98%85%E2%98%85%E2%98%86)

按照徽章的在线链接规则,应该也支持自定义徽章,再次回顾一下链接规则:

> 规则 : `https://badgen.net/badge/:subject/:status/:color` ,如果是自定义动态链接,估计不支持吧!

```markdown
![微信公众号-雪之梦技术驿站](https://badgen.net/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7/%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99)
```

![微信公众号-雪之梦技术驿站](https://badgen.net/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7/%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99)

### https://forthebadge.com/

> 扁平化的徽章,支持的徽章数量有限,不支持自定义徽章.

![badge-orthebadge.com.png](./images/badge-orthebadge.com.png)

网站首页默认提供了一些预览徽章,左侧是复制 `image` 链接,右侧是复制 `markdown` 链接.

```markdown
[![forthebadge](https://forthebadge.com/images/badges/fuck-it-ship-it.svg)](https://forthebadge.com)
```

[![forthebadge](https://forthebadge.com/images/badges/fuck-it-ship-it.svg)](https://forthebadge.com)

网站首页默认展示的徽章毕竟有限,如果找不到理想徽章,岂不是白介绍了这个网站,当然不能够!

`VIEW ALL` 查看目前支持的全部徽章,如果还是找不到徽章,那就真的没有.

![badge-orthebadge.com-all.png](./images/badge-orthebadge.com-all.png)

### https://badge.fury.io/

> 版本徽章,支持各类平台版本,包括 `npm` ,`Ruby`,`Python`,`Go` 等平台.

![badge-badge.fury.io.png](./images/badge-badge.fury.io.png)

选择目标平台并输入包管理信息,即可在线生成各个类型的徽章版本.

![badge-badge.fury.io-npm.png](./images/badge-badge.fury.io-npm.png)

```markdown
[![npm version](https://badge.fury.io/js/gitbook-plugin-mygitalk.svg)](https://badge.fury.io/js/gitbook-plugin-mygitalk)
```

[![npm version](https://badge.fury.io/js/gitbook-plugin-mygitalk.svg)](https://badge.fury.io/js/gitbook-plugin-mygitalk)

## 排版布局

默认 `markdown` 实现的图片是依次排开的,无法自定义样式,而 `markdown` 语法同时也兼容 `html` 语法,因此我们可以用 `html` 语法实现**居中对齐**.

```html
<p align="center">
	<a href="https://circleci.com/gh/vuejs/vue/tree/dev">
		<img src="https://img.shields.io/circleci/project/github/vuejs/vue/dev.svg" alt="Build Status">
	</a>
	<a href="https://codecov.io/github/vuejs/vue?branch=dev">
		<img src="https://img.shields.io/codecov/c/github/vuejs/vue/dev.svg" alt="Coverage Status">
	</a>
	<a href="https://www.npmjs.com/package/vue">
		<img src="https://img.shields.io/npm/dm/vue.svg" alt="Downloads">
	</a>
	<a href="https://www.npmjs.com/package/vue">
		<img src="https://img.shields.io/npm/l/vue.svg" alt="License">
	</a>
	<a href="https://chat.vuejs.org/">
		<img src="https://img.shields.io/badge/chat-on%20discord-7289da.svg" alt="License">
	</a>
</p>
```

<p align="center">
	<a href="https://circleci.com/gh/vuejs/vue/tree/dev">
		<img src="https://img.shields.io/circleci/project/github/vuejs/vue/dev.svg" alt="Build Status">
	</a>
	<a href="https://codecov.io/github/vuejs/vue?branch=dev">
		<img src="https://img.shields.io/codecov/c/github/vuejs/vue/dev.svg" alt="Coverage Status">
	</a>
	<a href="https://www.npmjs.com/package/vue">
		<img src="https://img.shields.io/npm/dm/vue.svg" alt="Downloads">
	</a>
	<a href="https://www.npmjs.com/package/vue">
		<img src="https://img.shields.io/npm/l/vue.svg" alt="License">
	</a>
	<a href="https://chat.vuejs.org/">
		<img src="https://img.shields.io/badge/chat-on%20discord-7289da.svg" alt="License">
	</a>
</p>

## 抛砖引玉

- 社交化徽章

![GitHub followers](https://img.shields.io/github/followers/snowdreams1006.svg?style=social)
![GitHub forks](https://img.shields.io/github/forks/snowdreams1006/snowdreams1006.github.io.svg?style=social)
![GitHub stars](https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io.svg?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/snowdreams1006/snowdreams1006.github.io.svg?style=social)

```markdown
![GitHub followers](https://img.shields.io/github/followers/snowdreams1006.svg?style=social)
![GitHub forks](https://img.shields.io/github/forks/snowdreams1006/snowdreams1006.github.io.svg?style=social)
![GitHub stars](https://img.shields.io/github/stars/snowdreams1006/snowdreams1006.github.io.svg?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/snowdreams1006/snowdreams1006.github.io.svg?style=social)
```

- 自定义徽章

[![github](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)](https://github.com/snowdreams1006)
[![wechat](https://img.shields.io/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](http://weixin.qq.com/r/cy5CWvvE5Kabrb8593th)
[![慕课网](https://img.shields.io/badge/%E6%85%95%E8%AF%BE%E7%BD%91-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://www.imooc.com/u/5224488/articles)
[![简书](https://img.shields.io/badge/%E7%AE%80%E4%B9%A6-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://www.jianshu.com/u/577b0d76ab87)
[![csdn](https://img.shields.io/badge/csdn-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://blog.csdn.net/weixin_38171180)
[![博客园](https://img.shields.io/badge/%E5%8D%9A%E5%AE%A2%E5%9B%AD-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://www.cnblogs.com/snowdreams1006/)
[![掘金](https://img.shields.io/badge/%E6%8E%98%E9%87%91-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://juejin.im/user/582d5cb667f356006331e586)
[![思否](https://img.shields.io/badge/%E6%80%9D%E5%90%A6-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://segmentfault.com/u/snowdreams1006)
[![开源中国](https://img.shields.io/badge/%E5%BC%80%E6%BA%90%E4%B8%AD%E5%9B%BD-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://my.oschina.net/snowdreams1006)
[![腾讯云社区](https://img.shields.io/badge/%E8%85%BE%E8%AE%AF%E4%BA%91%E7%A4%BE%E5%8C%BA-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://cloud.tencent.com/developer/user/2952369/activities)

```markdown
[![github](https://img.shields.io/badge/github-snowdreams1006-brightgreen.svg)](https://github.com/snowdreams1006)
[![wechat](https://img.shields.io/badge/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](http://weixin.qq.com/r/cy5CWvvE5Kabrb8593th)
[![慕课网](https://img.shields.io/badge/%E6%85%95%E8%AF%BE%E7%BD%91-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://www.imooc.com/u/5224488/articles)
[![简书](https://img.shields.io/badge/%E7%AE%80%E4%B9%A6-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://www.jianshu.com/u/577b0d76ab87)
[![csdn](https://img.shields.io/badge/csdn-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://blog.csdn.net/weixin_38171180)
[![博客园](https://img.shields.io/badge/%E5%8D%9A%E5%AE%A2%E5%9B%AD-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://www.cnblogs.com/snowdreams1006/)
[![掘金](https://img.shields.io/badge/%E6%8E%98%E9%87%91-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://juejin.im/user/582d5cb667f356006331e586)
[![思否](https://img.shields.io/badge/%E6%80%9D%E5%90%A6-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://segmentfault.com/u/snowdreams1006)
[![开源中国](https://img.shields.io/badge/%E5%BC%80%E6%BA%90%E4%B8%AD%E5%9B%BD-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://my.oschina.net/snowdreams1006)
[![腾讯云社区](https://img.shields.io/badge/%E8%85%BE%E8%AE%AF%E4%BA%91%E7%A4%BE%E5%8C%BA-%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99-brightgreen.svg)](https://cloud.tencent.com/developer/user/2952369/activities)
```

- 进度条徽章

[![progress](http://progressed.io/bar/25?title=progress)](https://github.com/fehmicansaglam/progressed.io)
[![progress](http://progressed.io/bar/50?title=progress)](https://github.com/fehmicansaglam/progressed.io)
[![completed](http://progressed.io/bar/75?title=completed)](https://github.com/fehmicansaglam/progressed.io)
[![done](http://progressed.io/bar/100?title=done)](https://github.com/fehmicansaglam/progressed.io)

```markdown
[![progress](http://progressed.io/bar/25?title=progress)](https://github.com/fehmicansaglam/progressed.io)
[![progress](http://progressed.io/bar/50?title=progress)](https://github.com/fehmicansaglam/progressed.io)
[![completed](http://progressed.io/bar/75?title=completed)](https://github.com/fehmicansaglam/progressed.io)
[![done](http://progressed.io/bar/100?title=done)](https://github.com/fehmicansaglam/progressed.io)
```

## 参考文档

- [GitHub 项目徽章的添加和设置](https://juejin.im/post/5a32157c6fb9a0450b6667ac#heading-10)
- [玩转 Github 徽章](https://www.jianshu.com/p/afba6e33e48e)
- [为你的Github README生成漂亮的徽章和进度条](https://shikieiki.github.io/2017/03/01/%E4%B8%BA%E4%BD%A0%E7%9A%84Github%E7%94%9F%E6%88%90%E6%BC%82%E4%BA%AE%E7%9A%84%E5%BE%BD%E7%AB%A0%E5%92%8C%E8%BF%9B%E5%BA%A6%E6%9D%A1/)
- [给python项目在github贴上build和pypi小徽章](https://blog.csdn.net/mouday/article/details/82804630)
- [https://github.com/igrigorik/ga-beacon](https://github.com/igrigorik/ga-beacon)
- [https://github.com/boennemann/badges](https://github.com/boennemann/badges)
- [https://ellerbrock.github.io/open-source-badges/](https://ellerbrock.github.io/open-source-badges/)
- [http://githubbadges.com/](http://githubbadges.com/)
