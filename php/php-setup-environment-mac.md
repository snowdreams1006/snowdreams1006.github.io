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

如果说生产环境没有 `mysql` 的图形化工具也就罢了,但是如果日常开发时也不没有图形化工具的话,那就真的太不方便了.

这里推荐两个客户端工具,一个是人畜无害的 `Sequel Pro`,另一个则是 `php` 专属的 `phpMyAdmin`.

- `BS` 架构的 `phpMyAdmin`

> 下载地址 : [phpMyAdmin](https://files.phpmyadmin.net/phpMyAdmin/4.8.5/phpMyAdmin-4.8.5-all-languages.zip)

`phpMyAdmin` 是一款 `web` 版数据款管理软件,可以在浏览器中在线访问,像访问你的网站一样访问数据库.

![php-setup-environment-mac-mysql-client-phpMyAdmin.png](./images/php-setup-environment-mac-mysql-client-phpMyAdmin.png)

下载完成后解压并重命名为 `phpMyAdmin`,然后移动到 `apache` 的项目部署路径下,如果没有更改过默认的部署路径,那么应该是 `/Library/WebServer/Documents` 目录.

现在部署路径下不仅有个 `info.php` 文件还有 `phpMyAdmin` 文件夹.

```bash
# 仅仅显示两级文件目录
$ tree -L 2
.
├── PoweredByMacOSX.gif
├── PoweredByMacOSXLarge.gif
├── index.html.en
├── index.html.en~orig
├── info.php
└── phpMyAdmin
    ├── CODE_OF_CONDUCT.md
    ├── CONTRIBUTING.md
    ├── export.php
    ├── favicon.ico
    ├── gis_data_editor.php
    ├── import.php
    ├── import_status.php
    ├── index.php
    ├── view_operations.php
    └── yarn.lock

11 directories, 108 files
```

移动完成后先复制一份 `config.sample.inc.php` 文件并重命名为 `config.inc.php` 文件.

执行 `vim /Library/WebServer/Documents/phpMyAdmin/config.inc.php` 搜索并编辑 `host` 节点内容,将 `localhost` 更改成 `127.0.0.1` .

示例:

```
# 修改前
$cfg['Servers'][$i]['host'] = 'localhost';

# 修改后: 将 `localhost` 更改成 `127.0.0.1`
$cfg['Servers'][$i]['host'] = '127.0.0.1';
```

![php-setup-environment-mac-mysql-client-phpMyAdmin-config.png](./images/php-setup-environment-mac-mysql-client-phpMyAdmin-config.png)

重启 `apache` 服务,访问 [http://localhost/phpMyAdmin/](http://localhost/phpMyAdmin/) 开始登陆数据库吧!

![php-setup-environment-mac-mysql-client-phpMyAdmin-login.png](./images/php-setup-environment-mac-mysql-client-phpMyAdmin-login.png)

输入 `mysql` 的用户名和密码登录成功后就能管理本地数据库了.

![php-setup-environment-mac-mysql-client-phpMyAdmin-database.png](./images/php-setup-environment-mac-mysql-client-phpMyAdmin-database.png)

- `CS` 架构的 `Sequel Pro`

> 下载地址 : [v1.1.2 OS X 10.6 or Higher](https://github.com/sequelpro/sequelpro/releases/download/release-1.1.2/sequel-pro-1.1.2.dmg)

`Sequel Pro` 是简单易用的数据库管理工具,与上述的 `phpMyAdmin` 不同之处在于并不依赖 `php` 环境,可以独立安装部署.

![php-setup-environment-mac-mysql-client-SequelPro.png](./images/php-setup-environment-mac-mysql-client-SequelPro.png)

安装完成后输入数据库连接信息连接到本地数据库,参考信息如下.

![php-setup-environment-mac-mysql-client-SequelPro-config.png](./images/php-setup-environment-mac-mysql-client-SequelPro-config.png)

点击连接(`Connect`) 连接到本地服务器,由于刚才并没有选择数据库,因此登陆后需要选定数据库,这里根据实际情况选择即可.

![php-setup-environment-mac-mysql-client-SequelPro-database.png](./images/php-setup-environment-mac-mysql-client-SequelPro-database.png)

## `php` 集成 `mysql`

如果没有数据库提供持久化存储能力,那么 `php` 只能临时运行而没有记忆功能,所以想要记住网站大量信息自然离不开数据库.

### 准备测数据

为了接下来演示 `php` 集成 `mysql` 数据库,现在先创建一个测试数据库并插入一些测试数据.

下面主要是通过终端方式进行操作,小伙伴们也可以使用上述安装的图形化工具进行可视化编辑.

- 连接到本地服务器

> 语法 : `mysql -u <username> -p`

示例: 

```bash
# 连接到本地数据库,用户名 `root`,密码自定义
$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 109
Server version: 5.7.24 MySQL Community Server (GPL)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

- 列出当前数据库列表

> 语法 : `show databases`

示例:

```bash
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| security-plus      |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
```

- 创建测试数据库

> 语法 : `create database <databaseName>`

示例:

```bash
# 创建 `test` 数据库并指定编码格式为 `utf8`
mysql> create database IF NOT EXISTS test default charset utf8 COLLATE utf8_general_ci;
Query OK, 1 row affected (0.00 sec)

# 再次查询当前数据库列表,新增 `test` 数据库
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| security-plus      |
| sys                |
| test               |
+--------------------+
6 rows in set (0.00 sec)
```

- 列出当前数据表列表

> 语法 : ` show tables`

示例:

```bash
# 使用 `test` 测试数据库
mysql> use test;
Database changed

# 列出当前全部数据表
mysql> show tables;
Empty set (0.00 sec)
```

- 创建测试数据表

> 语法 : `create tabel <tableName> (<fieldName> <type>))`

```bash
# 创建 `user` 用户表
mysql> CREATE TABLE `test`.`user` (
       `id` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户 id',
       `name` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '姓名',
       PRIMARY KEY (`id`),
       UNIQUE INDEX `id_UNIQUE` (`id` ASC))
     ENGINE = InnoDB
     DEFAULT CHARACTER SET = utf8
     COMMENT = '用户表';
Query OK, 0 rows affected (0.01 sec)

# 再次列出当前数据表列表
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| user           |
+----------------+
1 row in set (0.00 sec)
```

- 查看数据表结构

> 语法 : `desc <tableName>`

示例:

```bash
mysql> desc user;
+-------+---------------------+------+-----+---------+----------------+
| Field | Type                | Null | Key | Default | Extra          |
+-------+---------------------+------+-----+---------+----------------+
| id    | bigint(11) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(45)         | NO   |     |         |                |
+-------+---------------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)
```

- 查看数据表创建语句

> 语法 : `show create table <tableName>`

示例:

```bash
mysql> show create table user \G
*************************** 1. row ***************************
       Table: user
Create Table: CREATE TABLE `user` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户 id',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表'
1 row in set (0.00 sec)
```

- 查询数据

> 语法 : `select [fields] from tableName [where condition] [limit N][ offset M]`

示例:

```bash
mysql> select id,name from user;
Empty set (0.00 sec)
```

- 插入数据

> 语法 : `insert into <tableName> ([fields]) VALUES ([values])`

示例:

```bash
mysql> INSERT INTO `test`.`user` (`name`) VALUES ('snowdreams1006');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `test`.`user` (`name`) VALUES ('雪之梦技术驿站');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO `test`.`user` (`name`) VALUES ('测试用户姓名');
Query OK, 1 row affected (0.00 sec)

mysql> select id,name from user;
+----+-----------------------+
| id | name                  |
+----+-----------------------+
|  1 | snowdreams1006        |
|  2 | 雪之梦技术驿站        |
|  3 | 测试用户姓名          |
+----+-----------------------+
3 rows in set (0.00 sec)
```

- 导出数据库

> 语法 : `mysqldump -u <username> -p <databaseName> > exportName.sql`

备份数据用到的是 `mysqldump` 工具,默认情况下该命令位于 `/usr/local/mysql/bin` 目录下,正常情况下需要指定该路径才能调用 `mysqldump` 命令.

```bash
$ tree /usr/local/mysql/bin
/usr/local/mysql/bin
├── innochecksum
├── lz4_decompress
├── my_print_defaults
├── myisam_ftdump
├── myisamchk
├── myisamlog
├── myisampack
├── mysql
├── mysql_client_test_embedded
├── mysql_config
├── mysql_config_editor
├── mysql_embedded
├── mysql_install_db
├── mysql_plugin
├── mysql_secure_installation
├── mysql_ssl_rsa_setup
├── mysql_tzinfo_to_sql
├── mysql_upgrade
├── mysqladmin
├── mysqlbinlog
├── mysqlcheck
├── mysqld
├── mysqld-debug
├── mysqld_multi
├── mysqld_safe
├── mysqldump
├── mysqldumpslow
├── mysqlimport
├── mysqlpump
├── mysqlshow
├── mysqlslap
├── mysqltest_embedded
├── mysqlxtest
├── perror
├── replace
├── resolve_stack_dump
├── resolveip
└── zlib_decompress

0 directories, 38 files
```

所以,应该是如下命令才能调用 `mysqldump` 命令.

```bash
$ /usr/local/mysql/bin/mysqldump --version
mysqldump  Ver 10.13 Distrib 5.7.24, for macos10.14 (x86_64)
```

不过这也太长了吧,肯定不是很不变,一劳永逸的方法是将 `/usr/local/mysql/bin` 加入到环境变量中就不用添加额外的路径信息了.

还记得 `mysql` 服务端刚安装完毕,我们想要通过终端连接到本地数据库服务器时设置了 `mysql` 的软链接,所以才能直接使用 `mysql -u root -p` 进行登录.

`mac` 的**软链接**方式相当于 `windows` 系统的**快捷方式**,只针对具体命令,现在需要 `mysqldump` 命令,继续使用软链接还要添加类似的快捷方式.

```bash
$ sudo ln -fs /usr/local/mysql/bin/mysql /usr/local/bin/mysql
$ sudo ln -fs /usr/local/mysql/bin/mysqldump /usr/local/bin/mysqldump
```

实测可用,但是这并不是优雅的操作方式,`/usr/local/mysql/bin/` 目录下那么多命令,下次需要用到其他命令岂不是要设置很多软链接?

```bash
$ mysqldump --version
mysqldump  Ver 10.13 Distrib 5.7.24, for macos10.14 (x86_64)
```

所以,现在我们考虑将 `/usr/local/mysql/bin` 加入到系统环境变量中,这样一来就能一劳永逸不用频繁设置软链接了!

![php-setup-environment-mac-mysql-path.png](./images/php-setup-environment-mac-mysql-path.png)

```bash
# mysql
export PATH=$PATH:/usr/local/mysql/bin
```

设置完毕后下次重启电脑就会生效,或者运行下述命令立即生效.

```bash
$ source ~/.bash_profile
```


示例:

mysqldump -u root -p  test > database_test.sql
