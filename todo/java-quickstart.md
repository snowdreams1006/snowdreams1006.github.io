# java 快速入门

## yum

```bash
yum search java
```

> `yum list java*`

```bash
yum install java-1.8.0-openjdk-devel.x86_64

java-1.8.0-openjdk.i686                     1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk.x86_64                   1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-accessibility.i686       1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-accessibility.x86_64     1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-demo.i686                1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-demo.x86_64              1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-devel.i686               1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-devel.x86_64             1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-headless.i686            1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-headless.x86_64          1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-javadoc.noarch           1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-javadoc-zip.noarch       1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-src.i686                 1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-src.x86_64               1:1.8.0.262.b10-0.el7_8      updates
```

```bash
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el6_9.x86_64
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin
```

```bash
source  /etc/profile
```

```bash
java -version
```

## tar.gz

```bash
mkdir /usr/local/java/

tar -zxvf jdk-8u171-linux-x64.tar.gz -C /usr/local/java/

vim /etc/profile
```

```bash
export JAVA_HOME=/usr/local/java/jdk1.8.0_171
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

```bash
source /etc/profile
```

```bash
ln -s /usr/local/java/jdk1.8.0_171/bin/java /usr/bin/java
```

```
java -version
```


## use

- check java

```bash
yum list installed | grep java

java-1.8.0-openjdk.x86_64             1:1.8.0.262.b10-0.el7_8         @updates  
java-1.8.0-openjdk-devel.x86_64       1:1.8.0.262.b10-0.el7_8         @updates  
java-1.8.0-openjdk-headless.x86_64    1:1.8.0.262.b10-0.el7_8         @updates  
javapackages-tools.noarch             3.4.1-11.el7                    @base     
python-javapackages.noarch            3.4.1-11.el7                    @base     
tzdata-java.noarch                    2020a-1.el7                     @updates
```

```bash
java -version

openjdk version "1.8.0_262"
OpenJDK Runtime Environment (build 1.8.0_262-b10)
OpenJDK 64-Bit Server VM (build 25.262-b10, mixed mode)
```

```bash
whereis java
java: /usr/bin/java /usr/lib/java /etc/java /usr/share/java /usr/share/man/man1/java.1.gz

which java
/usr/bin/java
```

```bash
echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

echo $JAVA_HOME

```

- search java

```bash
[root@snowdreams1006 datax]# yum list java*|grep java-1.8.0-openjdk
Repository epel is listed more than once in the configuration
java-1.8.0-openjdk.i686                     1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk.x86_64                   1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-accessibility.i686       1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-accessibility.x86_64     1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-demo.i686                1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-demo.x86_64              1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-devel.i686               1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-devel.x86_64             1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-headless.i686            1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-headless.x86_64          1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-javadoc.noarch           1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-javadoc-zip.noarch       1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-src.i686                 1:1.8.0.262.b10-0.el7_8      updates
java-1.8.0-openjdk-src.x86_64               1:1.8.0.262.b10-0.el7_8      updates
```

- install/uninstall java

```bash
yum install java-1.8.0-openjdk-devel.x86_64 -y
```

```bash
yum remove java-1.8.0-openjdk*  -y 
```

- config java

```bash
ls /usr/lib/jvm/
java
java-1.8.0
java-1.8.0-openjdk
java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
java-openjdk
jre
jre-1.8.0
jre-1.8.0-openjdk
jre-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
jre-openjdk
```

```bash
vim /etc/profile
```

```bash
# java
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
export JRE_HOME=$JAVA_HOME/jre 
export CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib 
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
```

```bash
source  /etc/profile
```

```bash
java -version
```

## ref docs

- [CentOS使用yum安装jdk](https://segmentfault.com/a/1190000015389941)
- [CentOS 7 安装 JAVA环境（JDK 1.8）](https://www.cnblogs.com/stulzq/p/9286878.html)
- [在CentOS7.4中安装jdk的几种方法及配置环境变量](https://blog.csdn.net/qq_32786873/article/details/78749384)