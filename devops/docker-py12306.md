# docker + py12306

> [https://github.com/pjialin/py12306](https://github.com/pjialin/py12306)

1. 将配置文件下载到本地

```bash
mkdir py12306 && cd py12306
```

```bash
docker run --rm pjialin/py12306 cat /config/env.py > env.py
```

```bash
# tree
.
└── env.py
```

2. 修改好配置后运行

```bash
docker run --rm --name py12306 -p 8008:8008 -d -v $(pwd):/config -v py12306:/data pjialin/py12306
```

```bash
# tree
.
├── 12306.log
└── env.py
```

```bash
tail -f 12306.log
```

## docker-compose

- 复制配置文件

```bash
docker cp py12306:/code/docker-compose.yml.example docker-compose.yml
```

- 启动配置文件

```bash
docker-compose up -d
```

