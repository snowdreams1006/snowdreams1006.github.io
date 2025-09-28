# android studio 快速入门


> build.gradle

```
buildscript {
    
    repositories {
        maven{ url = "http://maven.aliyun.com/nexus/content/groups/public/" }
        google()
        jcenter()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.1.2'
        

        // NOTE: Do not place your application dependencies here; they belong
        // in the individual module build.gradle files
    }
}

allprojects {
    repositories {
        maven{ url = "http://maven.aliyun.com/nexus/content/groups/public/" }
        google()
        jcenter()
    }
}
```

> https://services.gradle.org/distributions/

```
把android studio先关掉。
打开.gradle/wrapper/dists目录，找到distributionUrl所指定的那个版本号文件夹。
1)从网上下载https://services.gradle.org/distributions/相应的 gradle-4.4-all.zip,放到文件夹里,并解压
2)把.part删除掉
3)创建 gradle-4.4-all.zip.ok (很关键!!!)
4)启动android studio，正常sync
```

```bash
snowdreams1006@snowdreams1006deMacBook-Pro mycustomer % tree ~/.gradle/wrapper/dists/gradle-4.10.2-all -L 3
/Users/snowdreams1006/.gradle/wrapper/dists/gradle-4.10.2-all
└── 9fahxiiecdb76a5g3aw9oi8rv
    ├── gradle-4.10.2
    │   ├── LICENSE
    │   ├── NOTICE
    │   ├── bin
    │   ├── docs
    │   ├── getting-started.html
    │   ├── init.d
    │   ├── lib
    │   ├── media
    │   ├── samples
    │   └── src
    ├── gradle-4.10.2-all.zip
    ├── gradle-4.10.2-all.zip.lck
    └── gradle-4.10.2-all.zip.ok

9 directories, 6 files
```

- [android stadio 编译报错：download fastutil-7.2.0.jar](https://blog.csdn.net/u013270444/article/details/88586074)
- [android studio的Gradle一直在sync的办法](https://www.jianshu.com/p/24a38f8400cc)