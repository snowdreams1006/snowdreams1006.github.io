# docker + gitlab

> https://hub.docker.com/r/gitlab/gitlab-ce

```bash
docker run --name gitlab -d -p 4433:443 -p 8000:80 -p 2222:22 --restart=always \
    -v ~/gitlab/config:/etc/gitlab \
    -v ~/gitlab/logs:/var/log/gitlab \
    -v ~/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce
```

- [GitLab Docker images](https://docs.gitlab.com/omnibus/docker/)
- [docker下gitlab安装配置使用(完整版)](https://www.jianshu.com/p/080a962c35b6)