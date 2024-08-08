# 设置终端代理环境

- [设置Windows系统的cmd命令行终端的代理](https://www.cnblogs.com/pengpengboshi/p/17188143.html)

```bat
rem 使用sock5代理
rem socks5://127.0.0.1:1080
set http_proxy=socks5://127.0.0.1:1080
set https_proxy=socks5://127.0.0.1:1080

rem 使用http代理
rem http://127.0.0.1:7890
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890

rem 如果你要取消设置
set http_proxy=
set https_proxy=

curl -I www.google.com
```