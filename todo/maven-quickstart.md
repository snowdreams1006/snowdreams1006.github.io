# maven 快速入门

```bash
sudo mkdir -p /usr/local/maven/

sudo cp -r ~/Downloads/apache-maven-3.6.3 /usr/local/maven/
```

```bash
ls /usr/local/maven
```

```bash
# maven
export M2_HOME=/usr/local/maven/apache-maven-3.6.3
export PATH=$M2_HOME/bin:$PATH
```

```bash
mvn -version
```

## ref doc

- [MAC 安装 Maven](https://wangxin1248.github.io/life/2020/02/mac-install-maven.html)
- [Mac OS X下安装和配置Maven](https://juejin.im/entry/6844903780148838407)