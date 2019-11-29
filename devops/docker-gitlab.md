# docker + gitlab

> https://hub.docker.com/r/gitlab/gitlab-ce

```bash
docker run --name gitlab -d -p 4433:443 -p 8000:80 -p 2222:22 --restart=always \
    -v ~/gitlab/config:/etc/gitlab \
    -v ~/gitlab/logs:/var/log/gitlab \
    -v ~/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce
```

```conf
server {
    listen       80;
    server_name  ssh.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;  
}

server {
  listen 443 ssl http2;
  server_name  ssh.snowdreams1006.cn;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
 
  location / {
      proxy_pass http://172.16.166.99:2222;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}

server {
    listen       80;
    server_name  git.snowdreams1006.cn;
    return 301 https://$server_name$request_uri;  
}

server {
  listen 443 ssl http2;
  server_name  git.snowdreams1006.cn;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/snowdreams1006.cn/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/snowdreams1006.cn/privkey.pem;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

  location / {
      proxy_pass http://172.16.166.99:8000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```


- [GitLab Docker images](https://docs.gitlab.com/omnibus/docker/)
- [docker下gitlab安装配置使用(完整版)](https://www.jianshu.com/p/080a962c35b6)