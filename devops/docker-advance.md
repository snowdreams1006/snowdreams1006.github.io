> [Docker 镜像使用](https://www.runoob.com/docker/docker-image-usage.html)

## 站在巨人肩膀上更新镜像

- 1. 使用镜像启动容器

```bash
docker run -t -i ubuntu:15.10 /bin/bash
```

- 2. 进入容器自定义操作

```bash
apt-get update
```

修改好自定义容器后, exit 退出容器

- 3. 提交新容器保存成镜像

```bash
docker commit -m="has update" -a="runoob" e218edb10161 runoob/ubuntu:v2
```

- 4. 查看新镜像并启动测试容器

```bash
docker run -t -i runoob/ubuntu:v2 /bin/bash
```

> docker images

## 顶天立地从零开创新镜像

- 1. 编写自己的 Dockerfile

> Dockerfile

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

- 人世间万物皆有来源: FROM

> FROM    centos:6.7

- 上级有令坚决去执行: RUN

> RUN     /bin/echo 'root:123456' |chpasswd

RUN：用于执行后面跟着的命令行命令。有以下俩种格式：

shell 格式：

```
RUN <命令行命令>
# <命令行命令> 等同于，在终端操作的 shell 命令。
```

exec 格式：

```
RUN ["可执行文件", "参数1", "参数2"]
# 例如：
# RUN ["./test.php", "dev", "offline"] 等价于 RUN ./test.php dev offline
```

COPY
复制指令，从上下文目录中复制文件或者目录到容器里指定路径

```
COPY [--chown=<user>:<group>] <源路径1>...  <目标路径>
COPY [--chown=<user>:<group>] ["<源路径1>",...  "<目标路径>"]
```

> [--chown=<user>:<group>]：可选参数，用户改变复制到容器内文件的拥有者和属组

<源路径>：源文件或者源目录，这里可以是通配符表达式，其通配符规则要满足 Go 的 filepath.Match 规则。例如：

COPY hom* /mydir/
COPY hom?.txt /mydir/
<目标路径>：容器内的指定路径，该路径不用事先建好，路径不存在的话，会自动创建。


> https://www.runoob.com/docker/docker-dockerfile.html

ADD
ADD 指令和 COPY 的使用格式一致（同样需求下，官方推荐使用 COPY）。功能也类似，不同之处如下：

ADD 的优点：在执行 <源文件> 为 tar 压缩文件的话，压缩格式为 gzip, bzip2 以及 xz 的情况下，会自动复制并解压到 <目标路径>。
ADD 的缺点：在不解压的前提下，无法复制 tar 压缩文件。会令镜像构建缓存失效，从而可能会令镜像构建变得比较缓慢。具体是否使用，可以根据是否需要自动解压来决定。

CMD
类似于 RUN 指令，用于运行程序，但二者运行的时间点不同:

CMD 在docker run 时运行。
RUN 是在 docker build。
作用：为启动的容器指定默认要运行的程序，程序运行结束，容器也就结束。CMD 指令指定的程序可被 docker run 命令行参数中指定要运行的程序所覆盖。

注意：如果 Dockerfile 中如果存在多个 CMD 指令，仅最后一个生效。

格式：

CMD <shell 命令> 
CMD ["<可执行文件或命令>","<param1>","<param2>",...] 
CMD ["<param1>","<param2>",...]  # 该写法是为 ENTRYPOINT 指令指定的程序提供默认参数


ENTRYPOINT
类似于 CMD 指令，但其不会被 docker run 的命令行参数指定的指令所覆盖，而且这些命令行参数会被当作参数送给 ENTRYPOINT 指令指定的程序。

但是, 如果运行 docker run 时使用了 --entrypoint 选项，此选项的参数可当作要运行的程序覆盖 ENTRYPOINT 指令指定的程序。

优点：在执行 docker run 的时候可以指定 ENTRYPOINT 运行所需的参数。

注意：如果 Dockerfile 中如果存在多个 ENTRYPOINT 指令，仅最后一个生效。

格式：

ENTRYPOINT ["<executeable>","<param1>","<param2>",...]

    

- 2. 基于 Dockerfile 构建镜像

```bash
docker build -t runoob/centos:6.7 .
```

- 3. 查看新镜像并启动测试容器

```bash
docker run -t -i runoob/ubuntu:v2 /bin/bash
```

## 不小心遗忘的镜像标签

```bash
docker tag 860c279d2fec runoob/centos:dev
```

## 端口映射

> docker ps

- `- P` : 是容器内部端口随机映射到主机的高端口

- `- p` : 是容器内部端口绑定到指定的主机端口

```bash
docker run -d -p 5000:5000 training/webapp python app.py
```

> docker run -d -p 127.0.0.1:5001:5000 training/webapp python app.py

默认都是绑定 tcp 端口,如果要绑定 UDP 端口,可以在端口后面加上 /udp

```bash
docker run -d -p 127.0.0.1:5000:5000/udp training/webapp python app.py
```

## 新建网络

> docker run -d -P --name runoob training/webapp python app.py

```bash
docker network create -d bridge test-net
```

使用网络

```bash
docker run -itd --name test1 --network test-net ubuntu /bin/bash
```

> docker run -itd --name test2 --network test-net ubuntu /bin/bash


进入容器

```bash
docker exec -it test1 /bin/bash
```

安装测试容器互联工具 ping

```bash
apt-get update
apt install iputils-ping
```

验证互联

```bash
ping test2
```

配置 dns

>  /etc/docker/daemon.json

```bash
docker run -it --rm ubuntu  cat etc/resolv.conf
```

手动指定

```bash
docker run -it --rm host_ubuntu  --dns=114.114.114.114 --dns-search=test.com ubuntu
```

-h HOSTNAME 或者 --hostname=HOSTNAME： 设定容器的主机名，它会被写到容器内的 /etc/hostname 和 /etc/hosts。

--dns=IP_ADDRESS： 添加 DNS 服务器到容器的 /etc/resolv.conf 中，让容器用这个服务器来解析所有不在 /etc/hosts 中的主机名。

--dns-search=DOMAIN： 设定容器的搜索域，当设定搜索域为 .example.com 时，在搜索一个名为 host 的主机时，DNS 不仅搜索 host，还会搜索 host.example.com。

> 解决windows系统无法对docker容器进行端口映射的问题






