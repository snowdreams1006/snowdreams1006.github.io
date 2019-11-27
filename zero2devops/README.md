# 从零开始搭建个人服务器

- nginx

```bash
docker run --name nginx -d -p 80:80 -p 443:443 --restart=always \
    -v ~/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
    -v ~/nginx/logs:/var/log/nginx \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /etc/ssl:/etc/ssl \
    nginx    
```

- bark

```bash
docker run --name bark -dt -p 8080:8080 --restart=always \
    -v ~/bark/data:/data \
    finab/bark-server
```

- webhook

```bash
docker run --name webhook -d -p 9000:9000 --restart=always \
    -v ~/webhook:/etc/webhook \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /usr/bin/docker:/usr/bin/docker \
    hongkongkiwi/webhook -verbose -hooks=/etc/webhook/hooks.json -hotreload
```

- resume

```bash
docker run --name resume -d -p 1006:80 --restart=always \
	-v ~/resume:/usr/share/nginx/html \
    nginx    
```

- blog

```bash
docker run --name blog -d -p 4000:80 --restart=always \
	-v ~/blog:/usr/share/nginx/html \
    nginx    
```
