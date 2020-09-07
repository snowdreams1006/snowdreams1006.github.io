# tomcat 快速入门

- install

```bash
sudo mkdir -p /usr/local/tomcat/

sudo cp -r ~/Downloads/apache-tomcat-8.5.57 /usr/local/tomcat/

sudo chown -R `whoami`:staff /usr/local/tomcat/

sudo chmod u+x /usr/local/tomcat/apache-tomcat-8.5.57/bin/*.sh
```

- config

```bash
ls /usr/local/tomcat
```

```bash
# tomcat
export CATALINA_BASE=/usr/local/tomcat/apache-tomcat-8.5.57
export CATALINA_HOME=/usr/local/tomcat/apache-tomcat-8.5.57
export PATH=$CATALINA_HOME/bin:$PATH
```

- check

```bash
catalina.sh version

Using CATALINA_BASE:   /usr/local/tomcat/apache-tomcat-8.5.57
Using CATALINA_HOME:   /usr/local/tomcat/apache-tomcat-8.5.57
Using CATALINA_TMPDIR: /usr/local/tomcat/apache-tomcat-8.5.57/temp
Using JRE_HOME:        /Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home
Using CLASSPATH:       /usr/local/tomcat/apache-tomcat-8.5.57/bin/bootstrap.jar:/usr/local/tomcat/apache-tomcat-8.5.57/bin/tomcat-juli.jar
Server version: Apache Tomcat/8.5.57
Server built:   Jun 30 2020 21:49:10 UTC
Server number:  8.5.57.0
OS Name:        Mac OS X
OS Version:     10.15.5
Architecture:   x86_64
JVM Version:    1.8.0_261-b12
JVM Vendor:     Oracle Corporation
```

- start/stop

```bash
startup.sh

shutdown.sh
```

## ref doc

- [MAC 安装 Maven](https://wangxin1248.github.io/life/2020/02/mac-install-maven.html)
- [Mac OS X下安装和配置Maven](https://juejin.im/entry/6844903780148838407)