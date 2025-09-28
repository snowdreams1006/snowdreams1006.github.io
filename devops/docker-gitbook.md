# docker + gitbook

## docker 

- 搜索镜像

```shell
docker search nginx
```

- 列出镜像

```shell
docker images
```

- 下载镜像

```shell
docker pull nginx
```

- 运行容器

```shell
docker ps
```

- 启动容器

```shell
docker run --name nginx-test -p 80:80 -d nginx
```

## 部署到 nginx

- 服务器创建 nginx 文件

```shell
mkdir -p ~/nginx/www ~/nginx/conf ~/nginx/logs
```

- 拷贝到容器内部

```shell
docker cp 6dd4380ba708:/etc/nginx/nginx.conf ~/nginx/conf
```

- 部署 nginx

```shell
docker run -d -p 80:80 --name blob.snodreams1006.cn -v ~/nginx/www:/usr/share/nginx/html -v ~/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v ~/nginx/logs:/var/log/nginx nginx
```

- 重新载入 nginx

```shell
docker kill -s HUP container-name
```

- 重启 nginx 容器

```shell
docker restart container-name
```

## 实际情况

- 安装 tree

```shell
yum install -y tree
```

- 启动容器

```shell
docker run --name blob.snodreams1006.cn -p 80:80 -d nginx
```

- 拷贝到容器内部

```shell
docker cp 6af3f4d1911c:/etc/nginx/nginx.conf ~/nginx/conf
```

- 停止容器

```shell
docker stop blob.snodreams1006.cn
```

- 上传服务器

```shell
scp -r /Users/snowdreams1006/Documents/workspace/snowdreams1006.github.io/_book/* root@121.40.223.69:~/nginx/www
```

- 部署 nginx

```shell
docker run -d -p 80:80 --name blob.snowdreams1006.cn -v ~/nginx/www:/usr/share/nginx/html -v ~/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v ~/nginx/logs:/var/log/nginx nginx
```


## 参考资料

- [Docker 安装 Nginx](https://blog.csdn.net/alangshan/article/details/90675525)
- [检查TCP 80端口是否正常工作](https://help.aliyun.com/document_detail/59367.html?spm=a2c4g.11186623.2.31.13f72976esK0p4)
- [安全组应用案例](
https://help.aliyun.com/document_detail/25475.html?spm=5176.2020520101.0.0.1cd94df5IffacN)
- [Docker 安装 Nginx](https://www.runoob.com/docker/docker-install-nginx.html)
- [Mac/Linux/Centos终端中上传文件到Linux云服务器](https://www.cnblogs.com/wangchaowei/p/6852339.html)