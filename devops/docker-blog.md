# docker + blog

```bash
docker run --name blog -d -p 4000:80 --restart=always -v ~/blog:/usr/share/nginx/html nginx
```