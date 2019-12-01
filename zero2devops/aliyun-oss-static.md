# 利用阿里云 OSS部署静态网站

```bash
$ ping snowdreams1006.tech -t 3
PING snowdreams1006.tech.w.kunlunca.com (36.158.216.227): 56 data bytes
64 bytes from 36.158.216.227: icmp_seq=0 ttl=54 time=25.075 ms
64 bytes from 36.158.216.227: icmp_seq=1 ttl=54 time=22.077 ms
64 bytes from 36.158.216.227: icmp_seq=2 ttl=54 time=21.125 ms

--- snowdreams1006.tech.w.kunlunca.com ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 21.125/22.759/25.075/1.683 ms
```

```yml
name: deploy to aliyun oss

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    # 切代码到 runner
    - uses: actions/checkout@v1
      with:
        submodules: true
    # 下载 git submodule
    - uses: srt32/git-actions@v0.0.3
      with:
        args: git submodule update --init --recursive
    # 使用 node:10
    - name: use Node.js 10.x
      uses: actions/setup-node@v1
      with:
        node-version: 10.x
    # npm install
    - name: npm install and build
      run: |
        npm install
        npm run build
      env:
        CI: true
    # 设置阿里云OSS的 id/secret，存储到 github 的 secrets 中
    - name: setup aliyun oss
      uses: manyuanrong/setup-ossutil@master
      with:
        endpoint: oss-cn-beijing.aliyuncs.com
        access-key-id: ${{ secrets.OSS_KEY_ID }}
        access-key-secret: ${{ secrets.OSS_KEY_SECRET }}
    - name: cp files to aliyun
      run: ossutil cp -rf .vuepress/dist oss://shanyue-blog/
```

```bash
name: MainWorkflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: actions/setup-node@v1
      with:
        node-version: "12.x"
    - name: Build Blog
      run: |
        npm install
        npm install -g hexo-cli
        hexo generate
    - uses: manyuanrong/setup-ossutil@v1.0
      with:
        # endpoint 可以去oss控制台上查看
        endpoint: "oss-cn-hongkong.aliyuncs.com"
        # 使用我们之前配置在secrets里面的accesskeys来配置ossutil
        access-key-id: ${{ secrets.ACCESS_KEY_ID }}
        access-key-secret: ${{ secrets.ACCESS_KEY_SECRET }}
    - name: Deply To OSS
      run: ossutil cp public oss://enok-blog/ -rf
```

```bash
name: blog

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: actions/setup-node@v1
      with:
        node-version: "12.x"
    - name: Build blog
      run: |
        npm install -g gitbook-cli
        gitbook install
        gitbook build 
    - name: Upload blog
      uses: appleboy/scp-action@master
      env:
        HOST: ${{ secrets.HOST }}
        USERNAME: ${{ secrets.USERNAME }}
        KEY: ${{ secrets.KEY }}
      with:
        source: _book/*
        target: ~/blog
        rm: true
        strip_components: 1
    - name: Deploy blog
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.HOST }}
        username: ${{ secrets.USERNAME }}
        key: ${{ secrets.KEY }}
        script: |
          docker restart blog
    - uses: manyuanrong/setup-ossutil@v1.0      
      with:
        endpoint: oss-cn-hangzhou.aliyuncs.com
        access-key-id: ${{ secrets.ALI_ACCESS_KEY_ID }}
        access-key-secret: ${{ secrets.ALI_ACCESS_KEY_SECRET }}
    - name: Upload files to aliyun oss
      run: ossutil cp -rf ./_book oss://snowdreams1006/    
```

- [Github Action 部署博客到阿里云OSS](https://www.jianshu.com/p/99952652b2dd)
- [在阿里云OSS托管你的个人网站](https://shanyue.tech/op/deploy-fe-with-alioss.html#%E6%96%B0%E5%BB%BA-bucket-%E5%8F%8A%E8%AE%BE%E7%BD%AE)
- [manyuanrong/setup-ossutil](https://github.com/manyuanrong/setup-ossutil)

