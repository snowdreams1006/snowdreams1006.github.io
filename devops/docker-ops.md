# docker 操作

## docker login

```shell
sudo docker login --username=雪之梦技术驿站 registry.cn-hangzhou.aliyuncs.com
```

- config.json

```bash
cat ~/.docker/config.json
``

## docker pull

## docker images

## docker push

## 从零开始学习 docker

```shell
docker
```


```bash
docker
```

- 帮助命令

```bash
docker command --help
```

- 运行容器

> `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

```bash
docker run -it ubuntu /bin/bash
```

- 退出容器

> `exit`

- 查看容器

```bash
docker ps -a
```

- 启动容器

```bash
docker start b750bbbcfd88 
```

## 后台运行

```bash
docker run -itd --name ubuntu-test ubuntu /bin/bash
```

- 停止容器

```bash
docker stop <容器 ID>
```

- 重启容器

```bash
docker restart <容器 ID>
```

- 进入容器

> `docker attach` 和 `docker exec`

```bash
docker attach 1e560fca3906 
```

> 注意: 如果从这个容器退出,会导致容器的停止.

```bash
docker exec -it 243c32535da7 /bin/bash
```

- 导出容器

```bash
docker export 1e560fca3906 > ubuntu.tar
```

- 导入容器

```bash
docker import - test/ubuntu:v1
```

- 删除容器

```bash
docker rm -f 1e560fca3906
```

- 清理掉所有处于终止状态的容器

```bash
docker container prune
```

- 端口映射

```bash
docker port bf08b7f2cd89
```

- 查看容器日志

```bash
docker logs -f bf08b7f2cd89
```

- 查看容器进程

```bash
docker top wizardly_chandrasekhar
```