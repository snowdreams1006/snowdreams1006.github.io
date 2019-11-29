# docker + nginx

```bash
docker pull nginx    
```

```bash
docker run --name nginx --rm -p 80:80 -d nginx
```

```bash
docker stop nginx
```

```bash
docker exec nginx whereis nginx
```

```bash
docker exec nginx ls /etc/nginx
```

```bash
docker cp nginx:/etc/nginx/nginx.conf ~/nginx
```

```bash
yum install -y tree
```

```bash
docker exec nginx ls /etc/nginx/conf.d
```

```bash
docker cp nginx:/etc/nginx/conf.d ~/nginx/conf.d
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

```bash
docker stop nginx    
```

```bash
docker run --name nginx --rm -d -p 80:80 -p 443:443 \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    nginx    
```

```bash
curl -o /etc/yum.repos.d/epel-7.repo https://mirrors.aliyun.com/repo/epel-7.repo
```

```bash
yum install -y certbot
```

```bash
pip install --upgrade --force-reinstall 'requests==2.6.0' urllib3
```

```bash
certbot certonly -d *.snowdreams1006.cn -d snowdreams1006.cn --manual \
--preferred-challenges dns \
--server https://acme-v02.api.letsencrypt.org/directory
```

```
Please deploy a DNS TXT record under the name
_acme-challenge.snowdreams1006.cn with the following value:

2_F8ljNNjU_P6_fUVpaaB0A3QprSIiA4ODWvd77HFnQ

Before continuing, verify the record is deployed.
```

```
Please deploy a DNS TXT record under the name
_acme-challenge.snowdreams1006.cn with the following value:

Lwb2Ef3Fch7YFyG7iWDTRanoP3AyuUiYYgIIckCzGcQ

Before continuing, verify the record is deployed.
(This must be set up in addition to the previous challenges; do not remove,
replace, or undo the previous challenge tasks yet. Note that you might be
asked to create multiple distinct TXT records with the same name. This is
permitted by DNS standards.)
```

```bash
find / -type f -name ".certbot.lock" -exec rm {} \;
```

```bash
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem
   Your cert will expire on 2020-02-27. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

```
[root@snowdreams1006 nginx]# tree /etc/letsencrypt
/etc/letsencrypt
├── accounts
│   └── acme-v02.api.letsencrypt.org
│       └── directory
│           └── 4a7ed3e412c035edcf077438d642b1e7
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
│   ├── 0000_csr-certbot.pem
│   └── 0001_csr-certbot.pem
├── keys
│   ├── 0000_key-certbot.pem
│   └── 0001_key-certbot.pem
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

15 directories, 18 files
```

```bash
crontab -e
```

```bash
00 01 01 * * sudo /usr/bin/certbot renew --quiet && sudo docker restart nginx
```

```conf
server {
    listen       80;
    server_name  snowdreams1006.cn www.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name  snowdreams1006.cn www.snowdreams1006.cn;
    
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
}
```

```bash
docker run --name nginx --rm -d -p 80:80 -p 443:443 \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    nginx
```

## bark

```bash
docker run --name bark -dt -p 8888:8080 --restart=always \
    -v ~/bark/data:/data \
    finab/bark-server
```

```bash
curl http://0.0.0.0:8888/ping
```

```conf
server {
    listen       80;
    server_name  bark.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;  
}

server {
  listen 443 ssl http2;
  server_name  bark.snowdreams1006.cn;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

  location / {
      proxy_pass http://172.16.166.99:8888;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```

```bash
docker restart nginx
```

```bash
curl https://bark.snowdreams1006.cn/ping
```

## webhook

```bash
docker pull hongkongkiwi/webhook
```

```bash
docker run -d -p 9000:9000 --name=webhook \
	-v ~/webhook:/etc/webhook \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /usr/bin/docker:/usr/bin/docker \
  hongkongkiwi/webhook -verbose -hooks=/etc/webhook/hooks.json -hotreload
```

```json
[
  {
    "id": "query",
    "execute-command": "/etc/webhook/query.sh",
    "command-working-directory": "/etc/webhook",
    "response-message": "webhook.snowdreams1006.cn received successfully!"
  }
]
```

> `hooks.json`

```bash
#! /bin/sh

curl -i -X GET \
 "https://sc.ftqq.com/SCU67099T95840f46f3bad01fae1c893c968be0e25dd94acd8217a.send?text=%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%8F%88%E5%8F%91%E6%9D%A5%E6%96%B0%E6%B6%88%E6%81%AF%E5%95%A6!&desp=%E6%AC%A2%E8%BF%8E%E8%AE%BF%E9%97%AE%5B%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99%5D(https%3A%2F%2Fblob.snowdreams1006.cn%3FtokenId%3D$(uuidgen))%2C%E8%AF%B7%E5%85%B3%E6%B3%A8%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7%3A%E3%80%8C+%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99+%E3%80%8D+!%5Bwechat%3Asnowdreams1006%5D(https%3A%2F%2Fsnowdreams1006.github.io%2Fsnowdreams1006-wechat-public.jpeg)" 
```

> `query.sh`

```bash
chmod +x query.sh 
```

```bash
curl http://0.0.0.0:9000/hooks/query
```

```bash
curl https://webhook.snowdreams1006.cn/hooks/query
```

```conf
server {
    listen       80;
    server_name  webhook.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;  
}

server {
  listen 443 ssl http2;
  server_name  webhook.snowdreams1006.cn;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  
  location / {
      proxy_pass http://172.16.166.99:9000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```

```bash
docker restart nginx
```

```bash
curl https://webhook.snowdreams1006.cn/hooks/query
```

## blog

```bash
docker exec nginx whereis nginx
```

```bash
docker exec nginx ls /usr/share/nginx/html
```

```bash
docker cp nginx:/usr/share/nginx/html/index.html ~/blog
```

```bash
docker run --name blog -d -p 4000:80 --restart=always -v ~/blog:/usr/share/nginx/html nginx
```

```conf
server {
    listen       80;
    server_name  blog.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name  blog.snowdreams1006.cn;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

    location / {
      proxy_pass http://172.16.166.99:4000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

```bash
docker restart nginx
```

```bash
curl https://blog.snowdreams1006.cn
```



- [Nginx部署 Let’s Encrypt时报错：Another instance of Certbot is already running](http://lininn.cn/?post=297)
- [certbot/certbot](https://hub.docker.com/r/certbot/certbot)
- [quay.io/letsencrypt/letsencrypt:latest](https://quay.io/repository/letsencrypt/letsencrypt?tag=latest&tab=tags)
- [User Guide](https://certbot.eff.org/docs/using.html)
- [centos7下docker部署nginx使用let's encrypt免费证书](https://blog.csdn.net/zxian610/article/details/78679743)
- [ImportError: No module named 'requests.packages.urllib3](https://blog.csdn.net/qq_41781322/article/details/90288555)
- [centos crontab详解](https://www.cnblogs.com/tiandi/p/7147031.html)
- [在Docker容器环境中用Let's Encrypt部署HTTPS](https://www.jianshu.com/p/5afc6bbeb28c)
- [Docker环境下自动更新Let’s Encrypt SSL证书](https://www.jianshu.com/p/ea090833f766)
- [申请 Let's Encrypt 通配符 HTTPS 证书](https://blog.51cto.com/wzlinux/2405940)
- [Centos通过acme申请Let’s Encrypt通配符HTTPS证书-简单粗暴](https://blog.hlogc.com/2019/07/19/centos%E9%80%9A%E8%BF%87acme%E7%94%B3%E8%AF%B7lets-encrypt%E9%80%9A%E9%85%8D%E7%AC%A6https%E8%AF%81%E4%B9%A6-%E7%AE%80%E5%8D%95%E7%B2%97%E6%9A%B4/)
