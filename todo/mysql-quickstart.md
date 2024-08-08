# mysql 快速入门

- download

> [mysql-5.7.30-macos10.14-x86_64.dmg](https://downloads.mysql.com/archives/get/p/23/file/mysql-5.7.30-macos10.14-x86_64.dmg)

```bash
ls /usr/local/mysql
```

> `export PATH=${PATH}:/usr/local/mysql/bin`

```bash
echo $SHELL
```

```bash
snowdreams1006@snowdreams1006deMacBook-Pro bin % whereis mysql
snowdreams1006@snowdreams1006deMacBook-Pro bin % which mysql
mysql not found
```

```bash
# mysql
export MYSQL_HOME=/usr/local/mysql
export PATH=$MYSQL_HOME/bin:$PATH
```

```sql
mysql -uroot -p

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('新密码');
```

## ref doc

- [Mac 系统下安装配置MySQL的方法](https://zhuanlan.zhihu.com/p/27960044)
- [mac 安装mysql详细教程](https://www.jianshu.com/p/07a9826898c0)

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');