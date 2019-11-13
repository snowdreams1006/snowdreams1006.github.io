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

