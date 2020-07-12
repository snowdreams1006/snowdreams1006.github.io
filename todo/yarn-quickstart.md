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