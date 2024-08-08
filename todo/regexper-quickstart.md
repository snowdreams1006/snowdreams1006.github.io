# regexper快速入门

## 基于 node:8 版本

- 安装 nvm 下载 node:8

```bash
# 下载 node:8
nvm install 8

# 使用 node:8
nvm use 8
```

- 安装 yarn 并下载依赖

``` bash
yarn install
```

## 搭建本地开发环境

- 启动测试环境

```bash
yarn start
```

## 二次开发项目

- 定位解析正则表达式源码入口

> `regexper-static/src/js/main.js`

```js
_.each(document.querySelectorAll('[data-expr]'), element => {
    new Parser(element, { keepContent: true })
      .parse(element.getAttribute('data-expr'))
      .then(parser => {
        parser.render();
      })
      .catch(util.exposeError);
  });
```

> `regexper-static/src/js/parser/javascript/node.js`

```
```

> `regexper-static/src/js/parser/javascript/parser_state.js`