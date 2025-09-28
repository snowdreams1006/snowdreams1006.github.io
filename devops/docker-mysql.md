# docker + mysql

> https://hub.docker.com/_/mysql/


- 启动

```bash
docker run -p 3306:3306 --name mysql \
-v ~/mysql/conf:/etc/mysql \
-v ~/mysql/logs:/var/log/mysql \
-v ~/mysql/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:5.7.28
```

```bash
docker exec mysql whereis mysql
```

```bash
docker exec mysql ls /etc/mysql
```

```bash
docker cp mysql:/etc/mysql/my.cnf ~/mysql/conf/
```

- 链接 mysql

```bash
docker exec -it mysql bash
mysql -uroot -p123456
```

```sql
use mysql
```

```sql
select user,authentication_string from user;
```

```sql
update user set authentication_string=''  where user='root';
```

```sql
alter user 'root'@'%' IDENTIFIED BY 'root@alsk1029';
```

```sql
alter user 'root'@'localhost' IDENTIFIED BY 'root@alsk1029';
```

```sql
flush privileges;
```

```
host: 127.0.0.1
port: 3306
user: root
password: 123456
```

- 修改密码

```bash
docker exec -it mysql bash
mysqladmin -uroot -p123456 password 123
```

- [使用Docker搭建MySQL服务](https://www.cnblogs.com/sablier/p/11605606.html)
- [进入Docker容器中修改mysql密码](https://blog.csdn.net/weixin_41154636/article/details/99458050)
- [docker 安装报错 ERROR 1045 (28000): Access denied for user 'mysql'@'localhost' (using password: YES)解决方法](https://blog.csdn.net/zhldt2008/article/details/81127145)