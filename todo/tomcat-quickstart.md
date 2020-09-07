# tomcat 快速入门

```bash
sudo mkdir -p /usr/local/tomcat/

sudo chmod +x ~/Downloads/apache-tomcat-8.5.57/bin/*.sh

sudo cp -r ~/Downloads/apache-tomcat-8.5.57 /usr/local/tomcat/
```

```bash
ls /usr/local/tomcat
```

```bash
# tomcat
export CATALINA_BASE=/usr/local/tomcat/apache-tomcat-8.5.57
export CATALINA_HOME=/usr/local/tomcat/apache-tomcat-8.5.57
export PATH=$CATALINA_HOME/bin:$PATH
```

```bash
catalina.sh version
```

## ref doc

- [MAC 安装 Maven](https://wangxin1248.github.io/life/2020/02/mac-install-maven.html)
- [Mac OS X下安装和配置Maven](https://juejin.im/entry/6844903780148838407)