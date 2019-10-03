# 开发插件

## 什么是插件

插件是**扩展** `GitBook` 功能(电子书和网站)的**最佳方式**.

只要是 `Gitbook` **默认没有提供的功能**,基于**插件机制**都可以**自行扩展**,是插件让 `Gitbook` 变得更加强大.

![gitbook-develop-application-preview.png](./images/gitbook-develop-application-preview.png)

本文将**全面介绍**插件的相关知识并**重点介绍插件开发的全流程**,只有**熟悉插件开发流程**才能做到有的放矢,**心中有数**,进而开发出自己的插件.

> 关于插件请参考 `Gitbook` 入门教程**高级进阶**系列文章,本文重点讲解开发 `Gitbook` 的**基本流程**.
>
> - [gitbook 入门教程之插件介绍](https://mp.weixin.qq.com/s/mJEENlUdu_gIdQRYOS56dQ)
> - [gitbook 入门教程之实用插件](https://mp.weixin.qq.com/s/B7p0KYiKzs5CHywUmb3_NQ)
> - [gitbook 入门教程之主题插件](https://mp.weixin.qq.com/s/Q-S_3A5NvUMzGEk7HT9p_w)

## 如何发现插件

您可以在~~[https://plugins.gitbook.com](https://plugins.gitbook.com)~~轻松搜索插件,也可以在[https://www.npmjs.com](https://www.npmjs.com)搜索 `gitbook-plugin-<name>` 插件.

![gitbook-plugin-npm-preview.png](./images/gitbook-plugin-npm-preview.png)

> 目前 `Gitbook` 官方已不再为维护 `https://plugins.gitbook.com` 插件网站,只能通过 `https://www.npmjs.com` 发现 `Gitbook` 插件.

## 如何安装插件

一旦你找到你想要安装的插件,你需要将它添加到你的 `book.json` 配置文件,如果没有该文件则自行创建.

```json
{
    "plugins": ["myPlugin", "anotherPlugin"]
}
```

您还可以使用以下命令指定特定版本: `myPlugin@0.3.1` .
默认不填写版本的情况下,`GitBook` 使用**最新版本(兼容版本)**的插件.

### 安装插件

- 如果是[https://www.gitbook.com](https://www.gitbook.com)在线环境,网站会自动帮你安装插件.
- 如果是在本地环境,**直接运行** `gitbook install` 来安装插件.

```bash
$ gitbook install
```

或者使用 `npm` **提前下载插件再安装到本地项目**:

```bash
$ npm install gitbook-plugin-<name>

$ gitbook install
```

### 配置插件

插件的配置在 `book.json`  配置文件中的 `pluginsConfig` 属性中(如果没有该属性请自行创建),
安装插件时,最好浏览插件的文档了解相关选项的详细信息.;;

```bash
{
    "plugins": ["github"],
    "pluginsConfig": {
        "github": {
          "url": "https://github.com/snowdreams1006/snowdreams1006.github.io"
        }
    }
}
```

> 有些插件并未提供插件配置项,可以省略该步骤,有的插件会提供配置项,以插件介绍文档为准.

## 如何开发插件

`GitBook` 插件是在 `npm` 上发布的遵循**传统定义**的 `node` 包,除了标准的 `node` 规范外还有一些 `Gitbook` 自身定义的相关规范.

### 目录结构

`Gitbook` 插件最基本的项目结构至少包括**配置文件** `package.json` 和**入口文件** `index.js` ,其他目录文件根据插件用途自行增减.

```bash
.
├── index.js
└── package.json
```

> 实际插件项目略有不同,可能还会有 `_layouts` 布局目录, `asset` 资源目录以及自定义 `example` 示例目录和 `docs` 文档目录等等.

#### package.json

`package.json` 是**`nodejs`**的配置文件,`Gitbook` 插件同样遵循该规范,配置文件声明了插件的版本描述性信息,除此之外还有 `Gitbook` 相关字段,遵循[http://json-schema.org](http://json-schema.org)准则,基本示例如下:

```js
{
    "name": "gitbook-plugin-mytest",
    "version": "0.0.1",
    "description": "This is my first GitBook plugin",
    "engines": {
        "gitbook": ">1.x.x"
    },
    "gitbook": {
        "properties": {
            "myConfigKey": {
                "type": "string",
                "default": "it's the default value",
                "description": "It defines my awesome config!"
            }
        }
    }
}
```

> 值得注意的是,**包名称**必须以 `gitbook-plugin-`开头，**包引擎**应该包含`gitbook`.如需了解 `package.json` 的规范,可参考[https://docs.npmjs.com/files/package.json](https://docs.npmjs.com/files/package.json)

#### index.js

`index.js` 是插件运行时的入口,基本示例如下:

```js
module.exports = {
    // 钩子函数
    hooks: {},

    // 代码块
    blocks: {},

    // 过滤器
    filters: {}
};
```

### 发布插件

`GitBook` 插件可以在[https://www.npmjs.com](https://www.npmjs.com)上发布.

如需发布插件,首先需要在[https://www.npmjs.com](https://www.npmjs.com)上**注册帐户**,然后通过命令行发布.

```bash
$ npm publish
```

### 专用插件

专用插件可以托管在 `GitHub` 上,并使用 `git` urls:

```json
{
    "plugins": [
        "myplugin@git+https://github.com/MyCompany/mygitbookplugin.git#1.0.0"
    ]
}
```

### 本地测试插件

使用 `npm link` 可以在发布之前测试你的插件,命令详情参考[https://docs.npmjs.com/cli/link](https://docs.npmjs.com/cli/link)

在插件的文件夹中,运行：

```bash
$ npm link
```

然后在您的书或者文档的文件夹中执行:

```bash
$ npm link gitbook-plugin-<name>
```

### 单元测试插件

[gitbook-tester](https://github.com/todvora/gitbook-tester)可以方便地为你的插件编写**Node.js/Mocha**单元测试.

使用[Travis.org](https://travis.org).可以对每个提交/标签运行测试.

## 插件总结

`Gitbook` 插件是扩展 `Gitbook` 功能的不二之选,如果熟悉 `nodejs` 项目的开发流程,只要稍微熟悉下 `Gitbook` 提供的接口文档,开发出自己的插件应该不是难事!

希望本文能够对你理解 `Gitbook` 插件有所帮助,了解并熟练掌握插件开发的全流程,如果本文对你有所帮助,别忘了给我一个正面反馈以鼓励我继续创作哟!

## 阅读延伸

- [https://snowdreams1006.github.io/gitbook-official/en/plugins/](https://snowdreams1006.github.io/gitbook-official/en/plugins/)
- [https://snowdreams1006.github.io/gitbook-official/en/plugins/create.html](https://snowdreams1006.github.io/gitbook-official/en/plugins/create.html)
- [https://snowdreams1006.github.io/gitbook-official/en/plugins/testing.html](https://snowdreams1006.github.io/gitbook-official/en/plugins/testing.html)