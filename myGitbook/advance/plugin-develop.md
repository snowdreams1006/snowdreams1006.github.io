# 开发插件

## 什么是插件

插件是**扩展** `GitBook` 功能(电子书和网站)的**最佳方式**.

只要是 `Gitbook` 默认没有提供的功能,基于**插件机制**都可以**自行扩展**,插件让 `Gitbook` 更加强大.

本文将**全面介绍**插件的相关知识点并**重点介绍插件开发的全流程**,只有熟悉插件开发流程才能做到有的放矢,**心中有数**,进而开发出自己的插件.

> 关于插件请参考 `Gitbook` 入门教程**高级进阶**系列文章,本文重点讲解开发 `Gitbook` 的**基本流程**.
>
> - [gitbook 入门教程之插件介绍](https://mp.weixin.qq.com/s/mJEENlUdu_gIdQRYOS56dQ)
> - [gitbook 入门教程之实用插件](https://mp.weixin.qq.com/s/B7p0KYiKzs5CHywUmb3_NQ)
> - [gitbook 入门教程之主题插件](https://mp.weixin.qq.com/s/Q-S_3A5NvUMzGEk7HT9p_w)

## 如何发现插件

您可以在~~[https://plugins.gitbook.com](https://plugins.gitbook.com)~~轻松搜索插件,也可以在[https://www.npmjs.com](https://www.npmjs.com)搜索 `gitbook-plugin-<name>` 插件.

> 目前 `Gitbook` 官方已不再为维护 `https://plugins.gitbook.com` 插件网站,只能通过 `https://www.npmjs.com` 发现 `Gitbook` 插件.

## 如何安装插件

一旦你找到你想要安装的插件,你需要将它添加到你的 `book.json` 配置文件,如果没有该文件则自行创建.

```json
{
    "plugins": ["myPlugin", "anotherPlugin"]
}
```

您还可以使用以下命令指定特定版本: `myPlugin@0.3.1` .
默认不填写版本的情况下,`GitBook` 使用最新版本(兼容版本)的插件.

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
安装插件时,最好浏览插件的文档了解相关选项的详细信息.

## 如何开发插件

A GitBook plugin is a node package published on NPM that follow a defined convention.

### 目录结构

#### package.json

The `package.json` is a manifest format for describing **Node.js modules**. GitBook plugins are built on top of Node modules. It declares dependencies, version, ownership, and other information required to run a plugin in GitBook. This document describes the schema in detail.

A plugin manifest `package.json` can also contain details about the required configuration. The configuration schema is defined in the `gitbook` field of the `package.json` (This field follow the [JSON-Schema](http://json-schema.org) guidelines):

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

You can learn more about `package.json` from the [NPM documentation](https://docs.npmjs.com/files/package.json).

The **package name** must begin with `gitbook-plugin-` and the **package engines** should contains `gitbook`.

#### index.js

The `index.js` is main entry point of your plugin runtime:

```js
module.exports = {
    // Map of hooks
    hooks: {},

    // Map of new blocks
    blocks: {},

    // Map of new filters
    filters: {}
};
```

### 发布插件

GitBook plugins can be published on [NPM](https://www.npmjs.com).

To publish a new plugin, you need to create an account on [npmjs.com](https://www.npmjs.com) then publish it from the command line:

```
$ npm publish
```

### 私有化插件

Private plugins can be hosted on GitHub and included using `git` urls:

```
{
    "plugins": [
        "myplugin@git+https://github.com/MyCompany/mygitbookplugin.git#1.0.0"
    ]
}
```

### 本地测试插件

Testing your plugin on your book before publishing it is possible using [npm link](https://docs.npmjs.com/cli/link).

In the plugin's folder, run:

```
$ npm link
```

Then in your book's folder:

```
$ npm link gitbook-plugin-<plugin's name>
```

### 单元测试插件

[gitbook-tester](https://github.com/todvora/gitbook-tester) makes it easy to write **Node.js/Mocha** unit tests for your plugins. Using [Travis.org](https://travis.org), tests can be run on each commits/tags.

## 插件总结

welcome to develop your own plugins

## 阅读延伸

- [https://snowdreams1006.github.io/gitbook-official/en/plugins/](https://snowdreams1006.github.io/gitbook-official/en/plugins/)
- [https://snowdreams1006.github.io/gitbook-official/en/plugins/create.html](https://snowdreams1006.github.io/gitbook-official/en/plugins/create.html)
- [https://snowdreams1006.github.io/gitbook-official/en/plugins/testing.html](https://snowdreams1006.github.io/gitbook-official/en/plugins/testing.html)