# docker + redis

> https://hub.docker.com/_/redis/

```
docker run -p 6379:6379 -v ~/redis/data:/data  -d redis redis-server --appendonly yes
```

```bash
docker exec -ti d0b86 redis-cli

docker exec -ti d0b86 redis-cli -h localhost -p 6379 
docker exec -ti d0b86 redis-cli -h 127.0.0.1 -p 6379 
docker exec -ti d0b86 redis-cli -h 172.17.0.3 -p 6379 
```

// 注意，这个是容器运行的ip，可通过 docker inspect redis_s | grep IPAddress 查看

```bash
docker run --name redis -d -p 6379:6379 --restart=always \
    -v ~/redis/data:/data \
    -v ~/redis/conf/redis.conf:/usr/local/etc/redis/redis.conf \
    -v ~/mysql/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123456 \
    redis redis-server /usr/local/etc/redis/redis.conf --appendonly yes
```

- [Docker安装redis](https://www.jianshu.com/p/2f95680f21c5)
- [Docker安装运行Redis](https://www.cnblogs.com/zhzhlong/p/9465670.html)