# docker + crawlab


- 配置文件 `docker-compose.yml`

```yml
version: '3.3'
services:
  master: 
    image: tikazyq/crawlab:latest
    container_name: master
    environment:
      CRAWLAB_API_ADDRESS: "http://localhost:8000"
      CRAWLAB_SERVER_MASTER: "Y"
      CRAWLAB_MONGO_HOST: "mongo"
      CRAWLAB_REDIS_ADDRESS: "redis"
    ports:    
      - "8080:8080" # frontend
      - "8000:8000" # backend
    depends_on:
      - mongo
      - redis
  mongo:
    image: mongo:latest
    restart: always
    ports:
      - "27017:27017"
  redis:
    image: redis:latest
    restart: always
    ports:
      - "6379:6379"
```

- 启动命令

```bash
docker-compose up
```

- 访问地址

```bash
curl http://localhost:8080
```

## 文档

- [crawlab-team/crawlab](https://github.com/crawlab-team/crawlab)
- [Crawlab](http://docs.crawlab.cn/)
- [Docker安装部署](https://tikazyq.github.io/crawlab-docs/Installation/Docker.html)