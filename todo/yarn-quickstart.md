# yarn快速入门

> 快速、可靠、安全的依赖管理工具: [yarn 中文官网](https://yarn.bootcss.com/)

## 安装并配置

- 检测是否已经安装

```bash
yarn --version
```
 
- brew 安装 yarn

```bash
brew install yarn
```

- 设置环境变量

```bash
which yarn

export PATH="$PATH:/usr/local/bin"

source ~/.bash_profile
```

- brew 升级 yarn

```bash
brew upgrade yarn
```

## 快速入门

- 初始化新项目

```bash
yarn init
```

- 添加依赖包

```bash
# devDependencies
yarn add [package] --dev

# peerDependencies
yarn add [package] --peer

# optionalDependencies
yarn add [package] --optional
```

- 升级依赖包

```bash
yarn upgrade [package]

yarn upgrade [package]@[version]

yarn upgrade [package]@[tag]
```

- 移除依赖包

```
yarn remove [package]
```

- 安装依赖包

```bash
yarn install
```

> yarn

## npm 迁移到 yarn

> [从 npm 迁移到 yarn](https://yarn.bootcss.com/docs/migrating-from-npm/)

`package.json` 配置文件,尝试运行 `yarn` 命令重新生成 `node_modules` 模块依赖.

自动生成 `yarn.lock` 文件并纳入版本控制,确保其他人运行 `yarn` 命令的效果保持一致.

从`1.7.0` 版本后可以使用 `yarn import` 命令导入由 `npm` 生成 `package-lock.json` 文件依赖.

其他人可以保持不变,不强制要求所有人同时从 `npm` 前移到 `yarn`.

如果决定 `yarn` 不适合可以删除 `yarn.lock` 文件而继续使用原来的 `npm`.

如果正在使用 `npm-shrinkwrap.json` 文件可能导致不同的依赖环境,所有人同时前移到 `yarn` 可能比较方便,只需要删除`npm-shrinkwrap.json` 并自动生成`yarn.lock`文件.

|npm|yarn|
|-:-|-:-|
|`npm install`|`yarn add`|
|`npm install --no-package-lock`|`yarn add --no-lockfile`|
|`npm install [package] --save`|`yarn add [package]`|
|`npm install [package] --save-dev`|`yarn add [package] --dev`|
|`npm install [package] --save-optional`|`yarn add [package] --optional`|
|`npm install [package] --save-exact`|`yarn add [package] --exact`|
|`npm install [package] --global`|`yarn global add [package]`|
|`npm update --global`|`yarn global upgrade`|
|`npm rebuild`|`yarn add --force`|
|`npm uninstall [package]`|`yarn remove [package]`|
|`npm cache clean`|`yarn cache clean [package]`|
|`rm -rf node_modules && npm install`|`yarn upgrade`|
|`npm version major`|`yarn version --major`|
|`npm version minor`|`yarn version --minor`|
|`npm version patch`|`yarn version --patch`|
