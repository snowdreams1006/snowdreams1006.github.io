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

## 镜像操作

- 列出镜像

```bash
docker images
```

- 下载镜像

```bash
docker pull
```

- 查找镜像

```bash
docker search httpd
```

- 删除镜像

```bash
docker rmi hello-world
```

- 创建镜像

```bash
docker commit -m="updated" -a="snowdreams1006" eb3c83541f05 snowdreams1006/ubuntu
```

- 构建镜像

```
FROM    centos:6.7
MAINTAINER      Fisher "fisher@sudops.com"

RUN     /bin/echo 'root:123456' |chpasswd
RUN     useradd runoob
RUN     /bin/echo 'runoob:123456' |chpasswd
RUN     /bin/echo -e "LANG=\"en_US.UTF-8\"" >/etc/default/local
EXPOSE  22
EXPOSE  80
CMD     /usr/sbin/sshd -D
```

> Dockerfile

```bash
docker build -t runoob/centos:6.7 .
```

- 设置镜像标签

```bash
docker tag 860c279d2fec runoob/centos:dev
```

## web 应用

- 随机映射

```bash
docker run -d -P training/webapp python app.py
```

- 指定端口

```bash
docker run -d -p 5000:5000 training/webapp python app.py
```

- 指定地址

```bash
docker run -d -p 127.0.0.1:5001:5000 training/webapp python app.py
```

## 容器互联

- 命名容器

```bash
docker run -d -P --name runoob training/webapp python app.py
```

- 新建网络

```bash
docker network create -d bridge test-net
```

- 连接容器

```bash
docker run -itd --name test1 --network test-net ubuntu /bin/bash
```

