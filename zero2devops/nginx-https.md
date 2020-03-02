# 免费实现https访问网站

Let's Encrypt免费证书签发过程包含以下三个阶段：

1. 在本地服务器上安装Certbot，Certbot是签发/更新证书的客户端程序；
2. 运行Certbot获取SSL/TLS证书，证书有效期为3个月；
3. 设置定时脚本每周运行一次Certbot更新证书。如果证书有效期小于30天，Certbot会更新证书；

## 实际运行

- 安装 `certbot`

```bash
yum install -y epel-release certbot
```

- 申请证书

> 使用方法：certbot certonly --webroot -w [Web站点目录] -d [站点域名] -m [联系人email地址] --agree-tos

```bash
sudo certbot certonly --webroot -w ~/snowdreams1006.github.io -d snowdreams1006.cn -m snowdreams1006@163.com --agree-tos
```

> `pip install --upgrade --force-reinstall 'requests==2.6.0' urllib3`

证书位置:

```bash
tree /etc/letsencrypt/live/snowdreams1006.cn
/etc/letsencrypt/live/snowdreams1006.cn
├── cert.pem -> ../../archive/snowdreams1006.cn/cert1.pem
├── chain.pem -> ../../archive/snowdreams1006.cn/chain1.pem
├── fullchain.pem -> ../../archive/snowdreams1006.cn/fullchain1.pem
├── privkey.pem -> ../../archive/snowdreams1006.cn/privkey1.pem
└── README
```

```
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem
   Your cert will expire on 2020-02-17. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

- 查看命令有效期

```bash
openssl x509 -noout -dates -in /etc/letsencrypt/live/snowdreams1006.cn/cert.pem
```

- 定时自动更新

```bash
yum install -y vixie-cron crontabs
```

```bash
service crond status
```

```bash
service crond restart
```

```bash
# +---------------- minute  分钟(0 - 59)
# |  +------------- hour    小时(0 - 23)
# |  |  +---------- day     日期(1 - 31)
# |  |  |  +------- month   月份(1 - 12)
# |  |  |  |  +---- week    星期(0 - 7) (星期天=0 or 7)
# |  |  |  |  |
# *  *  *  *  *  要运行的命令
```
> 配置crontab，每月1号5时更新证书,并重启docker容器

```bash
00 05 01 * * sudo /usr/bin/certbot renew --quiet && sudo docker restart nginx
```

```bash
crontab -u //设定某个用户的cron服务，一般root用户在执行这个命令的时候需要此参数
crontab -l //列出某个用户cron服务的详细内容 　　 
crontab -r //删除没个用户的cron服务 　　 
crontab -e //编辑某个用户的cron服务
```

- 生成 PFS 键值

```bash
#创建目录
mkdir -p /etc/ssl/private/ 

#执行命令
cd /etc/ssl/private/

openssl dhparam 2048 -out dhparam.pem
```

- docker 启动 nginx


```bash
docker run --name nginx -d -p 80:80 -p 443:443 \
	-v ~/snowdreams1006.github.io:/usr/share/nginx/html \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /etc/ssl:/etc/ssl \
    nginx
```

```conf
server {
    listen      80;
    server_name snowdreams1006.cn www.snowdreams1006.cn;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name snowdreams1006.cn www.snowdreams1006.cn;
 	access_log  /var/log/nginx/access-blog.log main;
    error_log /var/log/nginx/error-blog.log warn;
    root ~/snowdreams1006.github.io;
    index  index.html index.htm;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
 
 	ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets on;

    ssl_buffer_size 8k;
	ssl_dhparam /etc/ssl/private/dhparam.pem;

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

    # 一般推荐使用的ssl_ciphers值: https://wiki.mozilla.org/Security/Server_Side_TLS
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128:AES256:AES:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK';
    ssl_prefer_server_ciphers on;

	location / {
        #security headers
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload";
        add_header X-XSS-Protection "1; mode=block" always;
        add_header X-Content-Type-Options "nosniff" always;
        add_header X-Frame-Options "DENY" always;
        #CSP
        add_header Content-Security-Policy "frame-src 'self'; default-src 'self'; script-src 'self' 'unsafe-inline' https://maxcdn.bootstrapcdn.com https://ajax.googleapis.com; img-src 'self'; style-src 'self' https://maxcdn.bootstrapcdn.com; font-src 'self' data: https://maxcdn.bootstrapcdn.com; form-action 'self'; upgrade-insecure-requests;" always;
        add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    }

    location ~* ^.+\.(jpg|jpeg|gif|png|bmp|css|js|swf)$ {
        access_log off;
        #break;
    }
}
```

```bash
yum install -y bind-utils
```

```bash
dig www.baidu.com
```

```
# 注xxx.com请根据自己的域名自行更改
./certbot-auto --server https://acme-v02.api.letsencrypt.org/directory -d "*.xxx.com" --manual --preferred-challenges dns-01 certonly

./certbot-auto --server https://acme-v02.api.letsencrypt.org/directory -d "*.xxx.com" -d "xxx.com" --manual --preferred-challenges dns-01 certonly
```

```bash
certbot certonly -d snowdreams1006.cn -d *.snowdreams1006.cn --manual \
--preferred-challenges dns \
--server https://acme-v02.api.letsencrypt.org/directory
```

```
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn-0001/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn-0001/privkey.pem
   Your cert will expire on 2020-02-18. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

```
ls /etc/letsencrypt/live/snowdreams1006.cn/
```

## 最佳实践

- 添加 epel 源

```bash
curl -o /etc/yum.repos.d/epel-7.repo https://mirrors.aliyun.com/repo/epel-7.repo
```

- 安装 Certbot 工具

```bash
yum install -y certbot
```

- 申请证书

```bash
certbot certonly -d snowdreams1006.cn -d *.snowdreams1006.cn --manual \
--preferred-challenges dns \
--server https://acme-v02.api.letsencrypt.org/directory
```

- 配置 dns 解析

```
_acme-challenge.snowdreams1006.cn with the following value:

AioofHwGnTzH7J_sKQczQnYc2QcXde_4lj42VNKk6FA

Please deploy a DNS TXT record under the name
_acme-challenge.snowdreams1006.cn with the following value:

hKdp1-NVK9uSSZje3tePc_tLrh_d-LUhEUBVM6wlJhc

Before continuing, verify the record is deployed.
(This must be set up in addition to the previous challenges; do not remove,
replace, or undo the previous challenge tasks yet. Note that you might be
asked to create multiple distinct TXT records with the same name. This is
permitted by DNS standards.)
```

- 验证 dns 解析

```bash
dig -t txt _acme-challenge.snowdreams1006.cn
```

- 生成提示

```
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem
   Your cert will expire on 2020-02-18. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

 - We were unable to subscribe you the EFF mailing list because your
   e-mail address appears to be invalid. You can try again later by
   visiting https://act.eff.org.
```

```bash
tree /etc/letsencrypt
/etc/letsencrypt
├── accounts
│   └── acme-v02.api.letsencrypt.org
│       └── directory
│           └── 41c8e91d7dcd718b2f48c09ab9a32cc4
│               ├── meta.json
│               ├── private_key.json
│               └── regr.json
├── archive
│   └── snowdreams1006.cn
│       ├── cert1.pem
│       ├── chain1.pem
│       ├── fullchain1.pem
│       └── privkey1.pem
├── csr
│   └── 0000_csr-certbot.pem
├── keys
│   └── 0000_key-certbot.pem
├── live
│   ├── README
│   └── snowdreams1006.cn
│       ├── cert.pem -> ../../archive/snowdreams1006.cn/cert1.pem
│       ├── chain.pem -> ../../archive/snowdreams1006.cn/chain1.pem
│       ├── fullchain.pem -> ../../archive/snowdreams1006.cn/fullchain1.pem
│       ├── privkey.pem -> ../../archive/snowdreams1006.cn/privkey1.pem
│       └── README
├── renewal
│   └── snowdreams1006.cn.conf
└── renewal-hooks
    ├── deploy
    ├── post
    └── pre

15 directories, 16 files
```

- 查看命令有效期

```bash
openssl x509 -noout -dates -in /etc/letsencrypt/live/snowdreams1006.cn/cert.pem
```

- 设置定时任务自动更新

> 配置 crontab，每月1好5时更新证书，并重启docker容器

```bash
00 01 01 * * sudo /usr/bin/certbot renew --quiet && sudo docker restart nginx
```

- 生成 PFS 键值

```bash
#创建目录
mkdir -p /etc/ssl/private/ 

#执行命令
cd /etc/ssl/private/

openssl dhparam 2048 -out dhparam-2048.pem
```

- 配置 nginx

```conf
server {
    listen 443 ssl http2;
    server_name  snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    index index.html index.htm;
    root  /usr/share/nginx/html/;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
    
    ssl_dhparam /etc/ssl/private/dhparam-2048.pem;
}

server {
    listen          80;
    server_name snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}
```

- 启动 nginx

```bash
docker run -p 80:80 -p 443:443 \
    -v ~/snowdreams1006.github.io:/usr/share/nginx/html \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /etc/ssl:/etc/ssl \
    nginx    
```

```bash
docker run --name nginx -d -p 80:80 -p 443:443 \
    -v ~/snowdreams1006.github.io:/usr/share/nginx/html \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /etc/ssl:/etc/ssl \
    nginx    
```

```bash
docker run -d -p 8888:80 -v ~/test:/usr/share/nginx/html nginx 
```

- 端口转发

```
server {
    listen 443 ssl http2;
    server_name  snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    index index.html index.htm;
    root  /usr/share/nginx/html/;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;

    ssl_dhparam /etc/ssl/private/dhparam-2048.pem;
}

server {
    listen          80;
    server_name snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name  artipub.snowdreams1006.cn;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;

    ssl_dhparam /etc/ssl/private/dhparam-2048.pem;

    location / {
        proxy_pass http://172.16.166.99:8000;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {
    listen       80;
    server_name  artipub.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}
```

```
server {
    listen       80;
    server_name  test.snowdreams1006.cn;
    location / {
        proxy_pass http://127.0.0.1:8888;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

- 访问效果

- https://snowdreams1006.cn/
- https://www.snowdreams1006.cn/
- https://blog.snowdreams1006.cn/


## 宿主机 nginx

- nginx 默认目录

```bash
whereis nginx
```

- 添加安装源

```bash
sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
```

> 安装该rpm后，我们就能在/etc/yum.repos.d/ 目录中看到一个名为nginx.repo 的文件。

- 安装 nginx

```bash
sudo yum install -y nginx
```

- 启动 nginx

```bash
sudo systemctl start nginx.service
```

- 查看开机自启

```bash
sudo systemctl list-unit-files
```

```bash
systemctl list-unit-files | grep enable
```

- 设置开机自启动

```bash
sudo systemctl enable nginx.service
```

- 关闭开机自启

```bash
sudo systemctl disable nginx.service
```

- 查看 nginx 效果

```bash
curl http://www.example.com/
```

- 启动 nginx

```bash
nginx
```

- 测试配置文件

```bash
nginx -t
```

- 优雅重启

```bash
nginx -s reload
```

- 查看nginx 进程号

```bash
ps -ef |grep nginx
```

- 停止 nginx

```bash
nginx -s stop
```

```bash
kill -9 pid
```

- `/etc/nginx/nginx.conf`

```
user root;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;
}
```

- `/etc/nginx/conf.d/default.conf`

```
server {
    listen       80;
    server_name  snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name  snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    
    index index.html index.htm;
    root  /root/snowdreams1006.github.io;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;

    ssl_dhparam /etc/ssl/private/dhparam-2048.pem;

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
}

server {
    listen       80;
    server_name  test.snowdreams1006.cn;

    location / {
      proxy_pass http://172.16.166.99:4000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}

server {
  listen 443 ssl http2;
  server_name  test.snowdreams1006.cn;

  ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;

  ssl_dhparam /etc/ssl/private/dhparam-2048.pem;

  ssl_session_cache shared:SSL:1m;
  ssl_session_timeout  10m;
  ssl_ciphers HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers on;

  location / {
      proxy_pass https://172.16.166.99:4000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```

- 启动 docker 容器 nginx

```
server {
    listen       80;
    server_name  snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name  snowdreams1006.cn www.snowdreams1006.cn blog.snowdreams1006.cn;
    
    index index.html index.htm;
    root  /usr/share/nginx/html;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;

    ssl_dhparam /etc/ssl/private/dhparam-2048.pem;

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
}

server {
    listen       80;
    server_name  resume.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;  
}

server {
  listen 443 ssl http2;
  server_name  resume.snowdreams1006.cn;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;

  ssl_dhparam /etc/ssl/private/dhparam-2048.pem;

  ssl_session_cache shared:SSL:1m;
  ssl_session_timeout  10m;
  ssl_ciphers HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers on;

  location / {
      proxy_pass http://172.16.166.99:1006;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}

server {
    listen       80;
    server_name  artipub.snowdreams1006.cn;

    location / {
      proxy_pass http://172.16.166.99:8000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {
    listen       80;
    server_name  artipubapi.snowdreams1006.cn;

    location / {
      proxy_pass http://172.16.166.99:3000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

```bash
docker run -p 80:80 -p 443:443 \
    -v ~/snowdreams1006.github.io:/usr/share/nginx/html \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /etc/ssl:/etc/ssl \
    nginx   
```

```bash
docker run --name nginx -d -p 80:80 -p 443:443 \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /etc/ssl:/etc/ssl \
    nginx    
```


## 参考文档

- [User Guide](https://certbot.eff.org/docs/using.html)
- [centos7下docker部署nginx使用let's encrypt免费证书](https://blog.csdn.net/zxian610/article/details/78679743)
- [ImportError: No module named 'requests.packages.urllib3](https://blog.csdn.net/qq_41781322/article/details/90288555)
- [centos crontab详解](https://www.cnblogs.com/tiandi/p/7147031.html)
- [在Docker容器环境中用Let's Encrypt部署HTTPS](https://www.jianshu.com/p/5afc6bbeb28c)
- [Docker环境下自动更新Let’s Encrypt SSL证书](https://www.jianshu.com/p/ea090833f766)
- [申请 Let's Encrypt 通配符 HTTPS 证书](https://blog.51cto.com/wzlinux/2405940)
- [Centos通过acme申请Let’s Encrypt通配符HTTPS证书-简单粗暴](https://blog.hlogc.com/2019/07/19/centos%E9%80%9A%E8%BF%87acme%E7%94%B3%E8%AF%B7lets-encrypt%E9%80%9A%E9%85%8D%E7%AC%A6https%E8%AF%81%E4%B9%A6-%E7%AE%80%E5%8D%95%E7%B2%97%E6%9A%B4/)
- [centos 安装 dig](https://blog.csdn.net/u013397318/article/details/56024773)
- [CentOS 7，使用yum安装Nginx](https://www.centos.bz/2018/01/centos-7%EF%BC%8C%E4%BD%BF%E7%94%A8yum%E5%AE%89%E8%A3%85nginx/)
- [CentOS7中使用yum安装Nginx的方法](https://www.cnblogs.com/songxingzhu/p/8568432.html)
- [CertBot自签Let's Encrypt免费SSL单域名证书和泛域名证书](https://linuxops.org/blog/linux/certbot.html)