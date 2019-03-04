# 安装
`git` 目前支持 Linux/Unix、Solaris、Mac和 Windows 平台上运行.

[git 官网下载地址](http://git-scm.com/downloads)

## Linux 系统
linux 系统安装软件大致有两种途径,一种是利用安装包管理工具安装,另一种采用源码包安装方式.

### Debian/Ubuntu
```
$ apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
  libz-dev libssl-dev

$ apt-get install git

$ git --version
```

### Centos/RedHat
```
$ yum install curl-devel expat-devel gettext-devel \
  openssl-devel zlib-devel

$ yum -y install git-core

$ git --version
```
### 源码安装

#### Debian/Ubuntu
```
$ apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
  libz-dev libssl-dev

$ tar -zxf git-1.7.2.2.tar.gz

$ cd git-1.7.2.2

$ make prefix=/usr/local all

$ sudo make prefix=/usr/local install  
```
#### Centos/RedHat
```
$ yum install curl-devel expat-devel gettext-devel \
  openssl-devel zlib-devel

$ tar -zxf git-1.7.2.2.tar.gz

$ cd git-1.7.2.2

$ make prefix=/usr/local all

$ sudo make prefix=/usr/local install  
```
## Windows 系统


## Mac 系统

