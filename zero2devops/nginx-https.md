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
certbot certonly  -d *.snowdreams1006.cn --manual \
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

## 参考文档

- [User Guide](https://certbot.eff.org/docs/using.html)
- [centos7下docker部署nginx使用let's encrypt免费证书](https://blog.csdn.net/zxian610/article/details/78679743)
- [ImportError: No module named 'requests.packages.urllib3](https://blog.csdn.net/qq_41781322/article/details/90288555)
- [centos crontab详解](https://www.cnblogs.com/tiandi/p/7147031.html)
- [在Docker容器环境中用Let's Encrypt部署HTTPS](https://www.jianshu.com/p/5afc6bbeb28c)
- [Docker环境下自动更新Let’s Encrypt SSL证书](https://www.jianshu.com/p/ea090833f766)
- [申请 Let's Encrypt 通配符 HTTPS 证书](https://blog.51cto.com/wzlinux/2405940)
- [Centos通过acme申请Let’s Encrypt通配符HTTPS证书-简单粗暴](https://blog.hlogc.com/2019/07/19/centos%E9%80%9A%E8%BF%87acme%E7%94%B3%E8%AF%B7lets-encrypt%E9%80%9A%E9%85%8D%E7%AC%A6https%E8%AF%81%E4%B9%A6-%E7%AE%80%E5%8D%95%E7%B2%97%E6%9A%B4/)