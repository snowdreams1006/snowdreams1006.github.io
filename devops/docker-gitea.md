# docker + gitea

> https://hub.docker.com/r/gitea/gitea

```bash
docker run --rm -d --name=gitea -p 2222:22 -p 8000:3000 -v ~/gitea:/data gitea/gitea:latest
```

> https://git.snowdreams1006.cn/install

```bash
docker run --name mysql -d -p 3306:3306 --restart=always \
    -v ~/mysql/conf:/etc/mysql \
    -v ~/mysql/logs:/var/log/mysql \
    -v ~/mysql/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123456 \
    mysql:5.7
```