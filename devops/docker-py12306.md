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

- 检测

```bash
python main.py -t
```

```bash
python main.py -t -n
```

## test

```bash
mkdir py12306 && cd py12306
```

```bash
docker run --rm pjialin/py12306 cat /config/env.py > env.py
```

```bash
docker run --rm --name py12306 -p 8008:8008 -d -v $(pwd):/config -v py12306:/data pjialin/py12306
```

```bash
docker run --rm --name py12306 -p 8008:8008 -d -v $(pwd):/config -v $(pwd)/data:/data pjialin/py12306
```

```bash
docker exec py12306 python main.py -c /config/env.py -t
```


