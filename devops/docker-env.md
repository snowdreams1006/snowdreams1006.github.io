# docker 环境


[ `Docker` 官方文档](https://docs.docker.com/),[ `CentOS` 官方安装文档](https://docs.docker.com/install/linux/docker-ce/centos/).

> 注意: 以下方式安装的是社区免费版 `docker-ce`

## 前提条件

目前在Linux系统上安装Docker，对系统版本有以下要求：

- CentOS：7
- Debian：7.7(Wheezy LTS)、8.0(Jessie LTS)、9(Stretch)
- Fedora：24、25
- Ubuntu：16.04(Xenial LTS)、14.04(Trusty LTS)、17.04(Zesty)

通过 `uname -r` 命令查看内核版本

```shell
uname -r
```

## 安装 docker

- 移除旧版本

```shell
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

- 安装必要系统依赖

```shell
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

- 添加软件源信息

```shell
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

- 更新 yum 缓存

```shell
sudo yum makecache fast
```

- 安装 docker-ce

```shell
sudo yum -y install docker-ce
```

## 运行 docker

- 启动 docker

```shell
sudo systemctl start docker
```

- 测试 hello-world

```shell
docker run hello-world
```

## 镜像加速

> 镜像地址: `http://hub-mirror.c.163.com`

配置文件: `/etc/docker/daemon.json`

```json
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
```

## 卸载 docker

```shell
sudo yum remove docker-ce
sudo rm -rf /var/lib/docker
```

## 快速安装

- 安装

```shell
# step 1: 安装必要的一些系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Step 2: 添加软件源信息
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# Step 3: 更新并安装Docker-CE
sudo yum makecache fast
sudo yum -y install docker-ce

# Step 4: 开启Docker服务
sudo service docker start

# 注意：
# 官方软件源默认启用了最新的软件，您可以通过编辑软件源的方式获取各个版本的软件包。例如官方并没有将测试版本的软件源置为可用，您可以通过以下方式开启。同理可以开启各种测试版本等。
# vim /etc/yum.repos.d/docker-ee.repo
#   将[docker-ce-test]下方的enabled=0修改为enabled=1
#
# 安装指定版本的Docker-CE:
# Step 1: 查找Docker-CE的版本:
# yum list docker-ce.x86_64 --showduplicates | sort -r
#   Loading mirror speeds from cached hostfile
#   Loaded plugins: branch, fastestmirror, langpacks
#   docker-ce.x86_64            17.03.1.ce-1.el7.centos            docker-ce-stable
#   docker-ce.x86_64            17.03.1.ce-1.el7.centos            @docker-ce-stable
#   docker-ce.x86_64            17.03.0.ce-1.el7.centos            docker-ce-stable
#   Available Packages
# Step2: 安装指定版本的Docker-CE: (VERSION例如上面的17.03.0.ce.1-1.el7.centos)
# sudo yum -y install docker-ce-[VERSION]
```

- 验证

```shell
docker version
```

## 安装记录

- 卸载旧版本

```shell
[root@iZbp19ryeo103foh7nc3rmZ ~]# sudo yum remove docker \
                   docker-client \
                   docker-client-latest \
                   docker-common \
                   docker-latest \
                   docker-latest-logrotate \
                   docker-logrotate \
                   docker-engine
```

- 安装必要软件

```shell
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```

- 添加软件源

官方源

```
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

阿里源

```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

- 更新缓存

```shell
sudo yum makecache fast
```

- 安装 docker-ce

```shell
sudo yum install -y docker-ce docker-ce-cli containerd.io
```

- docker 版本

```shell
docker version
```

- 启动 docker

```shell
sudo systemctl start docker
```

- 查看状态

```shell
sudo systemctl status docker
```

- 测试 docker

```shell
sudo docker run hello-world
```

- 镜像加速

针对Docker客户端版本大于 1.10.0 的用户

> `/etc/docker/daemon.json`

阿里私人镜像地址:

例如：
公网Mirror：[系统分配前缀].mirror.aliyuncs.com

> `https://8upnmlh3.mirror.aliyuncs.com`


- docker info


重新加载

```shell
systemctl daemon-reload
```

重启 docker

```
sudo systemctl restart docker
```

## 参考资料

- [Get Docker Engine - Community for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
- [Linux（Centos版本）如何快速安装docker](https://mp.weixin.qq.com/s/tIVct-qXzGl3zZDQpwOfLA)
- [安装Docker](https://help.aliyun.com/document_detail/60742.html?spm=5176.2020520101.0.0.173d4df5FIWY8L)
- [官方镜像加速](https://help.aliyun.com/document_detail/60750.html?spm=5176.12818093.0.0.6db816d0JElLE4)
- [镜像仓库概述](https://cloud.tencent.com/document/product/457/9113)
