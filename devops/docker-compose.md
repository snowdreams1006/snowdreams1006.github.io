# docker compose

1. Run this command to download the current stable release of Docker Compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

2. Apply executable permissions to the binary:

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

3. Test the installation.

```bash
docker-compose --version
```

- [compose](https://docs.docker.com/compose/)
- [Docker-Compose安装（centos7环境）](https://blog.csdn.net/F_TimeOk/article/details/87861171)