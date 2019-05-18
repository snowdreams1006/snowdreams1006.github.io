# 搭建开发环境

> `Mac` 系统下搭建 `php` 开发环境

`Mac` 系统默认集成了很多开发工具,其中就包括 `php` 所需要的一些软件工具.

## `web` 服务器之 `apache`

`apache` 是一款 `web` 服务器,用于运行 `php` 文件,除了 `apache` 外也可以是 `nginx` 服务器.

> 默认情况下 `mac` 已经预装了 `apach` 服务,自然不用 `nginx` 服务器了.

### 常用命令

- 查看 `apache` 版本

> 语法: `apachectl -v`

示例:

```bash
$ apachectl -v
Server version: Apache/2.4.34 (Unix)
Server built:   Feb 22 2019 19:30:04
```

- 启动 `apache` 服务

> 语法: `sudo apachectl start`

示例:

```bash
$ sudo apachectl start
Password:
```

- 停止 `apache` 服务

> 语法: `sudo apachectl stop`

示例:

```bash
$ sudo apachectl stop
```

- 重启 `apache` 服务

> 语法: `sudo apachectl restart`

示例:

```bash
$ sudo apachectl restart
```

### 安装路径

> `apache` 默认安装于 `/private/etc/apache2` 目录,属于系统隐藏目录,可以在**终端**中直接进入也可以在**访达**中直接前往文件夹.

示例:

```bash
$ tree /private/etc/apache2
/private/etc/apache2
├── extra
│   ├── httpd-autoindex.conf
│   ├── httpd-autoindex.conf~previous
│   ├── httpd-dav.conf
│   ├── httpd-dav.conf~previous
│   ├── httpd-default.conf
│   ├── httpd-default.conf~previous
│   ├── httpd-info.conf
│   ├── httpd-info.conf~previous
│   ├── httpd-languages.conf
│   ├── httpd-languages.conf~previous
│   ├── httpd-manual.conf
│   ├── httpd-manual.conf~previous
│   ├── httpd-mpm.conf
│   ├── httpd-mpm.conf~previous
│   ├── httpd-multilang-errordoc.conf
│   ├── httpd-multilang-errordoc.conf~previous
│   ├── httpd-ssl.conf
│   ├── httpd-ssl.conf~previous
│   ├── httpd-userdir.conf
│   ├── httpd-userdir.conf~previous
│   ├── httpd-vhosts.conf
│   ├── httpd-vhosts.conf~previous
│   └── proxy-html.conf
├── httpd.conf
├── httpd.conf.pre-update
├── httpd.conf~previous
├── magic
├── mime.types
├── original
│   ├── extra
│   │   ├── httpd-autoindex.conf
│   │   ├── httpd-dav.conf
│   │   ├── httpd-default.conf
│   │   ├── httpd-info.conf
│   │   ├── httpd-languages.conf
│   │   ├── httpd-manual.conf
│   │   ├── httpd-mpm.conf
│   │   ├── httpd-multilang-errordoc.conf
│   │   ├── httpd-ssl.conf
│   │   ├── httpd-userdir.conf
│   │   ├── httpd-vhosts.conf
│   │   └── proxy-html.conf
│   └── httpd.conf
├── other
│   └── php7.conf
└── users
    └── Guest.conf

5 directories, 43 files
```

如果想要修改项目部署路径以及服务器端口等自定义配置,可打开 `/private/etc/apache2/httpd.conf` 文件进行编辑,如果权限不足,要么提升权限要么复制到别处修改好再替换掉原来的配置文件.

配置文件一旦修改,请一定要**重启**服务器,不然并不会生效!

> `vim` 搜索文件内容时临时高亮设置: `:set hlsearch` ,取消高亮设置: `:set nohlsearch` .

- 修改项目部署路径

> `DocumentRoot` : 默认部署路径于 `/Library/WebServer/Documents`

终端输入 `vim` 命令查找并编辑目标节点.

```bash
$ vim /private/etc/apache2/httpd.conf
```

> 输入 `vim /private/etc/apache2/httpd.conf` 进入命令行模式,输入 `:/DocumentRoot` 从头搜索文件内容,紧接着输入 `n` 表示查找下一项匹配字符,`N` 表示查找上一项匹配内容.

![php-setup-environment-mac-apache-DocumentRoot.png](./images/php-setup-environment-mac-apache-DocumentRoot.png)

> 如果不熟悉 `vim` 语法也可以选择熟悉的编辑器打开 `httpd.conf` 配置文件进行修改配置.

- 修改项目部署端口

> `Listen` : 默认监听端口 80

如果端口冲突的话,可以修改成其他端口,80 端口的好处在于可以直接访问服务器地址而不用显示带上端口号.

```
# 等价于 http://localhost:80
http://localhost 

# 等价于 http://127.0.0.1:80
http://127.0.0.1
```

![php-setup-environment-mac-apache-listen-port.png](./images/php-setup-environment-mac-apache-listen-port.png)

### 部署路径

默认情况下,`apache` 的部署路径位于 `/Library/WebServer/Documents` ,除非你更改了 `httpd.conf#DocumentRoot` 的节点配置.

```bash
$ tree /Library/WebServer/Documents
/Library/WebServer/Documents
├── PoweredByMacOSX.gif
├── PoweredByMacOSXLarge.gif
├── index.html.en
└── index.html.en~orig

0 directories, 4 files
```

当然你可以通过访达直接前往 `/Library/WebServer/Documents` 目录或者 `open /Library/WebServer/Documents` 直接调用内置程序打开目录.

![php-setup-environment-mac-apache-Documents.png](./images/php-setup-environment-mac-apache-Documents.png)

> 如果非要一步一步找到部署路径,打开 **访达** 后选择左侧最下方的本地光盘(个人用户名称),然后依次选择 `Machintosh HD > 资源库 (Library)  >  WebServer > Documents` 

## 世界上最好的语言之 `php`

`php` 在行业内赢得"世界上最好的语言"称号,自嘲为"拍簧片".不管怎样,既然我们决定 `pai(拍)huang(簧)pian(片)` ,那总要配置一下 `php` 的基本环境吧!

`Mac` 系统一如既往内置了 `php` 环境,不用我们费心去安装 `php` 了,现在看一下 `php` 的基本信息吧!

