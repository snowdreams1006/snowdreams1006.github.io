# docker + resume

```bash
docker exec nginx whereis nginx
```

```bash
docker exec nginx ls /usr/share/nginx/html
```

```bash
docker cp nginx:/usr/share/nginx/html/index.html ~/resume
```

```bash
docker run --name resume -d -p 1006:80 --restart=always -v ~/resume:/usr/share/nginx/html nginx
```

```conf
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
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  
  location / {
      proxy_pass http://172.16.166.99:1006;
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
curl https://resume.snowdreams1006.cn
```

```yml
name: resume.snowdreams1006.cn

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Upload resume
      uses: appleboy/scp-action@master
      env:
        HOST: ${{ secrets.HOST }}
        USERNAME: ${{ secrets.USERNAME }}
        KEY: ${{ secrets.KEY }}
      with:
        source: static,index.html,README.md,LICENSE
        target: /root/resume
        rm: true
    - name: Deploy resume
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.HOST }}
        username: ${{ secrets.USERNAME }}
        key: ${{ secrets.KEY }}
        script: |
          docker restart resume

```

```bash
curl https://resume.snowdreams1006.cn
```

