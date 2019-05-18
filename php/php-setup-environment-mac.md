# 搭建开发环境

> `Mac` 系统下搭建 `php` 开发环境

`Mac` 系统默认集成了很多开发工具,其中就包括 `php` 所需要的一些软件工具.

## `web` 服务器之 `apache`

`apache` 是一款 `web` 服务器,用于运行 `php` 文件,除了 `apache` 外也可以是 `nginx` 服务器.

> 默认情况下 `mac` 已经预装了 `apach` 服务,自然不用 `nginx` 服务器了.

现在什么也没有配置的情况下,直接启动 `apache` 服务器看一下能否正常运行.

```bash
$ sudo apachectl start
```

![php-setup-environment-mac-apache-start.png](./images/php-setup-environment-mac-apache-start.png)

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

```
$ php -version
PHP 7.1.23 (cli) (built: Feb 22 2019 22:08:13) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies
```

`php` 是一种服务端脚本解释性语言,依赖于 `web` 服务器进行解析,所以 `php` 想要正常工作离不开上一步配置的 `apache` 服务器.

还记得 `apache` 配置文件的位置吗?

> `apache` 配置文件路径 : `/private/etc/apache2/httpd.conf`

![php-setup-environment-mac-apache-integration-php.png](./images/php-setup-environment-mac-apache-integration-php.png)

> 打开 `httpd.conf` 配置文件并搜索 `LoadModule php` 字符串,将前面的 `#` 去掉即可引入 `php` 支持,配置文件修改后记得重启才能生效哟!

是时候展示真正的技术了,现在万事俱备只待测试 `php` 到底有没有配置成功?!

在项目部署根目录下新建 `info.php` 测试文件,启动服务器后访问 [ 
http://localhost/info.php]( 
http://localhost/info.php) 如果能正常打印出 `php` 相关信息,那就证明 `php` 和 `apache` 整合无误,否则可能是某一步配置有误!

```php
<?php
phpinfo();
?>
```

![php-setup-environment-mac-apache-php-start.png](./images/php-setup-environment-mac-apache-php-start.png)

## 持久化存储之 `mysql` 数

`Mac` 系统并没有默认安装 `mysql` 服务,因此我们需要手动安装 `mysql` .

一般来说,我们谈到 `mysql` 数据库指的是 `mysql` 的服务端,作为生产环境服务端足够了并不需要客户端.

但是,日常开发中如果没有客户端我们很难直观管理数据,所以一般来说,我们还会安装 `mysql` 客户端,当然一般是各种功能强大的图形化工具.

### `mysql` 服务端

> 下载链接: [macOS 10.14 (x86, 64-bit), DMG Archive](https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.16-macos10.14-x86_64.dmg)

![php-setup-environment-mac-mysql-server-download.png](./images/php-setup-environment-mac-mysql-server-download.png)

和正常的软件安装一样,将安装文件移动到应用里即可完成,比 `Windows` 的下一步下一步安装还要方便快捷!

安装完成后,可以在**系统偏好设置**中找到 `MySQL` 图标,查看管理 `mysql` 服务端.

![php-setup-environment-mac-mysql-server-icon.png](./images/php-setup-environment-mac-mysql-server-icon.png)

点击 `MySQL` 图标,可以进行简单的设置以及重启服务等操作.

![php-setup-environment-mac-mysql-server-running.png](./images/php-setup-environment-mac-mysql-server-running.png)

但是如果想要在终端中**无痛**连接上 `mysql` 服务端,那么还需要一步设置**软链接**,类似于 `Windows` 的快捷方式.

```
$ sudo ln -fs /usr/local/mysql/bin/mysql /usr/local/bin/mysql
```

现在我们就可以在终端内愉快的连接上 `mysql` 服务端了呢!

```bash
# 登录 `mysql` 服务端
$ mysql -u root -p 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 29
Server version: 5.7.24 MySQL Community Server (GPL)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

# 查看当前数据库列表
mysql> show databases;
+---------------------+
| Database            |
+---------------------+
| information_schema  |
| mysql               |
| performance_schema  |
| security-plus       |
| sys                 |
| test                |
+---------------------+
6 rows in set (0.00 sec)

# 退出当前数据库会话
mysql> exit
Bye
$ 
```
- 查看 `mysql` 服务端版本

> 语法: `mysql --version`

示例:

```
$ mysql --version
mysql  Ver 14.14 Distrib 5.7.24, for macos10.14 (x86_64) using  EditLine wrapper
```

- 查看 `mysql` 服务端状态

> 语法: `sudo /usr/local/mysql/support-files/mysql.server status`

示例:

```
$ sudo /usr/local/mysql/support-files/mysql.server status
 SUCCESS! MySQL running (73088)
```

- 启动 `mysql` 服务端

> 语法: `sudo /usr/local/mysql/support-files/mysql.server start`

示例:

```
$ sudo /usr/local/mysql/support-files/mysql.server start
Starting MySQL
. SUCCESS! 
```

- 停止 `mysql` 服务端

> 语法: `sudo /usr/local/mysql/support-files/mysql.server stop`

示例:

```
$ sudo /usr/local/mysql/support-files/mysql.server stop
Shutting down MySQL
.. SUCCESS! 
```

- 重启 `mysql` 服务端

> 语法: `sudo /usr/local/mysql/support-files/mysql.server restart`

示例:

```
$ sudo /usr/local/mysql/support-files/mysql.server restart
Shutting down MySQL
. SUCCESS! 
Starting MySQL
. SUCCESS! 
```





### `mysql` 客户端