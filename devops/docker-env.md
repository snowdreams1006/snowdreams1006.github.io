# docker 环境


[官方文档](https://docs.docker.com/)

## 前提条件

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
               docker-selinux \
               docker-engine-selinux \
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

## 参考资料

- [Linux（Centos版本）如何快速安装docker](https://mp.weixin.qq.com/s/tIVct-qXzGl3zZDQpwOfLA)
