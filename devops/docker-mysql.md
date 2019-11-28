# docker + mysql

> https://hub.docker.com/_/mysql/


- 启动

```bash
docker run -p 3306:3306 --name mysql \
-v ~/mysql/conf:/etc/mysql \
-v ~/mysql/logs:/var/log/mysql \
-v ~/mysql/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:5.7
```

- 链接 mysql

```bash
docker exec -it mysql bash
mysql -uroot -p123456
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