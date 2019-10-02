# 开发插件

## 什么是插件

Plugins are the best way to extend GitBook functionalities (ebook and website). There exist plugins to do a lot of things: bring math formulas display support, track visits using Google Analytic, etc.

## 如何发现插件

Plugins can be easily searched on [plugins.gitbook.com](https://plugins.gitbook.com).

## 如何安装插件

Once you find a plugin that you want to install, you need to add it to your `book.json`:

```
{
    "plugins": ["myPlugin", "anotherPlugin"]
}
```

You can also specify a specific version using: `"myPlugin@0.3.1"`. By default GitBook will resolve the latest version of the plugin compatbile with the current GitBook version.

### legacy.gitbook.com

Plugins are automatically installed on [legacy.gitbook.com](https://legacy.gitbook.com). Locally, run `gitbook install` to install and prepare all plugins for your books.

### 配置插件

Plugins specific configurations are stored in `pluginsConfig`. You have to refer to the documentation of the plugin itself for details about the available options.

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