# java 快速入门

## oracle 

```
账号: 908344069@qq.com
密码: Java2019
```

## mac

```bash
snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % which java
/usr/bin/java

snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % whereis java
/usr/bin/java

snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % java -version

snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % /usr/libexec/java_home -V
Matching Java Virtual Machines (1):
    1.8.0_261, x86_64:	"Java SE 8"	/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home

snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % ls /Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home

COPYRIGHT				jmc.txt
LICENSE					jre
README.html				legal
THIRDPARTYLICENSEREADME-JAVAFX.txt	lib
THIRDPARTYLICENSEREADME.txt		man
bin					release
include					src.zip
javafx-src.zip
```

```bash
# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export PATH=$JAVA_HOME/bin:$PATH:.
```

```bash
snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % vim ~/.bash_profile
snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % source ~/.bash_profile
```

```bash
snowdreams1006@snowdreams1006deMacBook-Pro datax-web-2.1.2 % echo $JAVA_HOME
/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home
```

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

```bash
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
rpm -qa |grep -i jdk

copy-jdk-configs-3.3-10.el7_5.noarch
java-1.8.0-openjdk-headless-1.8.0.262.b10-0.el7_8.x86_64
java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
java-1.8.0-openjdk-devel-1.8.0.262.b10-0.el7_8.x86_64
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
ls -hltr /usr/bin/java

lrwxrwxrwx 1 root root 22 9月   7 20:54 /usr/bin/java -> /etc/alternatives/java

ls -hltr /etc/alternatives/java
lrwxrwxrwx 1 root root 73 9月   7 20:54 /etc/alternatives/java -> /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64/jre/bin/java

ls -hltr /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64/jre/bin/java
-rwxr-xr-x 1 root root 8.8K 8月   7 00:43 /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64/jre/bin/java
```

```bash
env |grep JAVA_HOME
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
```

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
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
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
- [在macOS系统中 下载、安装、使用Java8](https://www.jianshu.com/p/87c0ac0f1254)