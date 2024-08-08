# nginx 快速入门

```bash
brew search nginx

brew install nginx

brew uninstall nginx
```

```
To have launchd start nginx now and restart at login:
  brew services start nginx
Or, if you don't want/need a background service you can just run:
  nginx
==> Summary
🍺  /usr/local/Cellar/nginx/1.19.2: 25 files, 2.1MB
==> Caveats
==> nginx
Docroot is: /usr/local/var/www

The default port has been set in /usr/local/etc/nginx/nginx.conf to 8080 so that
nginx can run without sudo.

nginx will load all files in /usr/local/etc/nginx/servers/.

To have launchd start nginx now and restart at login:
  brew services start nginx
Or, if you don't want/need a background service you can just run:
  nginx

```

```
brew services start nginx
```

```
nginx
```

```
nginx -s reload
```

```
nginx  #启动nginx
nginx -s quit  #快速停止nginx
nginx -V #查看版本，以及配置文件地址
nginx -v #查看版本
nginx -s reload|reopen|stop|quit   #重新加载配置|重启|快速停止|安全关闭nginx
nginx -h #帮助
```

## 参考文档

- [MAC下安装nginx](https://segmentfault.com/a/1190000016020328)
- [mac下nginx的安装和配置](https://www.jianshu.com/p/026d67cc6cb1)
