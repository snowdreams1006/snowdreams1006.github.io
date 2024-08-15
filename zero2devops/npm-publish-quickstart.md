# npm更新发布插件体验

## 引言

在`Node.js`的生态系统中，`npm（Node Package Manager）`是不可或缺的一部分，它不仅是获取和管理Node.js项目依赖的核心工具，也是分享和发布自己开发的模块或库的关键平台。

由于一些长期不更新的依赖没有原作者没有及时更新,不得不需要重新开发,所以记录一下如何发布到`npm`的基本流程.

## 更新或发布

### 修改版本号

不管是首次发布还是后续更新,注意升级更新版本号。这是最基础也是最重要的一步!

npm遵循语义化版本控制（Semantic Versioning, SemVer）规范，版本号格式为: 主版本号.次版本号.修订号，分别表示不同的更新级别。

```bash
# 增加修订号（即第三位数字），用于小的bug修复
npm version patch

# 增加次版本号（即版本号的中间一位），用于添加了向下兼容的新功能时。
npm version minor

# 增加主版本号（即版本号的第一位），用于做了不兼容的API更改时。
npm version major
```

除了上述命令可以**直接修改版本号**,当然也可以手动编辑修改`package.json`文件中的`version`字段.

![](/assets/picgo/6a2de2cdcf505c302732a8183ba72382.png)

### 登录npm

在终端或命令行中，使用`npm login`命令登录到你的npm账户。你需要输入用户名、密码和邮箱地址。如果你已经配置了.npmrc文件或使用了npm的认证令牌，这个过程可能会自动完成。

```bash
npm login
```

> `npm notice Log in on http://registry.npm.taobao.org/`

![](/assets/picgo/82ea6e77cf1824ae538ef39c4167401a.png)

输入密码时不会显示到命令行环境中,需要注意别输错了.登录成功后可以使用`npm whoami`命令查看当前登录用户名.

有些情况下,可能之前会设置过国内镜像源,因此`npm login`命令登录到的环境就不是官方镜像源,需要重新切换回来.

```bash
# 查看当前镜像源
npm config get registry

# 设置国内淘宝镜像: 加速下载npm相关依赖
npm config set registry https://registry.npm.taobao.org

# 设置nodejs官方镜像: 可以使用npm login等命令
npm config set registry https://registry.npmjs.org
```

### 更新发布

在项目的根目录下（即包含`package.json`的目录），运行`npm publish`命令。

`npm`会自动检查`package.json`中的信息，验证包的内容，然后将包上传到npm仓库。

![](/assets/picgo/cd28f22b8e76c6867682bb0918b991a5.png)

## 验证使用

登录`npm`官方搜索查看npm是否已成功更新发布: [gitbook-plugin-readmore](https://www.npmjs.com/package/gitbook-plugin-readmore)

![](/assets/picgo/bda634884a2ae46e19c47147c2eff752.png)

同样的,也可以`npm view gitbook-plugin-readmore versions`命令来验证新版本是否已成功发布。

![](/assets/picgo/13e36affc62367d6ae98449cabd72890.png)

> 使用过程中无法获取最新版本,检查`npm config get registry`看看是否是`npm`官方镜像.

![](/assets/picgo/2c861657b20e1718e7a7a52ac2684793.png)

```bash
npm install gitbook-plugin-readmore@latest
```

## 总结

本文主要介绍了如何更新发布`npm`包,只需要修改项目根目录下面的`package.json`配置文件的`version`字段,然后使用`npm login`命令登录到官方`nodejs`镜像站,最后`npm publish`等待发布成功.

- 检查当前npm镜像源环境

```bash
# 查看当前镜像源
npm config get registry

# 设置国内淘宝镜像: 加速下载npm相关依赖
npm config set registry https://registry.npm.taobao.org

# 设置nodejs官方镜像: 可以使用npm login等命令
npm config set registry https://registry.npmjs.org
```

- 登录到npm官方镜像

```bash
# 输入账号,密码,邮箱以及验证码按照提示进行登录
npm login

# 登录后查看当前用户名
npm whoami
```

- 按照规范修改版本号

```bash
# 增加主版本号（即版本号的第一位）
npm version major

# 增加次版本号（即版本号的中间一位）
npm version minor

# 增加修订号（即第三位数字）
npm version patch
```

- 更新发布到npm

```bash
# 自动检查无误后立即发布
npm publish

# 查看已发布的版本号
npm view <your-package-npm> versions

# 下载最新版本到本地
npm install <your-package-npm>@latest
```

在实际的操作过程中,`npm`可能由于网络问题无法登陆,可以设置网络代理的方式.

这里有个坑: 命令行环境和web环境不一致,明明网页已经设置好了系统代理,偏偏命令行环境不生效.

最后采用设置环境变量的方式可以临时解决这种问题:


```bat
rem 使用sock5代理
rem socks5://127.0.0.1:1080
set http_proxy=socks5://127.0.0.1:1080
set https_proxy=socks5://127.0.0.1:1080

rem 使用http代理
rem http://127.0.0.1:7890
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890

rem 如果你要取消设置
set http_proxy=
set https_proxy=

rem 测试是否能正确访问npm官网
curl -I https://www.npmjs.com/
```

![](/assets/picgo/bf213ce5d60cf226926c515aa1b83b81.png)
